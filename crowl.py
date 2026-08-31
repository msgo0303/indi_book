import os
import json
import time
import pandas as pd
import requests
from google import genai
from google.genai import types

# ==========================================
# 1. API 및 DB 접속 정보 설정
# ==========================================
ALADIN_TTB_KEY = "ttbgmdohci0111001"  # 전달해주신 알라딘 TTB Key
GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY", "")  # 발급받으신 Gemini API Key

SUPABASE_URL = "https://yjvfpzytiqzjqssqtbbf.supabase.co/rest/v1/books"
SUPABASE_KEY = "sb_publishable_CHzaCtQvts8YAzT4Wte2Cg_v5o99_pg"

# Gemini 클라이언트 초기화
client = genai.Client(api_key=GEMINI_API_KEY)

supabase_headers = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "return=representation"
}

# 우리 서점 전용 4대 장르
OUR_GENRES = ["소설", "에세이", "인문/교양", "시/희곡"]

# ==========================================
# 2. 알라딘 데이터 수집 함수
# ==========================================
def fetch_aladin_data(isbn):
    url = f"http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey={ALADIN_TTB_KEY}&itemIdType=ISBN13&ItemId={isbn}&output=js&Version=20131101&OptResult=toc"
    res = requests.get(url)
    if res.status_code != 200:
        return None
    
    data = res.json()
    if "item" not in data or len(data["item"]) == 0:
        return None
    
    item = data["item"][0]
    sub_info = item.get("subInfo", {})
    item_page = sub_info.get("itemPage", "")
    pages_text = f"{item_page}쪽" if item_page else ""

    return {
        "title": item.get("title", "").split(" - ")[0],
        "author": item.get("author", ""),
        "publisher": item.get("publisher", ""),
        "price": item.get("priceStandard", 0),
        "cover_image": item.get("cover", ""),
        "publish_date": item.get("pubDate", ""),
        "isbn": str(isbn),
        "table_of_contents": sub_info.get("toc", ""),
        "description_raw": item.get("description", ""),
        "pages": pages_text,
        "aladin_category": item.get("categoryName", "")
    }

# ==========================================
# 3. Gemini 기반 AI 가공 및 장르 분류 함수
# ==========================================
def generate_gemini_content(raw_book):
    prompt = f"""
    당신은 감성 독립서점 '오래된 서랍'의 책방지기입니다.
    아래 도서 원본 정보를 바탕으로 우리 서점 템플릿에 맞게 텍스트를 재작성해 주세요.

    [도서 원본]
    - 도서명: {raw_book['title']}
    - 저자: {raw_book['author']}
    - 알라딘 카테고리: {raw_book['aladin_category']}
    - 기본 소개글: {raw_book['description_raw']}
    - 목차: {raw_book['table_of_contents']}

    [작성 및 분류 규칙]
    1. genre: 반드시 다음 4개 장르 중 가장 적절한 '하나만' 정확히 고르세요: {OUR_GENRES}
    2. editor_comment: 책방지기 시선의 감성적인 한 줄 추천사 (1~2문장)
    3. description: 독자의 호기심을 부르는 매력적인 도서 상세 소개글 (2~3단락, 자연스러운 줄바꿈 포함)
    4. author_intro: 작가의 이력과 대표작을 정돈한 단락
    """

    # Gemini API 호출 (JSON 포맷 강제 출력 옵션 사용)
    response = client.models.generate_content(
        model='gemini-2.5-flash',
        contents=prompt,
        config=types.GenerateContentConfig(
            response_mime_type="application/json",
            response_schema={
                "type": "OBJECT",
                "properties": {
                    "genre": {"type": "STRING"},
                    "editor_comment": {"type": "STRING"},
                    "description": {"type": "STRING"},
                    "author_intro": {"type": "STRING"},
                },
                "required": ["genre", "editor_comment", "description", "author_intro"],
            }
        ),
    )
    
    return json.loads(response.text)

# ==========================================
# 4. 실행 메인 함수
# ==========================================
def main():
    # 스크립트 파일과 동일한 경로의 isbns.csv 읽기
    base_dir = os.path.dirname(os.path.abspath(__file__))
    csv_path = os.path.join(base_dir, "isbns.csv")

    try:
        df = pd.read_csv(csv_path, header=None, dtype=str)
        isbns = df[0].dropna().tolist()
    except Exception as e:
        print(f"❌ isbns.csv 파일을 읽을 수 없습니다. ({csv_path}) 파일이 존재하는지 확인해 주세요.")
        return

    print(f"🧪 [Gemini 기반 자동 등록] 총 {len(isbns)}개의 ISBN으로 등록을 시작합니다...\n")

    for idx, isbn in enumerate(isbns, 1):
        isbn = isbn.strip()
        print(f"[{idx}/{len(isbns)}] ISBN: {isbn} 처리 시작...")

        # 1. 알라딘 데이터 수집
        raw = fetch_aladin_data(isbn)
        if not raw:
            print(f"   ⚠️ 알라딘 정보 수집 실패 (ISBN 번호를 확인하세요)")
            continue

        # 2. Gemini 가공 (장르 분류 포함)
        ai = generate_gemini_content(raw)

        # 3. DB 전송 객체 구성
        book_payload = {
            "title": raw["title"],
            "author": raw["author"],
            "publisher": raw["publisher"],
            "genre": ai.get("genre", "소설"), # 4대 장르
            "price": raw["price"],
            "stock": 10,
            "cover_image": raw["cover_image"],
            "editor_comment": ai.get("editor_comment", ""),
            "description": ai.get("description", ""),
            "table_of_contents": raw["table_of_contents"],
            "author_intro": ai.get("author_intro", ""),
            "publish_date": raw["publish_date"],
            "pages": raw["pages"],
            "isbn": raw["isbn"]
        }

        # 4. Supabase DB 전송
        res = requests.post(SUPABASE_URL, headers=supabase_headers, json=[book_payload])

        if res.status_code in [200, 201]:
            print(f"   ✅ 성공! [{book_payload['genre']}] {book_payload['title']}")
        else:
            print(f"   ❌ DB 저장 실패 ({res.status_code}): {res.text}")

        time.sleep(0.5)

    print("\n🎉 작업 완료! 어드민 웹페이지를 새로고침하여 들어온 도서를 확인해 보세요.")

if __name__ == "__main__":
    main()