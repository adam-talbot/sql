/* --------------------
  Case Study #2 - Pizza Runner
   --------------------*/

-- DDL in PostgresSQL

CREATE SCHEMA pizza_runner;
SET search_path = pizza_runner;

DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
  "runner_id" INTEGER,
  "registration_date" DATE
);
INSERT INTO runners
  ("runner_id", "registration_date")
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');


DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(4),
  "extras" VARCHAR(4),
  "order_time" TIMESTAMP
);

INSERT INTO customer_orders
  ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
  "order_id" INTEGER,
  "runner_id" INTEGER,
  "pickup_time" VARCHAR(19),
  "distance" VARCHAR(7),
  "duration" VARCHAR(10),
  "cancellation" VARCHAR(23)
);

INSERT INTO runner_orders
  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
  "pizza_id" INTEGER,
  "pizza_name" TEXT
);
INSERT INTO pizza_names
  ("pizza_id", "pizza_name")
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
  "pizza_id" INTEGER,
  "toppings" TEXT
);
INSERT INTO pizza_recipes
  ("pizza_id", "toppings")
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
  "topping_id" INTEGER,
  "topping_name" TEXT
);
INSERT INTO pizza_toppings
  ("topping_id", "topping_name")
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- DDL is MySQL
DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
  runner_id INTEGER,
  registration_date DATE
);
INSERT INTO runners
  (runner_id, registration_date)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');


DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time TIMESTAMP
);

INSERT INTO customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');


DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

INSERT INTO runner_orders
  (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');


DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);
INSERT INTO pizza_names
  (pizza_id, pizza_name)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');


DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);
INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');


DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);
INSERT INTO pizza_toppings
  (topping_id, topping_name)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');

-- check data types of columns in postgresql
SELECT
	*
FROM
    information_schema.columns
WHERE
    table_schema = 'pizza_runner' AND 
    table_name = 'customer_orders';

-- clean up customer_orders table (add this to ddl)
drop table if exists customer_orders_clean;
create table customer_orders_clean as (
  select
  	order_id, customer_id, pizza_id,
  	case 
  		when exclusions like 'null' then null
  		when exclusions like '' then null
  		when exclusions like ' ' then null
  		else exclusions 
  		end as exclusions,
  	case 
  		when extras like 'null' then null
  		when extras like '' then null
  		when extras like ' ' then null
  		else extras 
  		end as extras,
  order_time
  from customer_orders
);

-- clean up runner_orders table (add this to ddl)
-- remove null strings from pick_up time, distance, duration, and cancellation columns
-- make missing values consistent in cancellation column
-- just pull numbers from distance and duration columns and change data types to float and int respectively
-- change pickup_time to timestamp dtype
drop table if exists runner_orders_clean;
create table runner_orders_clean as (
  select
  	order_id, runner_id,
  	case 
  		when pickup_time like 'null' then null
  		else pickup_time 
  		end as pickup_time,
  	case 
  		when distance like 'null' then null
  		else regexp_replace(distance, '[^0-9\.]', '') 
  		end as distance,
    case 
  		when duration like 'null' then null
  		else regexp_replace(duration, '[^0-9\.]', '') 
  		end as duration,
    case 
  		when cancellation like 'null' then null
  		when cancellation like '' then null
  		when cancellation like ' ' then null
      else cancellation
  		end as cancellation
  from runner_orders
);
alter table runner_orders_clean 
modify column pickup_time timestamp,
modify column distance float,
modify column duration integer;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

-- check column dtypes in mysql
SELECT
	*
FROM
    information_schema.columns
WHERE
    table_name = 'runner_orders_clean'; -- looks good

-- A. Pizza Metrics
-- 1. How many pizzas were ordered?
-- 2. How many unique customer orders were made?
-- 3. How many successful orders were delivered by each runner?
-- 4. How many of each type of pizza was delivered?
-- 5. How many Vegetarian and Meatlovers were ordered by each customer?
-- 6. What was the maximum number of pizzas delivered in a single order?
-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
-- 8. How many pizzas were delivered that had both exclusions and extras?
-- 9. What was the total volume of pizzas ordered for each hour of the day?
-- 10. What was the volume of orders for each day of the week?

-- 1. How many pizzas were ordered?
select count(*) as total_orders from customer_orders_clean; -- 14

