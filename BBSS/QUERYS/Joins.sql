/*1.Obtener todas las ordenes hechas por el empleado King Robert*/

SELECT emp.FirstName, emp.LastName, ord.* 
FROM orders AS ord 
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID) 
WHERE emp.FirstName="Robert" AND emp.LastName="King";

/*2.Obtener todas las ordenes hechas por el empleado King Robert, Davolio Nancy y Fuller Andrew*/

SELECT ord.*, emp.FirstName, emp.LastName 
FROM orders AS ord 
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID) 
WHERE (emp.FirstName="Robert" AND emp.LastName="King") 
OR (emp.FirstName="Nancy" AND emp.LastName="Davolio") 
OR (emp.FirstName="Andrew" AND emp.LastName="Fuller");

/*3.Obtener todas las ordenes por el cliente cuya compania es "Que del?cia"*/

SELECT ord.* FROM orders AS ord WHERE ord.ShipName="Que Del�cia";

/*4.Obtener todos los productos(codigo, nombre, precio, stock) de la orden 10257*/

SELECT prod.ProductID, prod.ProductName, prod.UnitPrice, prod.UnitsInStock 
FROM orders AS ord 
JOIN orderdetails AS orddet 
ON (ord.OrderID=orddet.OrderID) 
JOIN products AS prod 
ON (orddet.ProductID=prod.ProductID) 
WHERE ord.OrderID=10257;

/*5.Obtener todos los productos(codigo, nombre, precio, stock) de las ordenes hechas desde 1997 hasta la fecha de hoy*/

SELECT ord.OrderID, prod.ProductID, prod.ProductName, prod.UnitPrice, prod.UnitsInStock 
FROM orders AS ord 
JOIN orderdetails AS orddet 
ON (ord.OrderID=orddet.OrderID) 
JOIN products AS prod 
ON (orddet.ProductID=prod.ProductID) 
WHERE ord.OrderDate BETWEEN '1997-01-01' AND curdate(); /*REVISAR*/

/*6.Mostar el ID del pedido, fecha del pedido y el total de productos de cada pedido*/

SELECT ord.OrderID, ord.OrderDate, SUM(orddet.Quantity) "Total productos"
FROM orders AS ord 
JOIN orderdetails AS orddet 
ON (ord.OrderID=orddet.OrderID) 
GROUP BY orddet.OrderID;

SELECT ord.OrderID, ord.OrderDate, COUNT(*) "Total productos"
FROM orders AS ord 
JOIN orderdetails AS orddet 
ON (ord.OrderID=orddet.OrderID) 
GROUP BY orddet.OrderID;

/*7.Obtener el nombre de todas las categorias y los nombres de sus productos, precio y stock*/

SELECT cat.CategoryName, prod.ProductName, prod.UnitPrice, prod.UnitsInStock 
FROM products AS prod 
JOIN categories AS cat 
ON (prod.CategoryID=cat.CategoryID);

/*8.Obtener el número de productos por cada categoría. Mostrando el nombre de la categoría, el nombre del producto, 
y el total de productos por categoría, solamente de las categorías 3, 5 y 8. Ordenar por el nombre de la categoría*/

SELECT cat.CategoryName, COUNT(cat.CategoryID)
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID)
WHERE cat.CategoryID IN (3,5,8)
GROUP BY cat.CategoryID;

/*9.Visualizar el nombre de la categoria y el numero de productos que hay por cada categoria*/

SELECT cat.CategoryName, COUNT(prod.ProductID) "Total productos"
FROM categories AS cat
JOIN products AS prod
ON (cat.CategoryID=prod.CategoryID)
GROUP BY cat.CategoryID;

/*10. Por cada pedido, obtener el ID de pedido, ID de producto, ID de proveedor y el nombre de la compañía.*/

SELECT ord.OrderID, orddet.ProductID, sup.SupplierID, sup.CompanyName
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID = orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);

/*11. Por cada pedido, obtener el ID de pedido, ID de empleado y el nombre de empleado.*/

SELECT ord.OrderID, concat_ws(' ',emp.FirstName, emp.LastName) "Nombre empleado"
FROM orders AS ord
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID);

/*12. Por cada producto, obtener el ID de producto, ID de categoría y el nombre de categoría.*/

SELECT prod.ProductID, prod.CategoryID, cat.CategoryName
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID);

/*13. Por cada empleado, imprimir el ID de empleado, nombre, apellido e ID de territorio.*/

