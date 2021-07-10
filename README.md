# 코스피 200 기업의 시각화(Map)와 주식 커뮤니티

## 벤치마킹 사이트: https://finviz.com/map.ashx

## 주제와 목적
##### 1. 투자자가 한국 주식시장을 빠르게 파악하고 빠르게 대처하도록 코스피200을 Map으로 시각화
##### 2. 투자자들이 서로 의견을 나누고 모의투자를 해볼 수 있는 커뮤니티 개발

## 개발환경
  1. 하드웨어 : 데스크탑, 64비트 윈도우즈 8.1 플랫폼, 프로세서-인텔 코어
  2. 개발 언어 : JSP(2.3), Servlet(3.1), JAVA(1.8.0_241), Python(3.8.1)
  3. 개발 툴 : eclipse (버전 2019-03, 4.11.0), PyCharm (버전 2019-03-04)
  4. DBMS : MySQL MariaDB (10.3.22)
  5. DBMS 연결 툴 : mySQL workbench, HeidiSQL 
  6. 웹서버(WAS) : tomcat 8.5
  7. 브라우저 : chrome 80.0
  8. 웹프로그램 기술 : HTML, CSS, javascript, jQuery
  9. 형상화 도구 : Git

## 개발자
강동혁 김태경 오지영 유태우 이준 신나진

## 전체 개발내용
### 1. 빅데이터 수집 및 분석
  - url : https://finance.naver.com/sise/entryJongmok.nhn?&page=1
  - url : https://finance.daum.net/domestic/kospi200
  - 상장주의 회사명, 업종, 현재가 등을 수집
  - 수집주기 : 실시간
### 2. 주식 조회 기능
  - 트리맵 : 사각형의 크기를 시가총액으로, 색깔을 등락률로 표현
  - 상세 조회 기능 : 각 종목의 업종, 현재가, 등락률, 전일비, 거래량, 거래대금, 시가총액, 52주고가 
    확인 가능
  - 일봉차트 : 일자별 시가, 종가, 저가, 고가 확인 가능
  - 동종 업계 현황 : 한 종목을 선택했을 때 동종업계가 무엇인지, 동종업정의 증권 현황은 어떤지 
    확인 가능
### 3. 게시판 기능
  - 자유게시판 : 글 조회 / 입력 / 수정 / 삭제 가능
  - 댓글 기능 : 자유게시판의 글에 댓글 작성 가능
  - 좋아요/싫어요 기능 : 댓글에 좋아요/싫어요를 표현 가능
  - 공지사항게시판 : 관리자만 글 입력 / 수정 / 삭제 가능
  - 실시간순위게시판 : 코스피 200에 대한 실시간 현황을 조건에 따라 오름차순 혹은 내림차순 정렬
### 4. 회원 관리
  - 회원 가입 : 유효성 검증을 거친 후 회원 등록
  - 로그인 : 등록된 아이디와 비밀번호로 로그인
  - 내정보 : 로그인 한 회원의 정보를 확인 가능
  - 현재 회원 관리 : 관리자는 가입되어 있는 회원들의 정보를 확인 / 관리 가능
  - 로그아웃 : 로그인된 정보를 해제 시키고 로그인 폼으로 이동
### 5. 모의투자
  - 투자 : 예수금포인트로 주식 매수와 보유 주식 매도가 가능
  - 랭킹 : 예수금 포인트와 보유 주식 현재가의 합인 자산포인트로 랭킹이 설정되며 홈페이지 상단에
    노출된다. 
### 6. 관심주식
  - 관심주식 : 회원은 주식을 자신의 관심주식에 편입할 수 있다.

## 나의 기여 항목
### 1. 회원정보 관리 기능 구현 (Back-end)
개인정보 조회, 수정, 회원탈퇴
### 2. 관심주식 관리 기능 구현 (Back-end)
관심주식 조회, 추가, 삭제
### 3. 페이지 CSS 총괄 (Front-end)