-- 2. How many unique customer orders were made?
select count(distinct order_id) from customer_orders_clean; -- 10

-- 3. How many successful orders were delivered by each runner?
select runner_id, count(distinct order_id)
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by runner_id;

-- 4. How many of each type of pizza was delivered?
select pizza_name, count(*) as total_ordered
from customer_orders_clean
join pizza_names using(pizza_id)
join runner_orders_clean using(order_id)
where cancellation is null
group by pizza_name
order by 2 desc;

-- 5. How many Vegetarian and Meatlovers were ordered by each customer?
select customer_id, pizza_name, count(*) as pizza_name_count
from customer_orders_clean
join pizza_names using(pizza_id)
group by customer_id, pizza_name
order by 1;

-- 6. What was the maximum number of pizzas delivered in a single order?
select order_id, count(*) as total_pizzas_delivered
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by order_id
order by 2 desc
limit 1;

-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
with change_table as (
  select 
    *,
    case 
      when extras is not null then 'Y'
      when exclusions is not null then 'Y' 
      else 'N' 
      end as order_change
  from customer_orders_clean
  join runner_orders_clean using(order_id)
  where cancellation is null)
select customer_id, order_change, count(*) as order_count
from change_table
group by customer_id, order_change
order by customer_id;

-- alternate method
select 
  customer_id,
  sum(case when (exclusions is not null or extras is not null) then 1 else 0 end) as at_least_one_change,
  sum(case when (exclusions is null and extras is null) then 1 else 0 end) as no_change
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by customer_id;

-- 8. How many pizzas were delivered that had both exclusions and extras?
with both_table as (
  select 
    *,
    case 
	  when exclusions is not null and extras is not null then 'Y'
      else 'N' 
      end as both_excl_extra
  from customer_orders_clean
  join runner_orders_clean using(order_id)
  where cancellation is null)
select count(*) as pizzas_delivered_with_excl_and_extra
from both_table
where both_excl_extra = 'Y';

-- 9. What was the total volume of pizzas ordered for each hour of the day?
select 
  	hour(order_time) as hour,
    count(order_id) as order_volume
from customer_orders_clean
group by 1
order by 1;

-- 10. What was the volume of orders for each day of the week?
select 
  	dayname(order_time) as hour, -- name of day
    count(order_id) as order_volume
from customer_orders_clean
group by 1
order by 2 desc;

select 
  	dayofweek(order_time) as hour, -- day number
    count(order_id) as order_volume
from customer_orders_clean
group by 1
order by 1;

-- B. Runner and Customer Experience
-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
-- 4. What was the average distance travelled for each customer?
-- 5. What was the difference between the longest and shortest delivery times for all orders?
-- 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
-- 7. What is the successful delivery percentage for each runner?

-- 1. How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
-- Pull week number from timestamp and group by that new column
-- check dtypes of columns in runners table
SELECT
	*
FROM
    information_schema.columns
WHERE
    table_name = 'runners'; -- date type present for registration_date column

select
	week(registration_date) as week,
  count(runner_id) as new_runner_count
from runners
group by 1
order by 1;

-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
select 
	runner_id,
  avg(TIMESTAMPDIFF(minute, order_time, pickup_time)) as avg_arrival_time
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by 1
order by 1;

-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
with pizza_count_cte as(
  select 
    order_id,
    count(*) as pizza_count,
    avg(TIMESTAMPDIFF(minute, order_time, pickup_time)) as avg_arrival_time
  from customer_orders_clean
  join runner_orders_clean using(order_id)
  where cancellation is null
  group by 1
  order by 1)
select
	pizza_count,
  avg(avg_arrival_time)
from pizza_count_cte
group by 1
order by 1;
-- This should work, might be a more elegant way to do this one though

-- 4. What was the average distance travelled for each customer?
select 
 customer_id,
 round(avg(distance), 2) as avg_distance_travelled
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by 1
order by 1;

-- 5. What was the difference between the longest and shortest delivery times for all orders?
-- Assuming this question is asking how long it takes to get from HQ to customer location
select 
	max(duration) - min(duration) as diff_max_min_duration
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null;

-- If we are taking into account the time from order to pickup at HQ as well as time from HQ to customer location
with total_delivery_time_cte as (
  select 
      *,
      duration + TIMESTAMPDIFF(minute, order_time, pickup_time) as total_delivery_time
  from customer_orders_clean
  join runner_orders_clean using(order_id)
  where cancellation is null)
