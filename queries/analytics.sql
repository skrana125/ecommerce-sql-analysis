-- Monthly revenue

SELECT MONTH(payment_date) month,

SUM(amount) revenue

FROM Payments

GROUP BY MONTH(payment_date);



-- Repeat customers

SELECT customer_id,

COUNT(order_id) total_orders

FROM Orders

GROUP BY customer_id

HAVING COUNT(order_id)>1;



-- Low inventory products

SELECT product_name,

stock

FROM Products

WHERE stock < 10;



-- Top selling products

SELECT p.product_name,

SUM(oi.quantity) total_sold

FROM Order_Items oi

JOIN Products p

ON oi.product_id=p.product_id

GROUP BY p.product_name

ORDER BY total_sold DESC;
