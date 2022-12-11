select * from employees;
select * from products;
select ProductID,ProductName,CategoryID from products;
select * from products where CategoryID = 2; 
select * from products where CategoryID = 2 and CategoryID = 4; 
select * from products where CategoryID = 2 or CategoryID = 4; 
select ProductID,ProductName,UnitPrice from products where UnitPrice>100; 
select * from products where ProductName="tofu";
select * from productS where CategoryID=2 or CategoryID=3 or CategoryID=4;
select * from products where SupplierID in (3,5,8);
select * from products where UnitPrice between 30 and 60; 
select * from products where UnitsInStock between 0 and 10;
select * from products where ProductName like "c%";
select * from products ORDER BY ProductName asc; 
select * from products ORDER BY ProductID desc; 
select * from customers;
select * from customers order by CompanyName asc; 
select * from orderdetails; 
select * from orderdetails order by 