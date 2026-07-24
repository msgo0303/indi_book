-- 1. magazine_sections 테이블 생성
CREATE TABLE IF NOT EXISTS magazine_sections (
    key text PRIMARY KEY,
    data jsonb NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);

-- 2. RLS 비활성화 (누구나 조회/수정 가능하도록 설정)
ALTER TABLE magazine_sections DISABLE ROW LEVEL SECURITY;

-- 3. 초기 5개 탭의 기본 데이터 삽입 (기존 하드코딩 텍스트 기반)
INSERT INTO magazine_sections (key, data) VALUES
(
    'review',
    '{
        "stars": 5,
        "title": "삶의 쉼표가 되어준 단 한 권의 시집",
        "text": "이 책을 읽는 동안 방 안의 공기가 조용히 바뀌는 것을 느꼈습니다. 일상의 소음이 잦아들고, 오직 문장과 나만이 남겨진 듯한 깊은 몰입의 시간이었어요. 밑줄 긋고 싶은 문장이 너무 많아 결국 첫 장부터 다시 읽기 시작했습니다.",
        "author": "리뷰어 아이디 (user_***01)",
        "avatar": "U"
    }'::jsonb
),
(
    'midnight_reading',
    '{
        "vol": "Vol. 12",
        "title": "별이 빛나는 밤의 낭독",
        "description": "불이 꺼진 밤, 오직 스탠드 불빛 아래에서 깊은 텍스트를 함께 낭독하는 시간",
        "period": "2026.08.01 ~ 2026.08.22 (매주 토요일 밤 10시)",
        "location": "독립서점 본점 아늑한 서가실",
        "target": "밤의 사색을 즐기고 싶은 성인 독자 8명 선착순",
        "price": "35,000원 (음료 및 엄선 도서 포함)",
        "notice": "원활한 몰입을 위해 당일 모임 중 스마트폰은 잠시 보관함에 보관됩니다.",
        "image_url": "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=2128&auto=format&fit=crop"
    }'::jsonb
),
(
    'interview',
    '{
        "writer_name": "이라온 작가",
        "profile_image": "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop",
        "q1": "처음 독립출판을 시작하게 된 계기가 궁금합니다.",
        "a1": "거대한 유통망의 기준에 맞추기보다, 제 내면의 날것 그대로의 감정을 종이 위에 얹고 싶었습니다. 누군가의 입맛에 맞게 편집된 글이 아니라, 투박하더라도 저만의 목소리로 온전히 숨 쉬는 책을 만들고 싶었던 갈증이 가장 컸어요. 작은 책방 한구석에서 우연히 제 책을 발견해 줄 단 한 명의 독자를 상상하며 시작했습니다.",
        "q2": "이번 신작 시집에서 가장 애착이 가는 문장은 무엇인가요?",
        "a2": "‘흩어지는 밤을 모아 한 권의 책을 엮었다’는 구절입니다. 잠들지 못하고 뒤척이던 수많은 밤들, 불안과 외로움으로 부서지던 시간들이 결국 활자가 되어 하나의 물성으로 엮이는 과정을 가장 잘 표현한 문장이라고 생각해요. 아픈 시간도 결국은 기록할 만한 가치가 있다는 위로를 건네고 싶었습니다.",
        "q3": "독자들에게 라온 서점이 어떤 공간으로 남길 바라시나요?",
        "a3": "잠시 비를 피하듯 찾아와 마음에 온기를 채워가는 작은 처마 밑이었으면 합니다. 거창한 위로나 해답을 주지는 못하더라도, 진심이 담긴 책 한 권과 따뜻한 커피 한 잔이 머무는 곳. 문을 열고 나설 때는 들어올 때보다 발걸음이 아주 조금은 더 가벼워지기를 바하는 마음으로 매일 공간을 쓸고 닦습니다."
    }'::jsonb
),
(
    'community',
    '{
        "online_badge": "온라인 채널",
        "online_title": "새벽 다섯 시, 랜선 필사 클럽",
        "online_desc": "세상이 깨어나기 전 고요한 시간, 줌(Zoom)을 통해 접속해 각자의 책상에서 묵묵히 필사를 진행하는 아침 독서 루틴 추적 모임입니다. 카메라로 손과 노트만 비추어 참여의 부담을 낮췄습니다.",
        "online_time": "매일 AM 05:00 - 06:00",
        "online_target": "상시 모집중",
        "offline_badge": "오프라인 채널",
        "offline_title": "토요 에세이 합평회",
        "offline_desc": "서로의 서툰 글을 읽고 따뜻한 비평을 나누는 정기 공동체. 완벽한 문장보다 솔직한 마음에 귀 기울이며, 서로의 일상을 응원하는 다정한 독자이자 작가가 되어주는 시간입니다.",
        "offline_time": "격주 토요일 PM 02:00",
        "offline_location": "서점 2층 라운지"
    }'::jsonb
),
(
    'contest',
    '{
        "title": "독서 관련 빈티지 이미지 & 엽서 디자인 공모전",
        "period": "2026.08.15 까지 접수",
        "target": "책을 사랑하는 아티스트 및 독자 누구나",
        "criteria": "독서 감성을 자극하는 빈티지 무드의 디지털 그래픽 또는 아날로그 스케치",
        "award": "대상 1명 (서점 포인트 30만점 + 실제 매장 판매용 엽서 굿즈 제작 지원)"
    }'::jsonb
)
ON CONFLICT (key) DO UPDATE SET data = EXCLUDED.data, updated_at = now();
