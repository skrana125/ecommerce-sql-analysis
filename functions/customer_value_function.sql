DELIMITER $$

CREATE FUNCTION GetCustomerSpending(cust INT)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

DECLARE total DECIMAL(10,2);

SELECT SUM(p.amount)

INTO total

FROM Payments p

JOIN Orders o

ON p.order_id=o.order_id

WHERE o.customer_id=cust;

RETURN total;

END $$

DELIMITER ;
