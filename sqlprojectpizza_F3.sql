-- INTERMEDIATE QUESTIONS

-- Q1) Join the necessary tables to find the total quantity of each pizza category ordered.

Select pt.category, SUM(o.quantity) total_quantity  
FROM pizzas as p  
INNER JOIN pizza_types as pt
ON p.pizza_type_id = pt.pizza_type_id
INNER JOIN order_details as o
ON p.pizza_id = o.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;  



-- Q2) Determine the distribution of orders by hour of the day.

Select hour(order_time) as order_hour, count(order_id) as total_orders
From orders group by order_hour
ORDER  BY total_orders DESC;


-- Q3) Join relevant tables to find the category-wise distribution of pizzas.

Select category, COUNT(name) as no_of_pizzas
FROM pizza_types
GROUP BY category;


-- Q4) Group the orders by date and calculate the average number of pizzas ordered per day.
Select round(avg(quantity),0) from 
(Select o.order_date, SUM(od.quantity) as quantity
FROM orders as o
INNER JOIN order_details as od
ON o.order_id = od.order_id
GROUP BY o.order_date) as order_quantity;


-- Q5) Determine the top 3 most ordered pizza types based on revenue.

Select pt.name, round(sum(od.quantity * p.price),0) as total_revenue
FROM pizzas as p
INNER JOIN pizza_types as pt
ON p.pizza_type_id = pt.pizza_type_id
INNER JOIN order_details as od
ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY total_revenue DESC LIMIT 3;

