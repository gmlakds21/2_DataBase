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




