-- 1. 페르소나 맞춤 도서 (persona_books) 테이블 생성
CREATE TABLE IF NOT EXISTS public.persona_books (
    id SERIAL PRIMARY KEY,
    persona_key VARCHAR(50) NOT NULL, -- 'practical', 'explorer', 'dreamer', 'wanderer', 'adventurer'
    book_index INTEGER NOT NULL CHECK (book_index IN (1, 2)),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    price VARCHAR(50),
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    CONSTRAINT unique_persona_book UNIQUE (persona_key, book_index)
);

-- RLS 비활성화 (다른 테이블들과 동일하게 개발 편의성을 위해 비활성화)
ALTER TABLE public.persona_books DISABLE ROW LEVEL SECURITY;

-- 2. 초기 5대 페르소나별 2권씩 총 10권 도서 데이터 기입 (upsert)
INSERT INTO public.persona_books (persona_key, book_index, title, author, price, image_url)
VALUES
('practical', 1, '작은 습관의 힘', '한동훈', '15,500원', 'https://images.unsplash.com/photo-1588666309990-d68f08e3d4a6?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('practical', 2, '색채의 마술사들', '정아름', '22,000원', 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('explorer', 1, '사유하는 일상', '박지훈', '16,000원', 'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('explorer', 2, '고요한 밤의 산책자', '이서영', '13,800원', 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('dreamer', 1, '계절이 지나가는 하늘', '최연우', '12,000원', 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('dreamer', 2, '비 내리는 날의 라디오', '조민혁', '14,000원', 'https://images.unsplash.com/photo-1474366521946-c3d4b507abf2?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('wanderer', 1, '당신이 남긴 문장들', '김민철', '13,500원', 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200'),
('wanderer', 2, '밤을 걷는 문장들', '무라카미 하루키', '14,200원', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=200'),
('adventurer', 1, '골목길 유럽 투어', '유수진', '18,000원', 'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?ixlib=rb-4.0.3&auto=format&fit=crop&q=80&w=200'),
('adventurer', 2, '마음의 문을 여는 열쇠', '김도연', '14,500원', 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=200')
ON CONFLICT (persona_key, book_index) DO UPDATE SET
  title = EXCLUDED.title,
  author = EXCLUDED.author,
  price = EXCLUDED.price,
  image_url = EXCLUDED.image_url;
