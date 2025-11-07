

select * from new_year;

--total sales

select Round(sum(amount)::numeric,2) from new_year;

--Total orders

select count(distinct product_id) as total_orders
from new_year

--avg order value

select round(sum(amount)::numeric,2)/round(count(distinct product_id)::numeric,2) as avg_order_value
from new_year


--avg revenue

select round(avg(amount)::numeric,2) as avg_revenue
from new_year


-- Which gender has high purchasing power

select gender,Round(sum(amount),2) as total_purchase
from new_year
group by gender
order by total_purchase desc;

-- Total count of each gender count for gender

select gender,count(*) from new_year
group by 1

--count of age group

select age_group,count(*) as total_count
from new_year
group by 1
order by 1 asc;

--total purchase amount by age group

select age_group,Round(sum(amount),2) as total_purchase
from new_year
group by 1

--number of order in top 10 states

select state, count (orders) as total_orders
from new_year
group by 1
order by total_orders desc
limit 10

--total purchase amount by top 10 states

select state,Round(sum(amount),2) as total_purchases
from new_year
group by 1
order by total_purchases desc
limit 10


--count of marriage status

select marital_status,count(*) as total_count
from new_year
group by 1

--purchasing amount by marriage status

select marital_status,Round(sum(amount),2) as total_purchases
from new_year
group by 1
order by total_purchases;

--count the number of occupations

select occupation,count(*) as number_of_occupations
from new_year
group by 1
order by number_of_occupations desc

--purchasing amount by occupations

select occupation,sum(amount) as total_purchases
from new_year
group by 1
order by 2 desc

--count of product category

select product_category,count(*) as total_count
from new_year
group by 1
order by 2 desc

--total amount purchase by top categories

select product_category,round(sum(amount),2) as total_purchases
from new_year
group by 1
order by 2 desc;