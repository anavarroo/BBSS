-- 1. Contar la cantidad de pedidos que han sido realizados por un cliente
-- de Mexico.

SELECT COUNT(*)
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
WHERE cust.Country="Mexico";

-- 2. Por cada pedido adjuntar, además de su información, el nombre de la 
-- compañía que lo ha enviado (ShipVia).

SELECT ord.*, ship.CompanyName
FROM orders AS ord
JOIN shippers AS ship
ON (ord.ShipVia=ship.ShipperID);

-- 3. Imprimir toda la información de los clientes, con los nombres de las columnas
-- traducidos al castellano y separando con espacios aquellos nombres
-- compuestos de varias palabras.

SELECT CustomerID, CompanyName "Nombre de compañia", ContactName "Nombre de contacto", 
ContactTitle "Titulo", Address "Dirección", City "Ciudad", Region, PostalCode "Codigo postal",
Country "País", Phone "Teléfono", Fax
FROM customers;

-- 4. Por cada producto, mostrar su nombre y la descripción de la categoría
-- a la que pertenece.

SELECT prod.ProductName, cat.Description
FROM products AS prod
JOIN categories AS cat
ON (prod.CategoryID=cat.CategoryID);

-- 5. Mostrar los paises y cantidad de empleados que tiene cada país.

SELECT emp.Country, COUNT(*)
FROM employees AS emp
GROUP BY emp.Country;

-- 6. Contar los pedidos que han sido realizados por clientes de España.

SELECT COUNT(*)
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
WHERE cust.Country="Spain";

-- 7. Mostrar los pedidos realizados por clientes de Suecia y Argentina.

SELECT *
FROM orders AS ord
JOIN customers AS cust
ON (ord.CustomerID=cust.CustomerID)
WHERE cust.Country IN ("Sweden","Argentina");

-- 8. Por cada pedido, mostrar el descuento medio.

SELECT orddet.OrderID, AVG(orddet.Discount)
FROM orderdetails AS orddet
GROUP BY orddet.OrderID;

-- 9. Por cada pedido, contar los productos que incluye, solo para aquellos 
-- pedidos que cuentan con más de tres productos y han sido atendidos por
-- un empleado estadounidense.

SELECT orddet.OrderID, COUNT(*)
FROM orderdetails AS orddet
JOIN orders AS ord
ON (orddet.OrderID=ord.OrderID)
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID)
WHERE emp.Country="USA"
GROUP BY orddet.OrderID HAVING COUNT(*)>3;

-- 10. Mostrar los nombres y apellidos de todos los empleados utilizando
-- una única columna, ordenándolos por edad, de mayor a menor.

SELECT concat_ws(' ', emp.FirstName, emp.LastName), year(curdate())-year(emp.BirthDate) AS Edad
FROM employees AS emp
ORDER BY Edad DESC;
