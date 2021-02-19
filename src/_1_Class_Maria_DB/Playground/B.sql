-- 1. 모든 사원의 이름(last_name, first_name)을 조회하라.
select last_name, first_name from employees;

-- 2. 모든 사원의 모든 정보를 조회하라.
select * from employees;

-- 3. 모든 도시 명을 조회하라.
select distinct city as '도시 명' from locations;

-- 4. 이름(last_name)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select * from employees where last_name like 'M%';

-- 5. 이름(last_name)의 두 번째 글자가 'a'인 사원의 이름(last_name)과 연봉을 조회하라.
select last_name, salary as '연봉' from employees where last_name like '_a%';

-- 6. 도시 명을 오름차순 정렬하라.
select city as '도시명' from locations order by city;

-- 7. 부서 명을 내림차순 정렬하라.
select department_name from departments order by department_name desc;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
select first_name, salary from employees where salary >= 7000 order by salary;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
select * from employees where commission_pct is null;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
select * from employees where commission_pct;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(last_name, first_name) 그리고 부서번호를 조회하라.
select employee_id as '사원 번호', last_name, first_name, department_id as '부서 번호' from employees where hire_date ='2007-06-21 00:00:00';

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
select last_name, hire_date from employees where hire_date like '2006-__-__ __:__:__';

-- 13. 이름(last_name)의 길이가 5글자 이상인 사원을 조회하라.
select last_name from employees where last_name like '_____%';

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 first_name 및 연봉을 조회힌다.
select first_name, salary as '연봉'  from employees where salary not between 5000 and 12000 order by salary;

-- 15. 사원번호가 176 인 사람의 first_name 과 부서 번호를 조회한다.
select first_name, department_id as '부서 번호' from employees where employee_id = 176;

-- 16. 연봉이 12000 이상되는 직원들의 first_name 및 연봉을 조회한다.
select first_name, salary as '연봉' from employees where salary > 12000;

-- 17. 1994년도에 고용된 모든 사람들의 first_name 및 고용일을 조회한다.
select first_name, hire_date as '고용일' from employees where hire_date like '2004%';

-- 18. 매니저가 없는 사람들의 first_name 및 JOB_ID 를 조회한다.
select first_name, job_id from employees where manager_id is null;

-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.
select first_name, salary as '연봉', commission_pct as '커미션' from employees
    where salary is not null and commission_pct is not null
    order by salary desc, commission_pct desc;

-- 20. first_name 의 네번째 글자가 a 인 사원들의 first_name 을 조회한다.
select first_name from employees where first_name like '___a%';

-- 21. first_name 에 a 및(OR) e 글자가 있는 사원들의 first_name 을 조회한다.
select first_name from employees where first_name like '%a%' or '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select first_name, job_id, salary from employees
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

-- 32.  각 부서별 각 직업 별 연봉 총 합 및 평균 연봉을 조회한다.
select department_id, job_id, sum(salary), round(avg(salary)) from employees
where department_id is not null group by department_id, job_id;

-- 33) 모든 사원들의 first_name, 부서 이름 및 부서 번호을 조회하세요
select first_name, department_name, d.department_id from employees e
    inner join departments d on e.department_id = d.department_id;

-- 34) 부서번호 30의 모든 직업들과 부서명으로 조회하세요. 90 부서 또한 포함한다.
select distinct job_id, department_name from employees e
    inner join departments d on e.department_id = d.department_id
    where d.department_id in (30, 90);

-- 35) 부서번호 30 이하의 모든 직업들과 부서명으로 조회하세요
select distinct job_id, department_name from employees e
    inner join departments d on e.department_id = d.department_id
    where e.department_id <= 30;

-- 36) 커미션을 버는 모든 사람들의 first_name, 부서명, 지역 ID 및 도시 명을 조회하세요
select first_name, department_name, d.location_id, city from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    where commission_pct is not null;

-- 37) 커미션을 버는 사람들 중 Oxford 에 거주하는 사람들의 first_name, 부서명, 지역 ID 및 도시 명을 조회하세요
select first_name, department_name, d.location_id, city from employees e
    inner join departments d on e.department_id = d.department_id
    inner join locations l on d.location_id = l.location_id
    where commission_pct is not null and city = 'Oxford';

-- 38) 자신의 매니저보다 먼저 고용된 사원들의 first_name 및 고용일을 조회하세요.
select e1.first_name, e1.hire_date from employees e1
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

