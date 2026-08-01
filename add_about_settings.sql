-- 1. about_settings 테이블 생성
CREATE TABLE IF NOT EXISTS public.about_settings (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- RLS 비활성화 (모든 권한 허용)
ALTER TABLE public.about_settings DISABLE ROW LEVEL SECURITY;

-- 2. 초기 Seed 데이터 삽입 (About.html의 원래 기본값들)
INSERT INTO public.about_settings (key, value) VALUES
('hero_title', '우리는 책과 사람의
온기를 연결합니다'),
('hero_subtitle', '시간이 멈춘 공간, 깊은 사유의 숲으로 당신을 초대합니다.'),
('hero_desc', '독립서점은 단순히 책을 파는 곳이 아닌, 작가의 영혼과 독자의 내면이 만나 조용히 공명하는 은신처입니다.'),
('hero_image', 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000&auto=format&fit=crop'),

('tab1_title', '독립서점이 무엇인가요?'),
('tab1_subtitle', '대형 서점의 분류표에는 없는, 당신을 위한 이야기'),
('tab1_desc', '자본과 유통의 논리에서 벗어나 책방지기의 뚜렷한 가치관과 취향으로 채워진 공간입니다. 세상에 단 몇 권만 존재하는 독립출판물과 깊은 교감을 나눌 수 있습니다.'),

('tab1_slide1_image', 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=800&auto=format&fit=crop'),
('tab1_slide1_caption', '아늑한 서가'),
('tab1_slide2_image', 'https://images.unsplash.com/photo-1544928147-79a2dbc1f389?q=80&w=800&auto=format&fit=crop'),
('tab1_slide2_caption', '스탠드 불빛 아래의 시집'),
('tab1_slide3_image', 'https://images.unsplash.com/photo-1463320726281-696a485928c7?q=80&w=800&auto=format&fit=crop'),
('tab1_slide3_caption', '방명록 방명 기록'),

('tab2_biz1_title', '독립 출판 파트너십'),
('tab2_biz1_desc', '신진 작가들의 서정적이고 실험적인 텍스트를 발굴하고, 한 권의 아름다운 실물 책으로 세상에 빛을 보게 돕습니다.'),
('tab2_biz1_image', 'https://images.unsplash.com/photo-1544716278-e513176f20b5?q=80&w=800&auto=format&fit=crop'),

('tab2_biz2_title', '개인 맞춤형 도서 큐레이션'),
('tab2_biz2_desc', '독서 성향 분석을 통해 일상에 가장 필요한 영감과 문장을 선별하여 맞춤 배송해 드립니다.'),
('tab2_biz2_image', 'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?q=80&w=800&auto=format&fit=crop'),

('tab2_biz3_title', '인공지능 기반의 독서 라이프케어'),
('tab2_biz3_desc', '독서 취향을 추적하고, 완독률과 독서 습관을 정밀 분석하는 리브레 AI 솔루션을 연구하고 개발합니다.'),
('tab2_biz3_image', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=800&auto=format&fit=crop')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;
