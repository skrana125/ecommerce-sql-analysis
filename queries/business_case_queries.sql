-- 1 Find top revenue generating cities

SELECT c.city,

SUM(p.amount) revenue

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.city

ORDER BY revenue DESC;



-- 2 Find customer churn (no orders in last period)

SELECT c.customer_id,
c.name

FROM Customers c

LEFT JOIN Orders o

ON c.customer_id=o.customer_id

GROUP BY c.customer_id,c.name

HAVING MAX(order_date) < '2024-05-05';



-- 3 Find most profitable category

SELECT cat.category_name,

SUM(oi.quantity*oi.price) total_revenue

FROM Categories cat

JOIN Products p
ON cat.category_id=p.category_id

JOIN Order_Items oi
ON p.product_id=oi.product_id

GROUP BY cat.category_name

ORDER BY total_revenue DESC;



-- 4 Find average days between customer orders

SELECT customer_id,

AVG(DATEDIFF(order_date,
LAG(order_date) OVER(

PARTITION BY customer_id

ORDER BY order_date

))) avg_days_between_orders

FROM Orders

GROUP BY customer_id;



-- 5 Find customers contributing 80% revenue (Pareto analysis)

SELECT *

FROM(

SELECT c.customer_id,

c.name,

SUM(p.amount) revenue,

SUM(SUM(p.amount)) OVER(

ORDER BY SUM(p.amount) DESC

) running_revenue,

SUM(SUM(p.amount)) OVER() total_revenue

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.customer_id,c.name

)t

WHERE running_revenue <= total_revenue*0.8;



-- 6 Find best selling product per category

SELECT *

FROM(

SELECT cat.category_name,

p.product_name,

SUM(oi.quantity) total_sold,

RANK() OVER(

PARTITION BY cat.category_name

ORDER BY SUM(oi.quantity) DESC

) ranking

FROM Categories cat

JOIN Products p
ON cat.category_id=p.category_id

JOIN Order_Items oi
ON p.product_id=oi.product_id

GROUP BY cat.category_name,p.product_name

)t

WHERE ranking=1;



-- 7 Detect inventory risk products

SELECT product_name,

stock,

CASE

WHEN stock <5 THEN 'CRITICAL'

WHEN stock <10 THEN 'LOW'

ELSE 'SAFE'

END stock_status

FROM Products;



-- 8 Find daily revenue growth %

SELECT payment_date,

SUM(amount) revenue,

ROUND(

(SUM(amount) -

LAG(SUM(amount)) OVER(

ORDER BY payment_date

))

/

LAG(SUM(amount)) OVER(

ORDER BY payment_date

)*100,2

) growth_percentage

FROM Payments

GROUP BY payment_date;



-- 9 High value customers (above average spending)

SELECT customer_id,

SUM(amount) spending

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

GROUP BY customer_id

HAVING SUM(amount) >

(

SELECT AVG(amount)

FROM Payments

);



-- 10 Customer segmentation

SELECT customer_id,

SUM(amount) spending,

CASE

WHEN SUM(amount) > 70000
THEN 'Premium'

WHEN SUM(amount) > 30000
THEN 'Gold'

ELSE 'Regular'

END customer_segment

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

GROUP BY customer_id;
