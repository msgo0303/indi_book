-- Postgres의 자동 생성 ID 일련번호(Sequence)를 현재 최대 ID 값 이후로 재정렬합니다.
-- 수동으로 Mock 데이터를 삽입했기 때문에 발생하는 일련번호 불일치 현상을 해결합니다.

-- 1. books 테이블 일련번호 재설정
SELECT setval(pg_get_serial_sequence('public.books', 'id'), COALESCE(MAX(id), 1)) FROM public.books;

-- 2. events 테이블 일련번호 재설정
SELECT setval(pg_get_serial_sequence('public.events', 'id'), COALESCE(MAX(id), 1)) FROM public.events;

-- 3. curations 테이블 일련번호 재설정
SELECT setval(pg_get_serial_sequence('public.curations', 'id'), COALESCE(MAX(id), 1)) FROM public.curations;
