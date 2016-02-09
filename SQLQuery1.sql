drop 

use Books;

CREATE TABLE SalesPersons (
ID INT IDENTITY(1,1) NOT NULL,
EmployeeNumber varchar(20) NOT NULL,
Name varchar(50) NOT NULL,
DepartmentCode varchar(50),
PRIMARY KEY (ID)
);

CREATE TABLE Customers(
Customer_ID INT IDENTITY(1,1) NOT NULL,
PRIMARY KEY (Customer_ID),
address VARCHAR (50),
);

CREATE TABLE SalesItems(
Items_ID INT IDENTITY(1,1) NOT NULL,
PRIMARY KEY (Items_ID)
);

CREATE TABLE Orders (
Order_ID INT IDENTITY(1,1) NOT NULL,
Order_status INT, --- 0 = submitted, 1 = handeled by company, 3 = delivery booked, 4 = delivered.
Customer_ID INT,
PRIMARY KEY (Order_ID),
Order_submission_date datetime
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Orders_delivery(
Orders_deliveryID INT IDENTITY(1,1)	NOT NULL,
PRIMARY KEY (Orders_deliveryID)
Delivery_Address varchar(50),
Delivery_date datetime
);