select
	max(total_delivery_time) - min(total_delivery_time) as diff_max_min_delivery_time
from total_delivery_time_cte;

-- 6. What was the average speed for each runner for each delivery and do you notice any trend for these values?
-- Convert km to miles in distance column
-- Convert minutes to hours in the duration column
-- Calculate mph for each delivery
-- Calculate average mph for each runner

-- Incorrect, join is unnecessary, creates duplicate avg_mph values that change the average
select 
	runner_id,
 	avg((distance * 0.621371) / (duration / 60)) as avg_mph
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null
group by 1
order by 1;

-- The query resolves the issue with first attempt and is technically correct but it is completely unnecessary to do the join and then take the row number, don't need the join at all
with order_rank_cte as
(select 
	*,
  (distance * 0.621371) / (duration / 60) as mph,
  row_number() OVER(PARTITION BY order_id) AS row_num
from customer_orders_clean
join runner_orders_clean using(order_id)
where cancellation is null)
select
	runner_id,
  avg(mph) as avg_mph
from order_rank_cte
where row_num = 1
group by 1
order by 1;

-- Correct and simplest query
select
	runner_id,
  avg((distance * 0.621371) / (duration / 60)) as avg_mph
from runner_orders_clean
where cancellation is null
group by 1
order by 1;

-- 7. What is the successful delivery percentage for each runner?
-- this gets counts for each case but not percentages
with cancellation_cte as (
  select 
	*,
  case when cancellation is null then 'N' else 'Y' end as is_cancelled
from runner_orders_clean)
select runner_id, is_cancelled, count(order_id)
from cancellation_cte
group by 1, 2
order by 1;

-- this gets the percentages we are looking for
select
	runner_id,
  round(sum(case when cancellation is null then 1 else 0 end) / count(*) * 100, 0) as success_percentage
from runner_orders_clean
group by 1
order by 1;

-- C. Ingredient Optimisation
-- 1. What are the standard ingredients for each pizza?
-- 2. What was the most commonly added extra?
-- 3. What was the most common exclusion?
-- 4. Generate an order item for each record in the customers_orders table in the format of one of the following:
--  Meat Lovers
--  Meat Lovers - Exclude Beef
--  Meat Lovers - Extra Bacon
--  Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers
-- 5. Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
--  For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
-- 6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

-- 1. What are the standard ingredients for each pizza?
-- Need to explode the list of ingredients from single value to rows so I can join with other table to get topping_name
-- Can't really find a way to do this in mySQL (there is no good equivalent of the split() function in Python)
-- reformat table with ddl and use group_concat() function
DROP TABLE IF EXISTS pizza_recipes_reform;
CREATE TABLE pizza_recipes_reform (
  pizza_id INTEGER,
  toppings TEXT
);
INSERT INTO pizza_recipes_reform
  (pizza_id, toppings)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 8),
  (1, 10),
  (2, 4),
  (2, 6),
  (2, 7),
  (2, 9),
  (2, 11),
  (2, 12);

select
	pizza_name, 
  group_concat(topping_name) as standard_toppings
from pizza_recipes_reform as r
join pizza_toppings as t on r.toppings = t.topping_id
join pizza_names using(pizza_id)
group by 1
order by 1;

-- Ingredient Optimisation questions don't have good solutions in mySQL, moving to next section

-- D. Pricing and Ratings
-- 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - 
--  how much money has Pizza Runner made so far if there are no delivery fees?
-- 2. What if there was an additional $1 charge for any pizza extras?
--   Add cheese is $1 extra
-- 3. The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, 
--  how would you design an additional table for this new dataset - generate a schema for this new table and insert your own data for 
--  ratings for each successful customer order between 1 to 5.
-- 4. Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?
--  customer_id
--  order_id
--  runner_id
--  rating
--  order_time
--  pickup_time
--  Time between order and pickup
--  Delivery duration
--  Average speed
--  Total number of pizzas
-- 5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

-- 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - 
--  how much money has Pizza Runner made so far if there are no delivery fees?
select
    sum(case when pizza_name = 'Meatlovers' then 12 else 10 end) as total_price
from customer_orders_clean
join pizza_names using(pizza_id)
join runner_orders_clean using(order_id)
where cancellation is null;
