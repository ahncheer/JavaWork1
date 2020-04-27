-- 날짜 함수
SELECT SYSDATE FROM dual;

-- 기본적인 날짜 연산
SELECT 
	SYSDATE "오늘",
	SYSDATE + 1 "내일(24hr뒤)",
	SYSDATE - 2 "그저께",
	SYSDATE + 1/24 "한시간뒤"
FROM dual; 

-- 일자 차이 계산
SELECT 
	SYSDATE "오늘",
	TO_DATE('2020-03-16 09:00:00', 'YYYY-MM-DD hh:mi:ss') "시작한날",
	SYSDATE - TO_DATE('2020-03-16 09:00:00', 'YYYY-MM-DD hh:mi:ss') "경과"
FROM dual;

-- MONTHS_BETWEEN : 날짜 사이의 개월수
SELECT
	-- 규칙1: 두 날짜중 큰 날짜를 먼저 써야 양수값으로 나옴
	MONTHS_BETWEEN('2012-03-01', '2012-01-01') "양수값",
	MONTHS_BETWEEN('2012-01-01', '2012-03-01') "음수값",
	-- 규칙2: 두 날짜가 같은 달에 속해 있으면 특정 규칙으로 계산된 값
	MONTHS_BETWEEN('2012-02-29', '2012-02-01') "2/29-2/01",
	MONTHS_BETWEEN('2012-04-30', '2012-04-01') "4/30-4/01",
	MONTHS_BETWEEN('2012-05-31', '2012-05-01') "5/31-5/01"
FROM dual;

-- #4501
-- professor 테이블에서 오늘(SYSDATE)을 기준으로 
-- 근속연, 근속개월, 근속일를 계산해서 출력
-- 출력양식은 YYYY-MM-DD 로
-- 근속월, 근속일은 반올림 하여 소수점 1자리까지 표현

SELECT
	name "이름", 
	TO_CHAR(SYSDATE, 'YYYY-MM-DD') "오늘", 
	TO_CHAR(hiredate, 'YYYY-MM-DD') "입사일",
	TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(hiredate, 'YYYY') "근속연수",
	ROUND(MONTHS_BETWEEN(SYSDATE, hiredate), 1) "근속개월",
	ROUND(SYSDATE - hiredate, 1) "근속일"
FROM
	t_professor;

-- ADD_MONTH() 개월 추가
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM dual;

SELECT
	SYSDATE,
	LAST_DAY(SYSDATE) "이번달 마지막날",
	NEXT_DAY(SYSDATE, '월')  "다음 월요일"
FROM dual;

-- 날짜의 ROUND() 함수  ,  하루의 반은 정오 12:00:00 이다. 이를 넘어서면 다음 날짜
-- 날짜의 TRUNC() 함수,  무조건 당일 출력.
-- 원서 접수나 상품 주문 등에서 오전까지 접수된 건은 당일 접수 처리. 오후접수는 익일 처리 등에서 사용.
SELECT
	SYSDATE,
	ROUND(SYSDATE),
	TRUNC(SYSDATE)
FROM dual;










