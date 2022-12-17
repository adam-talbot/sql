/* --------------------
  Case Study #1 - Danny's Diner
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant? *
-- 2. How many days has each customer visited the restaurant? *
-- 3. What was the first item from the menu purchased by each customer? *
-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
-- 5. Which item was the most popular for each customer?
-- 6. Which item was purchased first by the customer after they became a member?
-- 7. Which item was purchased just before the customer became a member?
-- 8. What is the total items and amount spent for each member before they became a member?
-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

-- Example Query:
SELECT
  	product_id,
    product_name,
    price
FROM dannys_diner.menu
ORDER BY price DESC
LIMIT 5;

-- 1. What is the total amount each customer spent at the restaurant?
select
	customer_id, sum(price) as total_price
from dannys_diner.sales
join dannys_diner.menu
	using(product_id)
group by customer_id;

-- 2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) -- need to count distinct to account for multiple visits on same day
from dannys_diner.sales
group by customer_id;

-- 3. What was the first item from the menu purchased by each customer?
-- partition by customer_id, order by order_date, take the first row of each partition

-- using subquery
select customer_id, product_name
from (
  select
    *,
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_num -- use dense rank since just have day and could be multiple orders on same day
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  ) as t1 -- have to use a subquery due to order of operations since where is evaluated before select
where order_num = 1
group by customer_id, product_name -- group by to get unique combinations of customer and order in case same item was ordered twice on same day (don't want to see both in result)
;

-- using CTE (common table expression)
with ordered_sales as
(
  select
    *,
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_num
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
)
select customer_id, product_name
from ordered_sales
where order_num = 1
group by customer_id, product_name
; -- looks a little cleaner and more readable

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select product_name, count(*)
from dannys_diner.sales
join dannys_diner.menu using(product_id)
group by product_name
order by 2 desc
limit 1;

-- 5. Which item was the most popular for each customer?
-- window function with group by to get rank and then select top for each customer
select customer_id, product_name, order_count
from (
  select customer_id, product_name, count(product_id) as order_count,
      DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY count(product_name) desc) AS rank
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  group by customer_id, product_name
  order by customer_id, order_count desc
  ) as t1
where rank = 1;
-- need to understand group by used with window function better, don't understand why this window function can't be used with all columns and no other aggregations
-- could also use cte instead of subquery here

-- 6. Which item was purchased first by the customer after they became a member?
-- group by customer and item, min date --> doesn't work because different item customer combos will all show up, we just want one item
-- window function, partition by customer, min date --> works
-- window function, partition by customer, row number, order by date, first row --> works
-- window function, partition by customer, order by date, take first --> works

-- subquery
select customer_id, product_name, order_date, join_date
from (
  select customer_id, product_name, order_date, join_date,
      DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rank
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date >= join_date
  ) as t1
where rank = 1;
  
  -- cte
with first_order as (
  select customer_id, product_name, order_date, join_date,
  	DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rank
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date >= join_date
  )
select customer_id, product_name, order_date, join_date
from first_order
where rank =1;

-- using min() in window function
select customer_id, product_name, order_date, join_date
from (
  select customer_id, product_name, order_date, join_date,
      min(order_date) OVER(PARTITION BY customer_id) AS min_date
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date >= join_date
  ) as t1
where order_date = min_date;

-- try using first()
with first_order as (
  select customer_id, product_name, order_date, join_date,
      first_value(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) AS first_date
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date >= join_date
  )
select customer_id, product_name, order_date, join_date
from first_order
where first_date = order_date;

-- 7. Which item was purchased just before the customer became a member?
-- same as above just change the where condition
with previous_order as (
  select customer_id, product_name, order_date, join_date,
      first_value(order_date) OVER(PARTITION BY customer_id ORDER BY order_date desc) AS previous_date
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date < join_date
  )
select customer_id, product_name, order_date, join_date
from previous_order
where previous_date = order_date;

-- 8. What is the total items and amount spent for each member before they became a member?
-- group by with where clause
select
	customer_id, count(distinct product_name) as total_items, sum(price) as total_amount_spent -- could also omit distinct here to get total count of items instead of distinct items
from dannys_diner.sales
join dannys_diner.menu using(product_id)
join dannys_diner.members using(customer_id)
where order_date < join_date 
group by customer_id
order by customer_id;

-- Bonus question I created myself to try something out from a technical interview that I just had
-- Which person/people purchased the most items?
select customer_id
from (select customer_id, order_count, max(order_count) OVER() AS max_order_count
	  from (select customer_id, count(product_id) as order_count
			from dannys_diner.sales
			group by customer_id) as t1) as t2
where order_count = max_order_count
order by 1;
-- this question is much trickier than I thought due to order of execution
-- it is poassible to do window function without any partition and that is useful here since you can do an aggregation without grouping by anything

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- case statement, add new column with the conditions above (points) and the group by customer and get sum
with points_cte as (
  select 
  	*,
    case when product_name = 'sushi' then price * 20 else price * 10 end as points
  from dannys_diner.sales
  join dannys_diner.menu using(product_id))
select customer_id, sum(points) as total_points
from points_cte
group by 1
order by 1;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi
-- - how many points do customer A and B have at the end of January?
-- create date diff column and then use case when to get point column (not available in postressql)
-- add 6 days to join date and then look for values between those two dates
-- filter out orders after January
with prom_cte as (
  select
      *,
      join_date + INTERVAL '6 days' as last_day
  from dannys_diner.sales
  join dannys_diner.menu using(product_id)
  join dannys_diner.members using(customer_id)
  where order_date < '2021-02-01')
select
	customer_id,
    sum(case
        	when order_date between join_date and last_day then price * 20
        	when product_name = 'sushi' then price * 20
        	else price * 10
        end) as point_total
from prom_cte
group by 1
order by 1;

-- Join All The Things
select
	customer_id,
  order_date,
  product_name,
  price,
  case when join_date <= order_date then 'Y' else 'N' end as member
from dannys_diner.sales
left join dannys_diner.menu using(product_id)
left join dannys_diner.members using(customer_id)
order by 1, 2;

-- Rank All The Things
-- Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases 
-- so he expects null ranking values for the records when customers are not yet part of the loyalty program.
with member_cte as (
  select
    customer_id,
    order_date,
    product_name,
    price,
    case when join_date <= order_date then 'Y' else 'N' end as member
from dannys_diner.sales
left join dannys_diner.menu using(product_id)
left join dannys_diner.members using(customer_id)
order by 1, 2)
select
	*, 
    case when member = 'Y' then dense_rank() over(partition by customer_id order by order_date) end as ranking
from member_cte;