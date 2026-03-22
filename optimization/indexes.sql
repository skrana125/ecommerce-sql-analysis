CREATE INDEX idx_customer_id

ON Orders(customer_id);



CREATE INDEX idx_product_id

ON Order_Items(product_id);



CREATE INDEX idx_payment_date

ON Payments(payment_date);
