-- 1. curation_questions (큐레이션 질문지 및 키워드 관리) 테이블 생성
CREATE TABLE IF NOT EXISTS public.curation_questions (
    id SERIAL PRIMARY KEY,
    label VARCHAR(100) NOT NULL,
    question TEXT NOT NULL,
    words TEXT[] NOT NULL,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- RLS 비활성화
ALTER TABLE public.curation_questions DISABLE ROW LEVEL SECURITY;

-- 초기 질문지 데이터 삽입
INSERT INTO public.curation_questions (id, label, question, words, sort_order) VALUES
(1, '과거의 나', '그때의 나는 어떤 마음에 가까웠나요?', ARRAY['#불안', '#외로움', '#무기력', '#부담감', '#지루함', '#평온', '#다정함', '#활기', '#설렘', '#자신감'], 1),
(2, '현재의 나', '지금의 나는 어떤 감정을 느끼고 있나요?', ARRAY['#불안', '#외로움', '#무기력', '#부담감', '#지루함', '#평온', '#다정함', '#활기', '#설렘', '#자신감'], 2),
(3, '미래의 나', '앞으로의 나는 어떤 상태이고 싶나요?', ARRAY['#불안', '#외로움', '#무기력', '#부담감', '#지루함', '#평온', '#다정함', '#활기', '#설렘', '#자신감'], 3)
ON CONFLICT (id) DO UPDATE SET
  label = EXCLUDED.label,
  question = EXCLUDED.question,
  words = EXCLUDED.words,
  sort_order = EXCLUDED.sort_order;

-- 2. system_settings (시스템 설정 - Webhook URL 등) 테이블 생성
CREATE TABLE IF NOT EXISTS public.system_settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- RLS 비활성화
ALTER TABLE public.system_settings DISABLE ROW LEVEL SECURITY;

-- 초기 Webhook URL 빈 값 삽입
INSERT INTO public.system_settings (key, value)
VALUES ('curation_webhook_url', '')
ON CONFLICT (key) DO NOTHING;
