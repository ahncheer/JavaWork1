-- 3. 다중칼럼 Sub Query
-- Sub Query 결과가 여러 칼럼인 경우.  
-- 주로 Primary Key 를 여러 칼럼을 합쳐서 만들었을 경우 한꺼번에 
-- 비교하기 위해서 자주 사용.

--#7201) 예제
-- t_student 테이블을 조회하여  각 학년별로 최대 키를 가진 학생들의 
-- 학년과 이름과 키를 출력하세요 학년 오름차순으로 출력

SELECT grade, MAX(height)
FROM t_student GROUP BY grade
;

SELECT grade "학년", name "이름", height "키"
FROM t_student
WHERE (grade, height) IN (SELECT grade, MAX(height) FROM t_student GROUP BY grade)
-- ORDER BY grade ASC;
-- ORDER BY 1 ASC;
ORDER BY "학년" ASC;
;

-- #7202) 연습
-- t_professor , t_department 테이블 :  
-- 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 입사일, 학과명을 출력하세요.  
-- 단 학과이름 순으로 오름차순 정렬하세요

SELECT p.profno "교수번호", p.name "교수명",
	    TO_CHAR(p.hiredate, 'YYYY-MM-DD') "입사일", d.dname "학과명"
FROM t_professor p, t_department d
WHERE p.deptno = d.deptno
AND (p.deptno, p.hiredate) 
	IN ( SELECT deptno, MIN(hiredate) FROM t_professor GROUP BY deptno)
ORDER BY d.dname ASC;

--#7203) 연습
--t_emp2 테이블 : 
--직급별로 해당직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요,  
--단, 연봉순으로 오름차순 정렬하세요
SELECT name "사원명", post "직급", pay "연봉"
FROM t_emp2
WHERE (post, pay) IN ( SELECT post, MAX(pay) FROM t_emp2 GROUP BY post )
ORDER BY pay;

--#7204) 연습
--t_emp2, t_dept2 테이블 : 
--각 부서별 평균 연봉을 구하고 그 중에서 평균 연봉이 가장 적은 부서의 평균연봉보다 
--적게 받는 직원들의  부서명, 직원명, 연봉을 출력 하세요

SELECT avg(pay) FROM t_emp2 GROUP BY deptno;

SELECT d.dname "부서명", e.name "직원명", e.pay "연봉"
FROM t_emp2 e, t_dept2 d
WHERE e.deptno = d.dcode AND 
	e.pay <ALL (SELECT avg(pay) FROM t_emp2 GROUP BY deptno)
ORDER BY e.pay;

--#7205) 연습
--t_emp2 테이블 직원들 중에서 자신의 직급의 평균연봉과  같거나 많이 받는 사람들의 
--이름과 직급, 현재 연봉을 출력하세요.

SELECT a.name "사원이름", NVL(a.post, ' ') "직급", a.pay "급여"
FROM t_emp2 a
-- WHERE a.pay >= (  a.post 직급의 평균연봉 )
WHERE a.pay >= (SELECT avg(b.pay) FROM t_emp2 b WHERE NVL(a.post, ' ') = NVL(b.post, ' '))     
;

SELECT avg(b.pay) FROM t_emp2 b WHERE '과장' = b.post;

-------------------------------------
-- 스칼라 서브쿼리
		
-- #7206) 예제
--t_emp2, t_dept2 테이블: 
--조회하여 사원들의 이름과 부서 이름을 출력

SELECT  name "사원이름", 
		(SELECT d.dname FROM t_dept2 d WHERE e.deptno = d.dcode ) "부서이름"
FROM t_emp2 e;




