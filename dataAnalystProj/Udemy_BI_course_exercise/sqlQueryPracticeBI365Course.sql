SELECT 
    first_name, last_name
FROM
    employees;
SELECT 
    *
FROM
    employees;

SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments;
    
-- where and and statement
select *
from employees
where first_name = 'Elvis';

select *
from employees
where first_name = 'Kellie' and gender = 'F';

select *
from employees
where first_name ='Kellie' or first_name= 'Aruna';

select*
from employees
where gender = 'F' and (first_name ="Kellie" or first_name = 'Aruna');

-- in and not in operator
select *
from employees
where first_name in ('Denis','Elvis');

select *
from employees
where first_name not in ('John','Jacob','Mark');

-- like and not like operator
select *
from employees
where first_name like 'Mark%';

select *
from employees
where hire_date like '2000%';

select *
from employees
where emp_no like '1000_';

select *
from employees
where first_name like '%Jack%';

select *
from employees
where first_name not like '%Jack%';

-- between and not between operator
select *
from salaries
where salary between '66000' and '70000';

select *
from employees
where emp_no not between '10004' and '10012';


select *
from departments
where dept_no between 'd003' and 'd006';

select dept_name
from departments
where dept_no is not null
order by 1;

select *
from employees
where gender = 'F' and hire_date > '2000-01-01';

select *
from salaries
where salary > 150000;

select distinct hire_date
from employees;

-- aggregate functions
select count(distinct salary)
from salaries
where salary >= 100000;

select count(*)
from dept_manager;

select *
from employees
order by hire_date desc;

-- using group by
select salary, count(emp_no) as emps_with_same_salary
from salaries
where salary > 80000
group by salary
order by salary;

select *, avg(salary) as average_salary
from salaries
group by emp_no
having avg(salary) > 120000
order by average_salary;

select * 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no;


select dept_no, count(dept_no) as contract_in_dept_after_2000
from dept_emp
where from_date > '2000-01-01'
group by dept_no
having contract_in_dept_after_2000 > 500
order by 1; 

select *
from dept_emp
limit 100;


-- joins --
select
e.emp_no, dm.dept_no, dep.dept_name,t.title, e.first_name, e.last_name, t.from_date
from employees e 
inner join dept_manager dm on e.emp_no = dm.emp_no
inner join departments dep on dep.dept_no = dm.dept_no
join titles t on t.emp_no = e.emp_no
order by dm.dept_no, from_date;

select
e.emp_no, dm.dept_no, e.first_name, e.last_name, dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
where
e.last_name = 'Markovitch'
order by dm.dept_no desc, e.emp_no;

-- course req : set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
-- to reset: set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);

select
e.emp_no, t.title, e.first_name, e.last_name, t.from_date
from employees e
join titles t on t.emp_no = e.emp_no
where
e.first_name = 'Margareta' and e.last_name = 'Markovitch'
order by t.from_date;

select 
dm.*, dep.*
from dept_manager dm
cross join departments dep 
where
dep.dept_no like '%9';

select
dep.*, e.*
from employees e
cross join departments dep 
where
e.emp_no < 10011
order by emp_no, dept_name;

select
 t.title, gender, count(e.gender) as gendercount
from employees e
join titles t on e.emp_no = t.emp_no
where t.title = 'Manager'
group by gender;

SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;