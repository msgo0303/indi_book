-- 1. events 테이블 생성
CREATE TABLE IF NOT EXISTS events (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title text NOT NULL,
    date_info text NOT NULL,
    image_url text,
    description text,
    max_seats integer DEFAULT 10,
    created_at timestamp with time zone DEFAULT now()
);

-- 2. RLS 비활성화 (개발 편의를 위해 누구나 읽기/쓰기 가능하도록 설정)
ALTER TABLE events DISABLE ROW LEVEL SECURITY;

-- 3. 초기 이벤트 4건 데이터 삽입 (기존 하드코딩 데이터 기반)
INSERT INTO events (title, date_info, image_url, description, max_seats) VALUES
(
    '여름밤의 필사 모임',
    '2026.07.20 ~ 2026.08.10 (매주 목 19:30)',
    'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=800&auto=format&fit=crop',
    '매미 소리가 잦아드는 늦은 저녁, 시원한 차 한 잔과 함께 온전히 문장에 집중하는 시간을 가집니다. 좋아하는 책의 구절을 손으로 꾹꾹 눌러 쓰며 하루의 피로를 씻어보세요. 서로의 필사 노트를 공유하며 잔잔한 대화도 나눕니다.',
    15
),
(
    '나만을 위한 심야 책방',
    '매주 금요일 22:00 ~ 익일 02:00',
    'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=800&auto=format&fit=crop',
    '모두가 잠든 시간, 불이 꺼지지 않는 책방에서 온전한 고독을 즐겨보세요. 백색소음과 은은한 조명 아래서 책을 읽거나 밀린 다이어리를 씁니다. 입장 시 따뜻한 드립 커피 1잔이 제공됩니다.',
    10
),
(
    '이달의 작가 북토크',
    '2026.08.15 (토) 15:00 ~ 17:00',
    'https://images.unsplash.com/photo-1544928147-79a2dbc1f389?q=80&w=800&auto=format&fit=crop',
    '베스트셀러 <어느 날, 내 마음에 자리 잡은 것들>의 김하나 작가님을 모시고 이야기를 나눕니다. 책이 쓰이게 된 배경, 집필 과정의 비하인드 스토리, 그리고 독자들과의 Q&A 시간이 준비되어 있습니다. 종료 후 사인회가 이어집니다.',
    30
),
(
    '독립출판 워크숍 1기',
    '2026.09.01 ~ 2026.10.20 (총 8주 과정)',
    'https://images.unsplash.com/photo-1463320726281-696a485928c7?q=80&w=800&auto=format&fit=crop',
    '나만의 글을 한 권의 책으로 엮어내는 전 과정을 함께합니다. 기획부터 원고 작성, 인디자인 기초, 가제본 제작, 그리고 독립서점 입고 방법까지. 책방지기와 외부 전문가가 밀착 코칭합니다. 나만의 이야기를 세상에 꺼내어보세요.',
    8
);
