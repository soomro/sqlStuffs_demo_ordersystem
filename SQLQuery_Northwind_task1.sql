-- northwind task

/* --1
*/
Select CompanyName as Customer , Customers.City as "Customer City", 
Products.ProdName as "Product Name", Suppliers.CoName As Supplier
FROM
Customers JOIN Orders
ON
Customers.CustomerID = Orders.CustomerID
JOIN  [Order Details]
ON  Orders.OrderID =  [Order Details].ID
JOIN Products
ON [Order Details].ProductID = Products.ID
JOIN
Suppliers
ON Suppliers.ID = Products.SupplierID
Order by CompanyName;




/* --2*/
--vilka producter saljs mest av

-- 2 a
select p.ProdName, od.ProductID, p.ProdName, od.Quantity
from Products p inner join [Order Details] od
on
 od.Quantity = (select max(od.Quantity) from [Order Details] od)
 AND
 od.ProductID = p.ID;

-- 2 b
Select o.OrderID, p.ProdName, od.Quantity, FORMAT(o.OrderDate, 'yyyy-MM-dd') OrderDate
from Orders o, Products p
join [Order Details] od
on Orders.OrderID = od.ID
join Products p on od.ProductID = p.ID
where o.OrderDate between '1996-01-01' and '2015-12-31'
order by o.OrderDate DESC


/* --3

*/


/* --4
*/

/* --5
Lägg till en order med 5 unika produkter for liunden 
"Folko". (orders, order details).
*/

insert into Orders (CustomerID, EmployeeID, OrderDate) Values ( 'FOLKO', 1, GETDATE()); 

insert into [Order Details] (ID, ProductID, UnitPrice, Quantity, Discount)
Values (11078, 77, 21.05, 100, 0);
insert into [Order Details] (ID, ProductID, UnitPrice, Quantity, Discount)
Values (11078, 71, 21.05, 20, 0);
insert into [Order Details] (ID, ProductID, UnitPrice, Quantity, Discount)
Values (11078, 60, 21.05, 34, 0);
insert into [Order Details] (ID, ProductID, UnitPrice, Quantity, Discount)
Values (11078, 73, 21.05, 53, 0);
insert into [Order Details] (ID, ProductID, UnitPrice, Quantity, Discount)
Values (11078, 74, 21.05, 77, 0);

/* --6
a- Lägg till en ny kund med kundid='LEXIC'
*/
insert into Customers (CustomerID, CompanyName) Values (92, 'LEXIC');

/*
b- Lägg till en order for kunden 'LEXICON' med 3 nya produkter
Tabeller: Customers, Orders, Order details.
*/
insert into Orders (CustomerID, EmployeeID, OrderDate) Values ( 'LEXIC', 2, '2016-02-12'); 

select Customers.CustomerID from Customers where CustomerID =92;