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

