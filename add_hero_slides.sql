-- 1. hero_slides 테이블 생성
CREATE TABLE IF NOT EXISTS hero_slides (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    slide_index integer UNIQUE NOT NULL,
    badge text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    button_text text NOT NULL,
    link_url text NOT NULL,
    image_url text NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);

-- 2. RLS 비활성화
ALTER TABLE hero_slides DISABLE ROW LEVEL SECURITY;

-- 3. 초기 5개 히어로 롤링 배너 데이터 삽입 (기존 하드코딩 사양 기반)
INSERT INTO hero_slides (slide_index, badge, title, description, button_text, link_url, image_url) VALUES
(
    0,
    'New Arrival',
    '햇살이 머무는 자리,\n당신을 위한 첫 문장',
    '따스한 커피 한 잔과 함께 펼쳐보는 이번 달의 새로운 입고 도서들을 만나보세요. 마음을 데워줄 이야기들이 기다리고 있습니다.',
    '자세히 보기',
    'temp.html',
    'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&q=80&w=1200'
),
(
    1,
    'Monthly Picnic',
    '금요일 밤의\n심야 독서회',
    '매주 금요일, 작은 조명 아래 모여 서로의 밑줄을 공유합니다. 독립출판 작가들과 함께하는 프라이빗한 모임에 초대합니다.',
    '참여 신청하기',
    'temp.html',
    'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&q=80&w=1200'
),
(
    2,
    'Editor''s Note',
    '종이 냄새가 주는\n포근한 위로',
    '바쁘게 흘러가는 디지털 세상 속에서, 잠시 멈춰 서서 활자가 주는 온기를 느껴보세요. 책방지기가 고른 이달의 에세이 컬렉션.',
    '컬렉션 보기',
    'temp.html',
    'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&q=80&w=1200'
),
(
    3,
    'Archive',
    '누군가의 서재에서\n여행을 마친 책들',
    '돌고 돌아 다시 우리에게 온 중고 서적들. 앞선 독자의 다정한 메모가 담긴 특별한 책을 발견하는 기쁨을 누려보세요.',
    '돌고 돌아 책장',
    'temp.html',
    'https://images.unsplash.com/photo-1473186578172-c141e6798cf4?auto=format&fit=crop&q=80&w=1200'
),
(
    4,
    'Interview',
    '우리 동네\n작은 책방의 기록',
    '로컬 창작자들과 독립출판 제작자들의 깊은 이야기. 이번 주에는 ''안온한 날들''의 김민지 작가와 차 한 잔을 나누었습니다.',
    '인터뷰 읽기',
    'temp.html',
    'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=1200'
)
ON CONFLICT (slide_index) DO UPDATE SET
    badge = EXCLUDED.badge,
    title = EXCLUDED.title,
    description = EXCLUDED.description,
    button_text = EXCLUDED.button_text,
    link_url = EXCLUDED.link_url,
    image_url = EXCLUDED.image_url,
    updated_at = now();
