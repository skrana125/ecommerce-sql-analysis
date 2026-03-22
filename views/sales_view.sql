CREATE VIEW Customer_Sales_Summary AS

SELECT 

c.customer_id,
c.name,
COUNT(o.order_id) total_orders,
SUM(p.amount) total_spent,
AVG(p.amount) avg_order_value

FROM Customers c

JOIN Orders o
ON c.customer_id=o.customer_id

JOIN Payments p
ON o.order_id=p.order_id

GROUP BY c.customer_id,c.name;
