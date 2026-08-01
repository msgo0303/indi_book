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
('tab2_biz3_image', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=800&auto=format&fit=crop'),

-- Tab 3 (북 큐레이션)
('tab3_title', '나의 인생책은 무엇일까?'),
('tab3_desc', '우연한 만남을 넘어, 과학적이고 감성적인 여정을 통해 찾게 될 당신만의 한 줄.'),
('tab3_pkg1_image', 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=600&auto=format&fit=crop'),
('tab3_pkg1_caption', '따뜻한 친환경 패키징과 손글씨 엽서'),
('tab3_pkg2_image', 'https://images.unsplash.com/photo-1476275466078-4007374efbbe?q=80&w=600&auto=format&fit=crop'),
('tab3_pkg2_caption', '영혼의 울림을 전하는 나만의 문장 배송'),
('tab3_pkg3_image', 'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=600&auto=format&fit=crop'),
('tab3_pkg3_caption', '당신을 위해 심혈을 기울여 고른 한 권의 인생책'),
('tab3_cta_title', '1회성 심층 분석 북 큐레이션'),
('tab3_cta_subtitle', 'DEEP ANALYSIS & SELECTION'),
('tab3_cta_desc', '매달 받아보는 구독 서비스와는 달리, 단 한 번 전문가의 집중적이고 다각적인 독서 성향 스캐닝을 통해 당신의 영혼에 완벽하게 맞닿는 한 권의 책과 심층 인지 분석 서적 리포트를 전달해 드리는 단독 특별 프로그램입니다.'),
('tab3_cta_btn_text', '심층 분석 큐레이션 신청하기'),

-- Tab 4 (리브레 AI)
('tab4_title', '리브레 AI'),
('tab4_desc', '독서의 가치를 현대적으로 확장하는 가상의 지능형 앱 서비스, 리브레 AI'),
('tab4_feat1_title', '취향 분석'),
('tab4_feat1_sub', '정밀 독서 성향 스캐너'),
('tab4_feat1_desc', '독자의 선호 단어와 어조 분석'),
('tab4_feat2_title', '상황별 추천'),
('tab4_feat2_sub', '시절과 감정 맞춤 추천'),
('tab4_feat2_desc', '상실, 위로, 모험 등 현재 마음에 어울리는 책 매칭'),
('tab4_feat3_title', '스마트 발췌'),
('tab4_feat3_sub', '에센셜 AI 아카이빙'),
('tab4_feat3_desc', '책을 읽는 도중 영감을 준 문장을 자동으로 수집 및 분류'),
('tab4_feat4_title', '도서 추적'),
('tab4_feat4_sub', '독서 습관 분석 대시보드'),
('tab4_feat4_desc', '완독 시간과 빈도를 추적하는 감성 통계 리포트')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;
