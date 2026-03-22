DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(

IN cust_id INT

)

BEGIN

SELECT *

FROM Orders

WHERE customer_id=cust_id;

END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE CustomerRevenue(

IN cust_id INT

)

BEGIN

SELECT SUM(p.amount) total_revenue

FROM Payments p

JOIN Orders o

ON p.order_id=o.order_id

WHERE o.customer_id=cust_id;

END $$

DELIMITER ;
