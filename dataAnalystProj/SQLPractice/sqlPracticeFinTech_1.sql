-- DROP DATABASE IF EXISTS testbench;
-- CREATE DATABASE IF NOT EXISTS testbench; 
USE testbench;

-- COUNT USER DAILY -- 
select created_date, count(distinct user_id) as countuser
from orders
group by created_date;

-- trancsact each week --
with weekly as 
(select week(created_date) as weeks, 
		user_id, 
        count(distinct order_id) as countOrderid
from orders
group by week(created_date), user_id)
select weeks
		,sum(case when countOrderid = 1 then 1 end) as transact1t
        ,sum(case when countOrderid = 2 then 1 end) as transact2t
        ,sum(case when countOrderid = 3 then 1 end) as transact3t
		,sum(case when countOrderid > 3 then 1 end) as transact3more
from weekly
group by weeks; 

-- most used merchant first transaction in each month -- 

with rankdatedaily as
(select *, 
	   row_number () over (partition by user_id order by created_date) as permonth
from orders
order by created_date)
,firstorder as
(
select  *
from rankdatedaily
where permonth = 1
order by merchant_id)
select month(created_date) as months, 
		merchant_id,
        count(distinct order_id) as countOrderid
from firstorder
group by months, merchant_id
order by countOrderid desc limit 1;

-- monthly percentage between premium and non premium members --
with orderAndUser as
(	select u.is_premium
	,month(o.created_date) as months
	, count(o.order_id) as total
	from orders o
	inner join users u
	on o.user_id = u.user_id
    group by u.is_premium, months )
select 
ou.months
,ou.is_premium
,ou.total
,ou.total/(select sum(total) from orderAndUser) * 100 as Percentage
from orderAndUser OU
group by OU.is_premium, ou.total, ou.months;

-- monthly retention rate --
with monthly as 
(	select 
	month(o.created_date) as months,
    count(distinct o.user_id) as usercount
  from orders o
  group by months)
select 
	months,
	usercount,
	usercount/(SUM(usercount) over(order by months) - usercount) * 100 as retention_rate
from monthly
