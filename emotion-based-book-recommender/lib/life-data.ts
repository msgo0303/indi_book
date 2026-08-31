export type Book = { title: string; author: string; tagline: string; reason: string; cover: string }

export const keywordGroups = [
  { label: '과거의 나', question: '그때의 나는 어땠는가?', words: ['#의기소침', '#압박감', '#순수한즐거움', '#외로움', '#열등감', '#벅찬성취', '#혼란스러움'] },
  { label: '현재의 나', question: '지금의 나는 무엇을 느끼는가?', words: ['#무기력과번아웃', '#조급함', '#잔잔한평온', '#공허함', '#답답한정체기', '#설레는몰입', '#버거운책임감'] },
  { label: '미래의 나', question: '앞으로의 나는 어떻게 느끼고 싶은가?', words: ['#흔들리지않는단단함', '#가벼운해방감', '#따뜻한자기수용', '#주체적인확신', '#용기있는도전', '#여유로운숨고르기'] },
]

export const books: Book[] = [
  { title: '숲속의 자본주의자', author: '박혜윤', tagline: '온갖 기대와 압박 속에서 지친 당신에게 건네는 무해한 쉼표', reason: '과거의 무거운 압박과 현재의 번아웃을 지나, 세상의 기준 대신 나만의 속도로 숨 쉴 수 있는 단단한 자유를 전합니다.', cover: '/life-book-cover.png' },
  { title: '어린이라는 세계', author: '김소영', tagline: '작고 움츠러들었던 내 안의 아이를 다정하게 안아주는 문장들', reason: '의기소침했던 기억과 정체된 마음에 따뜻한 온기를 불어넣고, 다시금 고개를 들 용기를 찾아줍니다.', cover: '/life-book-cover.png' },
  { title: '이어령의 마지막 수업', author: '김지수, 이어령', tagline: '어두운 안갯속에서 내 안의 중심을 또렷하게 세워주는 나침반', reason: '복잡하게 얽힌 감정의 실타래를 풀고, 흔들리지 않는 나만의 본질을 마주할 수 있도록 깊은 통찰을 선사합니다.', cover: '/life-book-cover.png' },
  { title: '어떤 날, 어떤 마음', author: '마음 큐레이터', tagline: '지나온 계절의 감정들을 엮어 건네는 단 하나의 문장 처방전', reason: '고르신 세 가지 시간 속 마음의 궤적을 따라, 지금 당신의 마음에 가장 포근하게 가닿을 책을 선물합니다.', cover: '/life-book-cover.png' },
]

export const reviews = [
  { name: '김*서', role: '20대 후반, 직장인', tags: ['#압박감', '#무기력과번아웃', '#가벼운해방감'], quote: '과거의 압박과 번아웃을 그대로 선택했는데, 추천받은 책의 첫 문장을 읽자마자 억눌렸던 마음에 큰 위로를 받았습니다.' },
  { name: '이*현', role: '30대 초반, 프리랜서', tags: ['#의기소침', '#답답한정체기', '#주체적인확신'], quote: '정체된 기분 때문에 답답했는데, 내 감정의 흐름에 꼭 맞는 인생책을 찾게 되어 다시 나아갈 힘이 생겼어요.' },
  { name: '박*민', role: '40대, 작은 가게 운영', tags: ['#버거운책임감', '#따뜻한자기수용'], quote: '누군가 내 마음을 조용히 알아준 것 같았어요. 책을 펼치는 일이 다시 기대됩니다.' },
]

export const photos = [
  ['https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?auto=format&fit=crop&w=700&q=85', '천천히, 나를 읽는 시간'],
  ['https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&w=700&q=85', '마음이 쉬어가는 자리'],
  ['https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=700&q=85', '좋아하는 문장 하나'],
  ['https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&w=700&q=85', '페이지 사이의 계절'],
  ['https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=700&q=85', '오늘의 작은 발견'],
  ['https://images.unsplash.com/photo-1526243741027-444d633d7365?auto=format&fit=crop&w=700&q=85', '고요한 오후'],
  ['https://images.unsplash.com/photo-1474932430478-367dbb6832c1?auto=format&fit=crop&w=700&q=85', '다정한 마음의 모양'],
  ['https://images.unsplash.com/photo-1519682337058-a94d519337bc?auto=format&fit=crop&w=700&q=85', '창가에서 생각하기'],
  ['https://images.unsplash.com/photo-1511108690759-009324a90311?auto=format&fit=crop&w=700&q=85', '다시, 첫 문장'],
]

export const faqs = [
  ['어떤 기준으로 책을 골라주나요?', '선택해주신 과거·현재·미래의 감정 키워드를 바탕으로, 지금의 마음에 가장 다정하게 닿을 수 있는 책을 큐레이션합니다.'],
  ['신청 후 책은 언제 받아볼 수 있나요?', '신청 내용을 확인한 뒤 3–5일 안에 따뜻한 포장으로 보내드립니다. 배송 전 안내 메시지를 드려요.'],
  ['개인정보는 어떻게 관리되나요?', '책 발송을 위한 최소한의 정보만 사용하며, 발송 완료 후 안전하게 파기합니다.'],

]
