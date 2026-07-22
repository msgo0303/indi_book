document.addEventListener('DOMContentLoaded', () => {
    // 렌더링 준비 후 부드러운 페이드 인 적용
    requestAnimationFrame(() => {
        document.body.classList.add('page-loaded');
    });
});

// 브라우저 뒤로가기/앞으로가기 캐시(bfcache) 대응
window.addEventListener('pageshow', (event) => {
    if (event.persisted) {
        document.body.classList.add('page-loaded');
    }
});

// 페이지 내 모든 링크 클릭 이벤트 감지 (이벤트 위임)
document.addEventListener('click', (e) => {
    const anchor = e.target.closest('a');
    if (!anchor) return;

    const href = anchor.getAttribute('href');
    const target = anchor.getAttribute('target');

    // 페이드 아웃 전환 효과를 생략할 특수 클릭 및 링크 필터링
    if (!href || 
        href.startsWith('#') || 
        href.startsWith('javascript:') || 
        target === '_blank' || 
        e.metaKey || 
        e.ctrlKey || 
        e.shiftKey || 
        e.altKey) {
        return;
    }

    // 동일 호스트(도메인) 내 페이지 이동인 경우에만 화면 전환 효과 적용
    try {
        const targetUrl = new URL(href, window.location.href);
        if (targetUrl.origin === window.location.origin) {
            e.preventDefault();
            document.body.classList.remove('page-loaded');
            
            // transition CSS 시간(300ms) 후에 실제로 페이지 이동
            setTimeout(() => {
                window.location.href = href;
            }, 300);
        }
    } catch (err) {
        // 경로 분석 오류 발생 시 예외 없이 기본 동작 처리
    }
});
