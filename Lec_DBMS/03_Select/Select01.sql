-- dual 은 ROW 1개 짜리 dummy TABLE;
SELECT 'abcde' FROM dual;
SELECT '안녕하세요' FROM dual;
SELECT 100 FROM dual;
SELECT 100 + 10 FROM dual;

-- * : '모든 컬럼'
SELECT * FROM t_emp;

-- 원하는 컬럼만 조회 
SELECT EMPNO , ENAME 
FROM t_emp;

--
SELECT * FROM t_professor;
SELECT bonus FROM t_professor;

SELECT '안녕하세요' FROM t_professor;

SELECT name, '교수님 싸랑해요' FROM t_professor;


-- 컬럼 별명(alias) 사용한 출력
SELECT  studno 학번, name 이름
FROM t_student;

SELECT studno "학번", name AS 이름
FROM t_student;

SELECT  studno "학생 학번", name 이름
FROM t_student;

-- 연습1
-- emp 테이블에서  empno 를 '사원번호',  
-- ename을 '사원명',  
-- job을 '직업'으로 별명을 설정하여 출력
SELECT empno 사원번호, ename 사원명,	job 직업 
FROM t_emp
;

-- tdept 테이블을 사용하여 deptno를 '부서#', 
-- dname을 '부서명', 
-- loc를 '위치' 로 별명을 설정하여 출력
SELECT deptno 부서#, dname 부서명, loc 위치 
FROM t_dept
;

-- DISTINCT 
SELECT * FROM t_emp;
SELECT deptno FROM t_emp;
SELECT DISTINCT deptno FROM t_emp;

-- DISTINCT 연습
-- 학생테이블(t_student) 에서
-- 제1전공 (deptno1) 을 중복값을 제거하여 출력해보기
SELECT DISTINCT deptno1 FROM t_student;

-- 직원(t_emp) 들의 직책(job) 을 중복값 제거하여 출력해보기
SELECT DISTINCT job FROM t_emp;


-- || : 필드, 문자열 연결 연산
SELECT	name, POSITION 
FROM t_professor;

SELECT	name || '-' || POSITION AS 교수님명단
FROM t_professor;

-- 학생테이블(t_student)를 사용하여 
-- 모든 학생들이 
-- ‘서진수의 키는 180cm, 몸무게는 55kg 입니다’ 
-- 와 같은 형식으로 출력되도록 문자를 추가하고, 
-- 칼럼 이름은 ‘학생의 키와 몸무게’ 라는 별명으로 출력하세요	

SELECT  
	name || '의 키는' || 
	height || 'cm, ' || 
	'몸무게는 ' || weight || 
	'kg 입니다' "학생의 키와 몸무게"
FROM 
	t_student
;

