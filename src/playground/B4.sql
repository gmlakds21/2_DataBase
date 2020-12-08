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
