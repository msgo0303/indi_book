-- 1. 메인 진열 관리 (curated_slots) 테이블 생성
CREATE TABLE IF NOT EXISTS public.curated_slots (
    id SERIAL PRIMARY KEY,
    slot_type VARCHAR(50) NOT NULL, -- 'bestseller', 'editor_pick'
    slot_index INTEGER NOT NULL,
    book_id INTEGER REFERENCES public.books(id) ON DELETE SET NULL,
    comment TEXT, -- 에디터 추천 도서의 감상평 코멘트
    created_at TIMESTAMPTZ DEFAULT now(),
    CONSTRAINT unique_curation_slot UNIQUE (slot_type, slot_index)
);

-- 2. 초기 8개 베스트셀러 및 4개 추천 도서 슬롯 예약 기입 (upsert)
DO $$
BEGIN
    FOR i IN 1..8 LOOP
        INSERT INTO public.curated_slots (slot_type, slot_index, book_id)
        VALUES ('bestseller', i, (SELECT id FROM public.books ORDER BY id LIMIT 1 OFFSET (i - 1) % (SELECT GREATEST(COUNT(*), 1) FROM public.books)))
        ON CONFLICT (slot_type, slot_index) DO NOTHING;
    END LOOP;

    FOR i IN 1..4 LOOP
        INSERT INTO public.curated_slots (slot_type, slot_index, book_id, comment)
        VALUES ('editor_pick', i, (SELECT id FROM public.books ORDER BY id LIMIT 1 OFFSET (i - 1) % (SELECT GREATEST(COUNT(*), 1) FROM public.books)), '책방지기가 추천하는 따뜻하고 평화로운 이야기를 읽어보세요.')
        ON CONFLICT (slot_type, slot_index) DO NOTHING;
    END LOOP;
END $$;