SELECT emp.EmployeeID, emp.FirstName, emp.LastName, empter.TerritoryID
FROM employees AS emp
JOIN employeeterritories AS empter
ON (emp.EmployeeID=empter.EmployeeID);

/*14. Por cada cliente, mostrar el ID de cliente, nombre de contacto y pedidos.*/

SELECT cust.CustomerID, cust.ContactName, ord.OrderID
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID);

/*15. Por cada cliente, mostrar el ID de cliente, nombre de contacto y numero total pedidos.*/

SELECT cust.CustomerID, cust.ContactName, COUNT(*) "Total pedidos"
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID)
GROUP BY cust.CustomerID;

/*16. Por cada pedido presente en orderdetails, imprimir toda su información y además, el nombre de la categoría
a la que pertenece*/

SELECT orddet.*, cat.CategoryName
FROM orderdetails AS orddet
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID);

/*17. Por cada pedido, mostrar el ID de pedido, dirección del cliente y dirección del empleado.*/

SELECT ord.OrderID, cust.Address "direc. cliente", emp.Address "direc. empleado"
FROM orders AS ord
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID)
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID);

/*18. Por cada producto, mostrar el ID de producto, nombre de producto y dirección del proveedor.*/

SELECT prod.ProductID, prod.ProductName, sup.Address "Direcc. Proveedor"
FROM products AS prod
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);

/*19. Visualizar el nombre de la compañía y el id del cliente, fecha, precio unitario y producto de la orden*/

SELECT cust.CompanyName, cust.CustomerID, ord.OrderDate, orddet.UnitPrice, prod.ProductName
FROM customers AS cust
JOIN orders AS ord
ON (ord.CustomerID=cust.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID);

/*20. Mostrar el nombre del producto, el precio, el stock y el nombre de la categoría a la que pertenece*/

SELECT prod.ProductName, prod.UnitPrice, prod.UnitsInStock, cat.CategoryName
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID);

/*21. Mostrar el nombre del producto, el precio producto, el código del proveedor y el nombre de la compañía proveedora*/

SELECT prod.ProductName, prod.UnitPrice, prod.SupplierID, sup.CompanyName
FROM products AS prod
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);

/*22. Mostrar el id del pedido, fecha, código del producto, precio, código del empleado y su nombre completo*/

SELECT ord.OrderID, ord.OrderDate, orddet.ProductID, orddet.UnitPrice, ord.EmployeeID, concat_ws(' ',emp.FirstName,emp.LastName) "Nombre completo"
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID);

/*23. Calcular el stock de productos por cada categoria. Mostrar el nombre de la categoria y el stock por categoria*/

SELECT cat.CategoryName, SUM(prod.UnitsInStock) "Stock total"
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID)
GROUP BY prod.CategoryID;

/*24. Obtener el nombre del cliente, nombre del proveedor, nombre del empleado y el nombre de los productos que estan en la orden 10794*/

SELECT cust.ContactName "Cliente", sup.CompanyName "Proveedor", concat_ws(' ', emp.FirstName, emp.LastName)"Empleado", prod.ProductName"Producto"
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID)
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
WHERE ord.OrderID="10794";

/*25. Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida del producto, 
nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor, usar Join*/

SELECT cust.CompanyName "Compañia cliente", ord.OrderID, ord.OrderDate "Fecha orden", orddet.ProductID, orddet.Quantity"Cantidad", prod.ProductName, sup.CompanyName"Proveedor", sup.City "Ciudad provee"
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);

/*26. Seleccionar cuantos proveedores tengo en cada país, considerando solo a los nombres de los proveedores que comienzan 
con la letra E hasta la letra P, además de mostrar solo los países donde tenga más de 2 proveedores*/

SELECT sup.Country, COUNT(*)
FROM suppliers AS sup
WHERE lower(substring(sup.ContactName,1,1)) BETWEEN ("e") AND ("q")
GROUP BY sup.Country
HAVING COUNT(*)>2;


/*27. Crear una consulta que muestre el nombre de empleado y el número de empleados que cada uno de los empleados tiene a su cargo*/

SELECT empAux.EmployeeID,concat_ws(' ', empAux.FirstName, empAux.LastName) "Empleado", COUNT(*)
FROM employees AS empAux
JOIN employees AS emp
ON (emp.ReportsTo=empAux.EmployeeID)
GROUP BY empaux.EmployeeID;

