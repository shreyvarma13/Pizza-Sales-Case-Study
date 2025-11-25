-- BASIC QUESTIONS:

-- Q1) Retrieve the total number of orders placed.

Select COUNT(order_id) as total_orders FROM orders;

-- Q2) Calculate the total revenue generated from pizza sales.

Select ROUND(SUM(o.quantity * p.price),2) as total_revenue  -- ROUND function is used to round off value 
FROM order_details as o
INNER JOIN pizzas as p
ON o.pizza_id = p.pizza_id;

-- Q3) Identify the highest-priced pizza.

Select pt.name, p.price
FROM pizza_types as pt
INNER JOIN pizzas as p
ON pt.pizza_type_id = p.pizza_type_id
ORDER BY price DESC LIMIT 1;

-- Q4) Identify the most common pizza size ordered.

Select p.size, count(o.order_details_id) as qty_ordered
FROM pizzas as p
INNER JOIN order_details as o
ON p.pizza_id = o.pizza_id
GROUP BY p.size;

-- Q5) List the top 5 most ordered pizza types along with their quantities.

Select pt.name, SUM(o.quantity) as quantity_ordered
FROM pizzas as p
INNER JOIN pizza_types as pt
ON p.pizza_type_id = pt.pizza_type_id
INNER JOIN order_details as o
ON p.pizza_id = o.pizza_id
GROUP BY pt.name
ORDER BY quantity_ordered DESC LIMIT 5;



