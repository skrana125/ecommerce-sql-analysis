-- 1 Top 3 customers by spending

SELECT *

FROM(

SELECT c.customer_id,
c.name,
SUM(p.amount) spending,

DENSE_RANK() OVER(
ORDER BY SUM(p.amount) DESC
) ranking

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.customer_id,c.name

)t

WHERE ranking<=3;



-- 2 Customer lifetime value

SELECT c.customer_id,
c.name,
SUM(p.amount) lifetime_value

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.customer_id,c.name;



-- 3 Average order value per customer

SELECT c.customer_id,
c.name,

AVG(p.amount) avg_order_value

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.customer_id,c.name;



-- 4 Customers with no purchases

SELECT *

FROM Customers

WHERE customer_id NOT IN(

SELECT customer_id
FROM Orders

);



-- 5 Revenue by category

SELECT cat.category_name,

SUM(oi.quantity*oi.price) revenue

FROM Order_Items oi

JOIN Products p
ON oi.product_id=p.product_id

JOIN Categories cat
ON p.category_id=cat.category_id

GROUP BY cat.category_name;



-- 6 Most recent order per customer

SELECT *

FROM(

SELECT o.*,

ROW_NUMBER() OVER(

PARTITION BY customer_id

ORDER BY order_date DESC

) rn

FROM Orders o

)t

WHERE rn=1;



-- 7 Order status distribution

SELECT order_status,

COUNT(*) total

FROM Orders

GROUP BY order_status;



-- 8 Customers ordering multiple categories

SELECT c.name,

COUNT(DISTINCT p.category_id) categories

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Order_Items oi
ON o.order_id=oi.order_id

JOIN Products p
ON oi.product_id=p.product_id

GROUP BY c.name

HAVING COUNT(DISTINCT p.category_id)>1;



-- 9 Products never ordered

SELECT product_name

FROM Products

WHERE product_id NOT IN(

SELECT product_id

FROM Order_Items

);



-- 10 Sales trend by date

SELECT payment_date,

SUM(amount) revenue,

LAG(SUM(amount)) OVER(

ORDER BY payment_date

) previous_day_sales

FROM Payments

GROUP BY payment_date;
