-- Customers with orders

SELECT c.name,
o.order_id,
o.order_date

FROM Customers c

JOIN Orders o

ON c.customer_id=o.customer_id;



-- Products with category

SELECT p.product_name,
c.category_name,
p.price

FROM Products p

JOIN Categories c

ON p.category_id=c.category_id;



-- Customers without orders

SELECT c.name

FROM Customers c

LEFT JOIN Orders o

ON c.customer_id=o.customer_id

WHERE o.order_id IS NULL;



-- Order details

SELECT o.order_id,
p.product_name,
oi.quantity,
oi.price

FROM Orders o

JOIN Order_Items oi

ON o.order_id=oi.order_id

JOIN Products p

ON oi.product_id=p.product_id;