/*28.Crear una consulta que muestre el nombre de empleado, el número de pedidos tramitado por cada empleado, 
de aquellos empleados que han tramitado mas de 15 pedidos*/

SELECT concat_ws(' ', emp.FirstName, emp.LastName) "Empleado", COUNT(*) "Pedidos"
FROM employees AS emp
JOIN orders AS ord
ON (emp.EmployeeID=ord.EmployeeID)
GROUP BY emp.EmployeeID 
HAVING COUNT(*)>15;

/*29.Crear una consulta que muestre el nombre del cliente, el número de pedidos que nos ha realizado el cliente,
el dinero que nos ha dejado en la empresa, de todos los clientes que sean de USA y que nos han realizado mas de 5 pedidos*/

SELECT cust.ContactName, COUNT(*), SUM(orddet.UnitPrice*orddet.Quantity)
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
WHERE cust.Country="USA"
GROUP BY ord.CustomerID
HAVING COUNT(*)>5;

/*30.Crear una consulta que muestre el nombre del jefe y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo*/

SELECT concat_ws(' ', emp.FirstName, emp.LastName) "Jefe", COUNT(*) "A cargo"
FROM employees AS emp
GROUP BY emp.ReportsTo 
HAVING emp.ReportsTo IS NOT NULL
ORDER BY COUNT(*) DESC LIMIT 1;

/*31.Obtener el nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa*/

SELECT cust.ContactName "Cliente", COUNT(*) "Total pedidos"
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
GROUP BY cust.CustomerID
ORDER BY COUNT(*) DESC LIMIT 1;

/*32.Obtener el nombre del cliente y el volumen de negocio del cliente 
que mas volumen de negocio nos ha dejado en la empresa.*/

SELECT cust.ContactName "Cliente", SUM(orddet.UnitPrice*orddet.Quantity) AS VolumenNegocio
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
GROUP BY cust.CustomerID
ORDER BY VolumenNegocio DESC LIMIT 1;

/*33.Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden decompra, el código del producto, cantidad pedida del producto, 
nombredel producto y el nombre de la compañía proveedora,usar JOIN. Solamente las compañías proveedoras que comienzan 
con laletra de la A hasta la letra G,además la cantidad pedida del productodebe estar entre 23 y 187*/

SELECT cust.CompanyName "Comp. cliente", cust.ContactName "Contacto cliente", orddet.OrderID, ord.OrderDate, orddet.ProductID, orddet.Quantity, prod.ProductName, sup.CompanyName "Proveedor"
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID)
WHERE (orddet.Quantity>=22 AND orddet.Quantity<=187)
AND (sup.CompanyName LIKE ("A%") OR
sup.CompanyName LIKE ("B%") OR
sup.CompanyName LIKE ("C%") OR
sup.CompanyName LIKE ("D%") OR
sup.CompanyName LIKE ("E%") OR
sup.CompanyName LIKE ("F%") OR
sup.CompanyName LIKE ("G%"));

/*34.Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, 
código del producto, cantidad pedida del producto, nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor*/

SELECT cust.CompanyName "Comp. cliente", ord.OrderID, ord.OrderDate, orddet.ProductID, orddet.Quantity, prod.ProductName, sup.CompanyName "Proveedor", sup.City "Ciudad proveed."
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID);

/*35.Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden de compra, código del producto, 
cantidad pedida del producto, nombre del producto y el nombre de la compañía proveedora, usar Join. 
Solamente las compañías proveedoras que comienzan con la letra de la A hasta la letra G, además la cantidad pedida del producto debe estar entre 18 y 190*/

SELECT cust.CompanyName "Comp. cliente", ord.OrderID, ord.OrderDate, orddet.ProductID,
 orddet.Quantity, prod.ProductName, sup.CompanyName "Proveedor", sup.City "Ciudad proveed."
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID)
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN products AS prod
ON (orddet.ProductID=prod.ProductID)
JOIN suppliers AS sup
ON (prod.SupplierID=sup.SupplierID)
WHERE (orddet.Quantity>=18 AND orddet.Quantity<=190)
AND (sup.CompanyName LIKE ("A%") OR
sup.CompanyName LIKE ("B%") OR
sup.CompanyName LIKE ("C%") OR
sup.CompanyName LIKE ("D%") OR
sup.CompanyName LIKE ("E%") OR
sup.CompanyName LIKE ("F%") OR
sup.CompanyName LIKE ("G%"));