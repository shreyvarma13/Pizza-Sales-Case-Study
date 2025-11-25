-- ADVANCED QUESTIONS:
-- Q1) Calculate the percentage contribution of each pizza type to total revenue.

SELECT category,
ROUND(total_revenue / total_sum * 100, 2) AS percentage_contribution
FROM (
SELECT pt.category,
SUM(od.quantity * p.price) AS total_revenue,
(SELECT SUM(od.quantity * p.price)
FROM pizzas AS p
JOIN pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details AS od ON p.pizza_id = od.pizza_id) AS total_sum
FROM pizzas AS p
JOIN pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details AS od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
) AS revenue_by_category
ORDER BY percentage_contribution DESC;

/*
SUMMARY OF LOGIC
1. Calculate total revenue for each pizza category
2. Calculate grand total revenue
3. For each category: (category_revenue / total_revenue) * 100
4. Show result as percentage
5. Sort by highest percentage first
*/


-- Q2) Analyze the cumulative revenue generated over time.

Select order_date,
SUM(revenue) over(order by order_date) as cumulative_revenue
FROM
(Select orders.order_date,
ROUND(SUM(order_details.quantity * pizzas.price)) as revenue
FROM order_details 
INNER JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
INNER JOIN orders 
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as daily_sales;

/* SUMMARY OF LOGIC OF ABOVE QUESTION
1)Calculate total revenue per category:
Multiply quantity × price for each pizza and group by category.

2)Compute overall revenue:
Sum all revenues from every category to get the grand total.

3)Find percentage share of each category:
Use the formula:
(category_revenue / total_revenue) × 100.

4)Round the percentage:
Round the result to 2 decimal places for readability.

5)Sort the results:
Display categories in descending order based on their percentage share.
*/
 
-- Q3) Determine the top 3 most ordered pizza types based on revenue for each pizza category.

Select name, revenue FROM
(Select category, name, revenue,
RANK() over(partition by category order by revenue desc) as rank_on_revenue
FROM
(Select pizza_types.category, pizza_types.name,
SUM((order_details.quantity) * pizzas.price) as revenue
FROM pizza_types join pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) as a) as b
where rank_on_revenue <= 3;


/*  SUMMARY OF LOGIC OF ABOVE QUESTION
1)Join relevant tables:
Combine pizza_types, pizzas, and order_details to access category, name, quantity, and price.

2)Calculate revenue per pizza type:
Multiply quantity × price and group the result by category and name.

3)Rank pizza types within each category:
Use RANK() with PARTITION BY category and ORDER BY revenue DESC to rank by revenue within each category.

4)Filter top 3 in each category:
Only keep rows where the rank_on_revenue ≤ 3.

5)Select required columns:
Show name and corresponding revenue for the top 3 pizza types in each category.
*/