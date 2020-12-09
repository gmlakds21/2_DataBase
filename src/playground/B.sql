-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
select first_name, last_name from employees;

-- 2. 모든 사원의 모든 정보를 조회하라.
select * from employees;

-- 3. 모든 도시 명을 조회하라.
select distinct city as '도시 명' from locations;

-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select * from employees where first_name like 'M%';

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
select first_name, salary as '연봉' from employees where first_name like '_a%';

-- 6. 도시 명을 오름차순 정렬하라.
select city as '도시명' from locations order by city;

-- 7. 부서 명을 내림차순 정렬하라.
select department_name from departments order by department_name desc;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
select last_name, salary from employees where salary >= 7000 order by salary;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
select * from employees where commission_pct is null;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
select * from employees where commission_pct;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.
select employee_id as '사원 번호', first_name, last_name, department_id as '부서 번호' from employees where hire_date ='2007-06-21 00:00:00';

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
select first_name, hire_date from employees where hire_date like '2006-__-__ __:__:__';

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
select first_name from employees where first_name like '_____%';

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
select last_name, salary as '연봉'  from employees where salary not between 5000 and 12000 order by salary;

-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select last_name, department_id as '부서 번호' from employees where employee_id = 176;

-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select last_name, salary as '연봉' from employees where salary > 12000;

-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
select last_name, hire_date as '고용일' from employees where hire_date like '2004%';

-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
select last_name, job_id from employees where manager_id is null;

-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.
select last_name, salary as '연봉', commission_pct as '커미션' from employees
    where salary is not null and commission_pct is not null
    order by salary desc, commission_pct desc;

-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
select last_name from employees where last_name like '___a%';

-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
select last_name from employees where last_name like '%a%' or '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select last_name, job_id, salary from employees
    where (salary <> 2500 and salary <> 3500 and salary <> 7000)
      and (job_id = 'sa_rep' or job_id = 'st_clerk') order by salary, job_id;

-- 23. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
select max(salary), min(salary), sum(salary), round(avg(salary)) from employees;

-- 24. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
select job_id, max(salary), min(salary), sum(salary), round(avg(salary)) from employees group by job_id;

-- 25. 동일한 직업을 가진 사원들의 총 수를 조회한다.
select job_id, count(employee_id) from employees group by job_id;

-- 26. 매니저로 근무하는 사원들의 총 수를 조회한다.
select count(distinct manager_id) from employees where manager_id is not null;

-- 27. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
select max(salary)-min(salary) from employees;

-- 28. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.
select manager_id, min(salary) from employees
    where manager_id is not null
    group by manager_id having min(salary) >= 6000 order by min(salary) desc;

-- 29. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다. 평균 연봉은 소수점 2 자리까지만 표현한다.
select department_name, count(employee_id), round(avg(salary),2) from employees e
    inner join departments d on e.department_id = d.department_id
    group by department_name;

-- 30. 총 사원 수 및 1995, 1996, 1997, 1998 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.
select hire_date, count(employee_id) from employees
    group by hire_date having hire_date like '1995%' or '1996%' or '1997%' or '1998%';

-- 31. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
select department_id as '부서 번호', count(employee_id) as '사원 수' from employees
    group by department_id order by department_id;



-- ??? - 상위 그룹 합계어떻게 내는지
-- 32.  각 부서별 각 직업 별 연봉 총 합 및 평균 연봉을 조회한다.
select department_id, job_id, sum(salary), round(avg(salary)) from employees
where department_id is not null group by department_id, job_id;

-- 33) 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회하세요
select last_name, department_name, d.department_id from employees e
    inner join departments d on e.department_id = d.department_id;

-- 34) 부서번호 30의 모든 직업들과 부서명으로 조회하세요. 90 부서 또한 포함한다.
select distinct job_id, department_name from employees e
    inner join departments d on e.department_id = d.department_id
    where d.department_id in (30, 90);

-- 35) 부서번호 30 이하의 모든 직업들과 부서명으로 조회하세요
select distinct job_id, department_name from employees e
    inner join departments d on e.department_id = d.department_id
    where e.department_id <= 30;

-- 36) 커미션을 버는 모든 사람들의 LAST_NAME, 부서명, 지역 ID 및 도시 명을 조회하세요
select last_name, department_name, d.location_id, city from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    where commission_pct is not null;

-- 37) 커미션을 버는 사람들 중 Oxford 에 거주하는 사람들의 LAST_NAME, 부서명, 지역 ID 및 도시 명을 조회하세요
select last_name, department_name, d.location_id, city from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    where commission_pct is not null and city = 'Oxford';

-- 38) 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회하세요.
select e1.last_name, e1.hire_date from employees e1
    inner join employees e2 on e1.manager_id = e2.employee_id
    where e1.hire_date < e2.hire_date;

-- 39) 부서별 사원수를 조회하세요 단, 부서명도 함께 출력합니다
select count(employee_id), department_name from employees e
    inner join departments d on e.department_id = d.department_id
    group by d.department_id;

-- 40) 부서별 사원수를 조회하세요 단, 부서명도 함께 출력하고 단, 사원수가 0이어도 부서명을 출력합니다
select count(employee_id), department_name from employees e
    right outer join departments d on e.department_id = d.department_id
    group by d.department_id;

-- 41) LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--      단, Zlotkey 는 제외한다.
select employee_id, hire_date from employees
    where (department_id in ( select department_id from employees where last_name = 'Zlotkey'))
     and (last_name <> 'Zlotkey');

-- 42) 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.
select employee_id, last_name from employees
    where salary > ( select avg(salary) from employees);

-- 43) LAST_NAME 에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.
select employee_id, last_name from employees
    where department_id in ( select department_id from employees where last_name like '%u%');

-- 44) King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다. 즉, King의 부하직원의 성과 연봉 조회하라
select last_name, salary from employees
    where manager_id in ( select employee_id from employees where last_name = 'King' );

-- 45) EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID를  조회한다.
select department_id, last_name, job_id from employees
    where department_id = (select department_id from departments where department_name = 'Executive');

-- 46) 회사 전체 평균 연봉보다 더 버는 사원들 중
--  LAST_NAME 에 u 가 있는 사원들이 근무하는 부서에서
--  근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.
select employee_id, last_name, salary from employees
    where department_id in (select department_id from employees where last_name like '%u%')
      and salary > (select avg(salary) from employees);

-- 47) 직업 ID 가 SA_MAN 인 사원들이 받을 수 있는 최대 연봉보다
--      높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.
select last_name, job_id, salary from employees
    where salary > (select max_salary from jobs where job_id = 'SA_MAN');

-- 47-2) 직업 ID 가 SA_MAN 인 사원들의 최대 연봉보다
--      높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.
select last_name, job_id, salary from employees
    where salary > (select max(salary) from employees where job_id = 'SA_MAN');

-- 47-3) 직업 ID 가 SA_MAN 인 모든 사원들의 연봉보다
--      높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.
select last_name, job_id, salary from employees
    where salary > all (select salary from employees where job_id = 'SA_MAN');

-- 48) 도시 이름이 T 로 시작하는 지역에 근무하는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.
select employee_id, last_name, department_id from employees
    where department_id in (select department_id from departments
        where location_id in (select location_id from locations
          where city like 'T%'));

-- //
create view empdeptloc2 as
    select * from employees e
        inner join departments d using(department_id, manager_id)
        inner join locations l using(location_id);

select * from empdeptloc where first_name = 'janette';

select * from employees where first_name = 'janette';



