# DB 연동 및 백엔드 구축 구현 계획 (Supabase)

이 계획서는 Antigravity IDE 내부에도 저장되어 있으며, 내일 이어서 작업을 요청하실 때 자동으로 불러옵니다.

---

## 1. 아키텍처 및 기술 스택
*   **백엔드 & DB**: **Supabase (PostgreSQL + Auth + Database)**
*   **프론트엔드 연동**: 각 HTML 파일에 Supabase JavaScript CDN 추가 및 클라이언트 SDK 연동
*   **결제**: 모의 카드 결제 및 신청/승인 구조의 **모의 결제(Mock Payment)** 구현

---

## 2. 데이터베이스 스키마(Table) 설계

### 1) profiles (사용자 추가 정보)
*   Supabase Auth의 `auth.users` 테이블과 1:1 매핑
*   컬럼: `id` (PK, UUID), `email` (Text), `name` (Text), `role` (Text, 기본값 'USER')

### 3) events (소모임/이벤트)
*   컬럼: `id` (PK, Identity), `title` (Text), `date_info` (Text), `description` (Text), `max_seats` (Int), `image_url` (Text)

### 4) event_applications (소모임/이벤트 신청 내역)
*   컬럼: `id` (PK), `user_id` (FK, profiles.id), `event_id` (FK, events.id), `name` (Text), `contact` (Text), `seats` (Int), `status` (Text, 'PENDING'/'APPROVED'/'REJECTED'), `admin_comment` (Text)

### 5) books (도서 정보)
*   컬럼: `id` (PK), `title`, `author`, `publisher`, `price` (Int), `cover_image` (Text), `stock` (Int)

### 6) book_orders (도서 모의 결제 주문 내역)
*   컬럼: `id` (PK), `user_id` (FK, profiles.id), `book_id` (FK, books.id), `quantity` (Int), `total_price` (Int), `status` (Text, 'PAYMENT_PENDING'/'COMPLETED'/'CANCELLED'), `shipping_address` (Text)

---

## 3. 내일부터 시작할 작업 단계
1.  **Supabase 프로젝트 생성 및 API 키 설정**
2.  **데이터베이스 테이블 생성 (SQL 제공)**
3.  **`login.html`에 회원가입/로그인 기능 연동**
4.  **`events.html`에 이벤트 신청/마이페이지 연동**
5.  **관리자 페이지(`Admin_*.html`)에 신청 관리 및 도서 관리 연동**
