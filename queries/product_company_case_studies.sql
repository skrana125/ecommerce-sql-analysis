-- CASE 1
-- Business Story:
-- Amazon wants to identify customers who placed orders on consecutive days 
-- because they are considered highly engaged users.

SELECT DISTINCT customer_id

FROM(

SELECT customer_id,
order_date,

LAG(order_date) OVER(

PARTITION BY customer_id

ORDER BY order_date

) prev_date

FROM Orders

)t

WHERE DATEDIFF(order_date,prev_date)=1;



-- CASE 2
-- Business Story:
-- Flipkart wants to find customers whose latest order value 
-- is higher than their average order value.

SELECT customer_id,
order_id,
amount

FROM(

SELECT o.customer_id,
o.order_id,
p.amount,

AVG(p.amount) OVER(

PARTITION BY o.customer_id

) avg_spend,

ROW_NUMBER() OVER(

PARTITION BY o.customer_id

ORDER BY order_date DESC

) rn

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

)t

WHERE rn=1

AND amount > avg_spend;



-- CASE 3
-- Business Story:
-- Find products contributing highest revenue (top 20%)

SELECT *

FROM(

SELECT p.product_name,

SUM(oi.quantity*oi.price) revenue,

SUM(SUM(oi.quantity*oi.price)) OVER(

ORDER BY SUM(oi.quantity*oi.price) DESC

) running_revenue,

SUM(SUM(oi.quantity*oi.price)) OVER() total

FROM Order_Items oi

JOIN Products p

ON oi.product_id=p.product_id

GROUP BY p.product_name

)t

WHERE running_revenue <= total*0.2;



-- CASE 4
-- Business Story:
-- Swiggy wants to find peak sales day.

SELECT payment_date,

SUM(amount) revenue

FROM Payments

GROUP BY payment_date

ORDER BY revenue DESC

LIMIT 1;



-- CASE 5
-- Business Story:
-- Find customers who purchased from every category.

SELECT customer_id

FROM Orders o

JOIN Order_Items oi
ON o.order_id=oi.order_id

JOIN Products p
ON oi.product_id=p.product_id

GROUP BY customer_id

HAVING COUNT(DISTINCT category_id)=

(

SELECT COUNT(*)

FROM Categories

);



-- CASE 6
-- Business Story:
-- Identify customers whose spending increased every order.

SELECT customer_id

FROM(

SELECT o.customer_id,

p.amount,

LAG(p.amount) OVER(

PARTITION BY o.customer_id

ORDER BY order_date

) prev_amount

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

)t

WHERE amount > prev_amount;



-- CASE 7
-- Business Story:
-- Find second highest selling product.

SELECT product_name,

total_sold

FROM(

SELECT p.product_name,

SUM(oi.quantity) total_sold,

DENSE_RANK() OVER(

ORDER BY SUM(oi.quantity) DESC

) ranking

FROM Order_Items oi

JOIN Products p

ON oi.product_id=p.product_id

GROUP BY p.product_name

)t

WHERE ranking=2;



-- CASE 8
-- Business Story:
-- Find customers with more than 1 order but only one payment method.

SELECT customer_id

FROM Orders o

JOIN Payments p

ON o.order_id=p.order_id

GROUP BY customer_id

HAVING COUNT(DISTINCT order_id)>1

AND COUNT(DISTINCT payment_method)=1;



-- CASE 9
-- Business Story:
-- Find most common payment method.

SELECT payment_method,

COUNT(*) total

FROM Payments

GROUP BY payment_method

ORDER BY total DESC

LIMIT 1;



-- CASE 10
-- Business Story:
-- Identify customers who never ordered electronics.

SELECT customer_id

FROM Customers

WHERE customer_id NOT IN(

SELECT o.customer_id

FROM Orders o

JOIN Order_Items oi

ON o.order_id=oi.order_id

JOIN Products p

ON oi.product_id=p.product_id

WHERE p.category_id=1

);
