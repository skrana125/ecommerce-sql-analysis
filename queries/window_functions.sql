-- Rank customers by spending

SELECT c.name,

SUM(p.amount) spending,

RANK() OVER(
ORDER BY SUM(p.amount) DESC
) ranking

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.name;



-- Order sequence per customer

SELECT order_id,

customer_id,

ROW_NUMBER() OVER(

PARTITION BY customer_id

ORDER BY order_date

) order_sequence

FROM Orders;



-- Running revenue

SELECT payment_date,

SUM(amount) daily_revenue,

SUM(amount) OVER(

ORDER BY payment_date

) running_total

FROM Payments;
