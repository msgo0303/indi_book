-- books 테이블에 genre (도서 분류/장르) 컬럼 추가
ALTER TABLE public.books ADD COLUMN IF NOT EXISTS genre TEXT DEFAULT '소설';

-- 기존 시드 데이터 도서들에 장르 부여
UPDATE public.books SET genre = '소설' WHERE id = 1;
UPDATE public.books SET genre = '에세이' WHERE id = 2;
