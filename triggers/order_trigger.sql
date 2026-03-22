DELIMITER $$

CREATE TRIGGER update_stock_after_order

AFTER INSERT

ON Order_Items

FOR EACH ROW

BEGIN

UPDATE Products

SET stock = stock - NEW.quantity

WHERE product_id = NEW.product_id;

END $$

DELIMITER ;
