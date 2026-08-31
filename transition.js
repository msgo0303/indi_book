// 페이지 내 모든 링크 클릭 이벤트 감지 (페이지 전환 이펙트)
document.addEventListener('click', (e) => {
    const anchor = e.target.closest('a');
    if (!anchor) return;

    const href = anchor.getAttribute('href');
    const target = anchor.getAttribute('target');

    // 페이지 레이아웃 전환 효과를 생략할 특수 클릭 필터링
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

    // 동일 오리진 페이지 이동에만 화면 전환 효과 적용
    try {
        const targetUrl = new URL(href, window.location.href);
        if (targetUrl.origin === window.location.origin) {
            e.preventDefault();
            document.body.classList.add('page-transition-out');

            // transition CSS 시간(300ms) 후에 실제로 페이지 이동
            setTimeout(() => {
                window.location.href = href;
            }, 300);
        }
    } catch (err) {
        // 경로 분석 오류 발생 시 예외 없이 기본 동작 처리
    }
});

// 브라우저 뒤로가기로 인한 캐시(bfcache) 대응
window.addEventListener('pageshow', (event) => {
    if (event.persisted) {
        document.body.classList.remove('page-transition-out');
    }
});

// 페이지 로드 완료 시 body에 page-loaded 클래스를 추가하여 화면 표시 (fade-in)
function initPageFadeIn() {
    // 브라우저가 투명 상태(opacity: 0)를 먼저 렌더링한 후 트랜지션이 시작되도록 50ms 딜레이 부여
    requestAnimationFrame(() => {
        setTimeout(() => {
            document.body.classList.add('page-loaded');
        }, 50);
    });
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initPageFadeIn);
} else {
    initPageFadeIn();
}