-- 41) first_name 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--      단, Zlotkey 는 제외한다.
select employee_id, hire_date from employees
    where (department_id in ( select department_id from employees where first_name = 'Zlotkey'))
     and (first_name <> 'Zlotkey');

-- 42) 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 first_name 을 조회한다.
select employee_id, first_name from employees
    where salary > ( select avg(salary) from employees);

-- 43) first_name 에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 first_name 을 조회한다.
select employee_id, first_name from employees
    where department_id in ( select department_id from employees where first_name like '%u%');

-- 44) King 을 매니저로 두고 있는 모든 사원들의 first_name 및 연봉을 조회한다. 즉, King의 부하직원의 성과 연봉 조회하라
select first_name, salary from employees
    where manager_id in ( select employee_id from employees where first_name = 'King' );

-- 45) EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, first_name, JOB_ID를  조회한다.
select department_id, first_name, job_id from employees
    where department_id = (select department_id from departments where department_name = 'Executive');

-- 46) 회사 전체 평균 연봉보다 더 버는 사원들 중
--  first_name 에 u 가 있는 사원들이 근무하는 부서에서
--  근무하는 사원들의 사번, first_name 및 연봉을 조회한다.
select employee_id, first_name, salary from employees
    where department_id in (select department_id from employees where first_name like '%u%')
      and salary > (select avg(salary) from employees);

-- 47) 직업 ID 가 SA_MAN 인 사원들이 받을 수 있는 최대 연봉보다
--      높게 받는 사원들의 first_name, JOB_ID 및 연봉을 조회한다.
select first_name, job_id, salary from employees
    where salary > (select max_salary from jobs where job_id = 'SA_MAN');

-- 47-2) 직업 ID 가 SA_MAN 인 사원들의 최대 연봉보다
--      높게 받는 사원들의 first_name, JOB_ID 및 연봉을 조회한다.
select first_name, job_id, salary from employees
    where salary > (select max(salary) from employees where job_id = 'SA_MAN');

-- 47-3) 직업 ID 가 SA_MAN 인 모든 사원들의 연봉보다
--      높게 받는 사원들의 first_name, JOB_ID 및 연봉을 조회한다.
select first_name, job_id, salary from employees
    where salary > all (select salary from employees where job_id = 'SA_MAN');

-- 48) 도시 이름이 T 로 시작하는 지역에 근무하는 사원들의 사번, first_name 및 부서 번호를 조회한다.
select employee_id, first_name, department_id from employees
    where department_id in (select department_id from departments
        where location_id in (select location_id from locations
          where city like 'T%'));

-- 49) 사원 테이블에서 사원 이름을 소문자로 출력하세요
select lower(first_name) from employees;

-- 50) 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요.
select concat(upper(left(first_name,1)),lower(substr(first_name,2))) from employees;

-- 51) 사원 테이블에서 사원 이름의 길이를 출력하세요.
select first_name, length(first_name) from employees;

-- 52) 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요.
select first_name, instr(first_name, 'A') from employees;

-- 53)사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를 출력하세요.
select first_name from employees where first_name like '__R%';
select first_name from employees where substring(first_name,3,1) = 'R';

-- 54) 사원 테이블에서 이름의 끝자리가 N으로 끝나는 사원의 정보를 출력하세요.
select first_name from employees where first_name like '%N';
select first_name from employees where right(first_name,1) = 'N';

-- 55) 사원들의 급여가 평균보다 큰 경우 '평균급여이상' 이라 출력하고 아닌 경우 '평균급여이하' 라고 출력하세요
select first_name, if( (salary > (select avg(salary) from employees)), '평균급여이상', '평균급여이하') from employees;

-- 56) 사원의 급여에 대해 평균을 계산하고 정수로 변환해서 출력하세요
select round(avg(salary)) from employees;
select cast(avg(salary) as integer) from employees;

-- 57) 사원들을 입사일자가 빠른 순으로 정렬한 뒤
--      본인보다 입사일자가 빠른 사원의 급여를 본인의 급여와 함께 출력하세요
select lag(first_name) over(order by hire_date), salary from employees;

