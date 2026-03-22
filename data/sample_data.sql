INSERT INTO Customers VALUES
(1,'Sumit Rana','sumit@gmail.com','Bangalore','2024-01-01'),
(2,'Rahul Sharma','rahul@gmail.com','Delhi','2024-02-01'),
(3,'Amit Kumar','amit@gmail.com','Mumbai','2024-03-01'),
(4,'Neha Singh','neha@gmail.com','Pune','2024-04-01');

INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Home');

INSERT INTO Products VALUES
(1,'Laptop',1,80000,10),
(2,'Mobile',1,30000,20),
(3,'Shirt',2,2000,50),
(4,'Washing Machine',3,25000,5);

INSERT INTO Orders VALUES
(101,1,'2024-05-01','Delivered'),
(102,2,'2024-05-02','Delivered'),
(103,1,'2024-05-10','Shipped'),
(104,3,'2024-05-15','Delivered');

INSERT INTO Order_Items VALUES
(1,101,1,1,80000),
(2,101,3,2,4000),
(3,102,2,1,30000),
(4,103,2,1,30000),
(5,104,4,1,25000);

INSERT INTO Payments VALUES
(1,101,'2024-05-01',84000,'UPI'),
(2,102,'2024-05-02',30000,'Card'),
(3,103,'2024-05-10',30000,'UPI'),
(4,104,'2024-05-15',25000,'Net Banking');
