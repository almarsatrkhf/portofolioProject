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