-- 58) AND 나 BETWEEN 을 사용하지 않고 2002 년도에 입사한 직원의 이름과 월급을 출력하세요.
select first_name, salary, hire_date from employees where hire_date like '2002%';
select first_name, salary, hire_date from employees where year(hire_date) = '2002';
select first_name, salary, hire_date from employees where left(hire_date, 4) = '2002';
select first_name, salary, hire_date from employees where substr(hire_date,1,4) = '2002';

-- 59) 사원 테이블에서 사원의 이름이 5글자인 사원의 이름을 첫글자만 대문자로 출력하세요.
select first_name, upper(left(first_name,1)) from employees where length(first_name) = 5;

-- 60) 사원 테이블에서 이름과 입사일자 그리고 현재날까지의 경과일을 산출하세요 (소숫점을 빼버리고 해딩이름을 경과일로 바꾸세요)
select first_name, hire_date, datediff(current_date(), hire_date) from employees;

-- 61) 이전문제에서 경과일을 개월수로 바꿔서 산출하세요. 소숫점을 빼버리고 해당이름을 경과개월수로 바꾸세요
select first_name, hire_date, timestampdiff(month, hire_date, current_date) from employees;

-- 62) 사원 테이블에서 입사후 6개월이 지난날짜 바로 다음 일요일을 구하세요.
select hire_date, date_add(date_add(hire_date, interval 6 month), interval (8-dayofweek(date_add(hire_date, interval 6 month))) day) from employees;

-- 62-b) 교육시작일이 2020-11-02 경우, 18주가 지난 후 돌아오는 첫뻔째 금요일을 구하시오
select '2020-11-02', date_add( date_add('2020-11-02', interval 18 week) , interval (

        if( (13 - dayofweek(date_add('2020-11-02', interval 18 week))) > 7,
            (13 - dayofweek(date_add('2020-11-02', interval 18 week))) - 7,
            (13 - dayofweek(date_add('2020-11-02', interval 18 week)))      )

        ) day );

-- 63) 오늘날짜를 "xx년 xx월 xx일" 형식으로 출력하세요
select date_format(now(),'%Y년 %m월 %d일');

-- 64) 지금 현재 '몇시 몇분' 인지 출력하세요.
select date_format(now(), '%h시 %i분');
select date_format(now(), '%H시 %i분');
select date_format(now(), '%p %h시 %i분');

-- 65) 이번 년도 12월 31일까지 몇일이 남았는지 출력하세요.
select datediff('2020-12-31', now());

-- 66) 사원들의 입사일에서 입사 년도와 입사 달을 조회하세요
select first_name, date_format(hire_date,'%Y년 %m월') from employees;

-- 67) 9월에 입사한 사원을 조회하세요
select first_name, hire_date from employees where month(hire_date) = 9;
select first_name, hire_date from employees where substr(hire_date,6,2) = '09';
select first_name, hire_date from employees where date_format(hire_date,'%m') = '09';

-- 68) 사원들의 입사일을 출력하되, 요일까지 함께 조회하세요
select first_name, hire_date, dayname(hire_date) from employees;
select first_name, hire_date, date_format(hire_date,'%W') from employees;
select first_name, hire_date, date_format(hire_date,'%a') from employees;
select first_name, hire_date, substr('일월화수목금토', dayofweek(hire_date),1) from employees;
select first_name, hire_date, substr('일월화수목금토', date_format(hire_date,'%w')+1,1) from employees;

-- 69) 사원들의 급여를 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 조회하세요
select first_name, concat('$',format(salary, 0)) from employees;

-- 70) 사원들의 급여를 10자리로 출력하되 자릿수가 남는 경우 빈칸으로 채워서 조회하세요
select first_name, lpad(salary,10,' ') from employees;

-- 71) 각 사원들의 근무한 개월 수를 현재를 기준으로 구하세요
select first_name, timestampdiff(month, hire_date, current_date) from employees;

-- 72) 각 사원들의 입사일에서 4개월을 추가한 날짜를 조회하세요
select first_name, hire_date, adddate(hire_date, interval 4 month) from employees;

-- 73) 각 사원들의 입사한 달의 마지막 날을 조회하세요
select last_day(hire_date) from employees;












-- //
Create view empdeptloc2 as
    select * from employees e
        inner join departments d using(department_id, manager_id)
        inner join locations l using(location_id);

select * from empdeptloc where last_name = 'janette';

select * from employees where last_name = 'janette';

select first_name, round(coalesce(commission_pct, 0.0),2) from employees
