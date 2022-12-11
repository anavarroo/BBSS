/*1. Por cada pedido, mostrar el número de líneas (tabla OrderDetails).*/

SELECT OrderID, COUNT(*) FROM orderdetails GROUP BY OrderID;

/*2. Por cada producto, mostrar el número de líneas (tabla OrderDetails).*/

SELECT ProductID, COUNT(*) FROM orderdetails GROUP BY ProductID;

/*3. Por cada cliente, mostrar el número de pedidos.*/

SELECT CustomerID, COUNT(*) FROM orders GROUP BY CustomerID;

/*4. Repetir el anterior sólo con los clientes de Londres.*/

SELECT CustomerID, COUNT(*), ShipCity FROM orders GROUP BY CustomerID HAVING ShipCity="London";

/*5. Repetir el ejercicio 1 mostrando sólo aquellos que tienen más de 4 líneas.*/

SELECT OrderID, COUNT(*) FROM orderdetails GROUP BY OrderID HAVING COUNT(*)>4;

/*6. Por cada cliente, mostrar el número de pedidos sólo para los clientes con más de 10
pedidos.*/

SELECT CustomerID, COUNT(CustomerID) FROM orders GROUP BY CustomerID HAVING(COUNT(OrderID))>10 ORDER BY COUNT(CustomerID);

/*7. Mostrar el número de empleados en cada ciudad.*/

SELECT (COUNT(EmployeeID)), City FROM employees GROUP BY City;

/*8. Mostrar el número de empleados en cada ciudad que tenga al menos dos empleados.*/

SELECT COUNT(EmployeeID), City FROM employees GROUP BY City HAVING COUNT(EmployeeID)>=2;

/*9. Mostrar el número de empleados en cada ciudad que tengan el cargo de ‘Sales
representative’, para aquellas ciudades con al menos dos empleados de este cargo.
Ordenar por el número de empleados.*/

SELECT (COUNT(EmployeeID)), City FROM employees GROUP BY City, Title HAVING (COUNT(EmployeeID)>=2 AND Title="Sales Representative");

/*SELECT (COUNT(EmployeeID)), City FROM employees WHERE Title="Sales Representative" GROUP BY City HAVING ((COUNT(EmployeeID))>=2);*/

/*10. Muestra las distintas ciudades en las que hay empleados.*/

SELECT City FROM employees GROUP BY City HAVING (COUNT(EmployeeID))>0;

/*11. Cuenta las ciudades en las que hay empleados.*/

SELECT COUNT(DISTINCT City) FROM employees;

/*12. Por cada país y ciudad de envío, mostrar el total de pedidos.*/

SELECT COUNT(*), ShipCity, ShipCountry FROM orders GROUP BY ShipCity, ShipCountry;

/*13. Por cada país y ciudad, contar los empleados que tienen el cargo de ‘Sales
representative’.*/

SELECT COUNT(EmployeeID), City, Country FROM employees WHERE Title ="Sales Representative" GROUP BY City, Country;

/*14. Por cada país y ciudad, contar el número de clientes.*/

SELECT COUNT(CustomerID), City, Country 
FROM customers 
GROUP BY City, Country;

/*15. Repetir el anterior mostrando sólo aquellos que tienen más de un cliente.*/

SELECT COUNT(CustomerID), City, Country 
FROM customers 
GROUP BY City, Country 
HAVING (COUNT(*))>1;

/*16. Por cada producto, hallar la cantidad de unidades vendidas y la media por pedido.*/

SELECT ProductID, SUM(Quantity), AVG(Quantity) 
FROM orderdetails 
GROUP BY ProductID;

/*17. Por cada pedido, contar los distintos productos vendidos (no la cantidad).*/

SELECT OrderID, COUNT(*) 
FROM orderdetails 
GROUP BY OrderID;

/*18. Repetir el anterior mostrando solo los pedidos con un único producto.*/

SELECT OrderID
FROM orderdetails 
GROUP BY OrderID 
HAVING COUNT(*)=1;

/*19. En la tabla de proveedores (suppliers), contar el número de proveedores por cada
título de contacto (ContactTitle).*/

SELECT COUNT(SupplierID), ContactTitle 
FROM suppliers 
GROUP BY ContactTitle;

/*20. Contar el número de productos que empiezan por la letra C.*/

SELECT COUNT(*) 
FROM products 
WHERE ProductName 
LIKE ("C%");

/*21. Contar el número de pedidos que fueron realizados en un mes de Julio (OrderDate).*/

SELECT COUNT(*) 
FROM orders 
WHERE month(OrderDate)=7;

/*22. Contar el número de pedidos realizados por el cliente DUMON en el año 1997.*/

SELECT COUNT(*) 
FROM orders 
WHERE CustomerID="DUMON" 
AND year(OrderDate)=1997;

/*23. Contar el número de pedidos (Orders) en los que los años de sus campos de tipo
fecha no son exactamente iguales.*/

SELECT COUNT(*) 
FROM orders 
WHERE (year(OrderDate)!=year(ShippedDate) 
OR year(OrderDate)!=year(RequiredDate) 
OR year(ShippedDate)!=year(RequiredDate));

SELECT COUNT(*) 
FROM orders 
WHERE (year(OrderDate)!=year(ShippedDate) 
AND year(OrderDate)!=year(RequiredDate) 
AND year(ShippedDate)!=year(RequiredDate));
