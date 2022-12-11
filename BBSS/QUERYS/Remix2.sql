-- 1. Por cada compañía de envíos, mostrar su nombre y contar el número de pedidos
-- que ha enviado.

SELECT ship.CompanyName, COUNT(*)
FROM shippers AS ship
JOIN orders AS ord
ON (ship.ShipperID=ord.ShipVia)
GROUP BY ord.ShipVia;

-- 2. Mostrar el nombre de los países a los que pertenecen los distintos clientes y empleados,
-- de forma que no se repitan.

SELECT DISTINCT cust.Country, emp.Country
FROM customers AS cust
JOIN orders AS ord
ON (cust.CustomerID=ord.CustomerID)
JOIN employees AS emp
ON (ord.EmployeeID=emp.EmployeeID);

-- 3. Contar los distintos ID de territorios.

SELECT COUNT(DISTINCT terr.TerritoryID) "Nº territorios"
FROM territories AS terr;

-- 4. Contar el número de categorías cuyo nombre empieza por C y termina por S,
-- dando un alias a la columna.

SELECT COUNT(*) "Categorias empiezan por C y acaban en S"
FROM categories AS cat
WHERE cat.CategoryName LIKE ("C%S");

-- 5. Mostrar los distintos territorios, adjuntando también la descripción de región (RegionDescription).

SELECT terr.*, reg.RegionDescription
FROM territories AS terr
JOIN region AS reg
ON (terr.RegionID=reg.RegionID);

-- 6. Contar el número de filas de la tabla customerdemographics.

SELECT COUNT(*)
FROM customerdemographics;

-- 7. Mostrar los nombres de ciudades de los proveedores en orden alfabetico inverso, pero solo
-- para aquellas cuyo nombre de ciudad comienza de la A a la C incluidas ambas letras.

SELECT sup.City
FROM suppliers AS sup
WHERE sup.City LIKE ("A%")
OR sup.City LIKE ("B%")
OR sup.City LIKE ("C%")
ORDER BY sup.City DESC;

-- 8. Por cada nombre de compañía de envíos contar el número de distintos productos 
-- enviados.
-- Es decir, que si una compañía de envíos envía una bata, tres bicis y siete jerseys de cuello
-- de pico estampados a un cliente zamorano y luego la misma compañía de envíos envía
-- una bata a un cliente jienense, esa 
-- compañía de envíos (que Dios la guarde en su alma) habría enviado tres productos distintos.

SELECT ship.CompanyName, COUNT(DISTINCT orddet.ProductID) "Nº distintos productos"
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
JOIN shippers AS ship
ON (ord.ShipVia=ship.ShipperID)
GROUP BY ord.ShipVia;

/*SELECT DISTINCT ProductID
FROM orders AS ord
JOIN orderdetails AS orddet
ON (ord.OrderID=orddet.OrderID)
WHERE ShipVia=1;*/ /*Probar con 1,2,3*/