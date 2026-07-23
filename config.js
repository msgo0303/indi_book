// Supabase 설정 파일
const SUPABASE_URL = "https://sbkhqoiicpqihitcrwbb.supabase.co";
const SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNia2hxb2lpY3BxaWhpdGNyd2JiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQ4MjA3NjEsImV4cCI6MjEwMDM5Njc2MX0.U0ZOfeNNcR2PEkKhU2DXme-uydo7s7SaQPVNbC3UibI";

// 전역 supabaseClient 초기화
if (typeof supabase !== 'undefined') {
    window.supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
    console.log("Supabase Client가 전역(window.supabaseClient)으로 초기화되었습니다.");
} else {
    console.error("Supabase CDN이 로드되지 않았습니다. HTML 파일 상단에 Supabase CDN 스크립트가 로드되었는지 확인해주세요.");
}

// 네비게이션 바 로그인/로그아웃 상태 자동 업데이트 함수
async function updateNavbar() {
    if (!window.supabaseClient) return;
    const { data: { session } } = await window.supabaseClient.auth.getSession();
    
    // PC 데스크톱용 로그인 영역 컨테이너
    const authContainers = document.querySelectorAll('nav .flex.items-center.gap-4.text-sm');
    
    // 모바일 서랍메뉴용 로그인 영역 컨테이너
    const mobileAuthContainers = document.querySelectorAll('#mobile-drawer .flex.gap-3.mt-5');
    
    const updateContainer = (container) => {
        if (!container) return;
        const links = container.querySelectorAll('a, button');
        if (links.length >= 2) {
            if (session) {
                // 로그인 상태
                links[0].textContent = "로그아웃";
                if (links[0].tagName === 'A') {
                    links[0].href = "javascript:handleLogout()";
                } else {
                    links[0].onclick = handleLogout;
                }
                
                links[1].textContent = "마이페이지";
                if (links[1].tagName === 'A') {
                    links[1].href = "login.html";
                }
            } else {
                // 로그아웃 상태
                links[0].textContent = "로그인";
                if (links[0].tagName === 'A') {
                    links[0].href = "login.html";
                }
                
                links[1].textContent = "회원가입";
                if (links[1].tagName === 'A') {
                    links[1].href = "login.html?view=signup";
                }
            }
        }
    };
    
    authContainers.forEach(c => updateContainer(c));
    mobileAuthContainers.forEach(c => updateContainer(c));
}

// 전역 로그아웃 함수
window.handleLogout = async function() {
    if (!window.supabaseClient) return;
    const { error } = await window.supabaseClient.auth.signOut();
    if (error) {
        alert("로그아웃 중 오류가 발생했습니다: " + error.message);
    } else {
        alert("로그아웃 되었습니다.");
        window.location.href = 'index.html';
    }
};

// DOM 로드 완료 시 네비게이션 상태 업데이트
document.addEventListener("DOMContentLoaded", () => {
    updateNavbar();
});
