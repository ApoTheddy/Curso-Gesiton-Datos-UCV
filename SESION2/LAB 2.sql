use northwind;
--1. MOSTRAR PRODUCTOS DONDE EL SEGUNDO CAR�CTER NO DEBE SER I
CREATE VIEW Productos_Sin_Segundo_Caracter_I AS
SELECT *
FROM Products
WHERE LOWER(SUBSTRING(ProductName, 2, 1)) <> 'i';

SELECT * FROM Productos_Sin_Segundo_Caracter_I

--3. EL NRO DE CLIENTES Q ES ATENDIDO POR C/ EMPLEADO
CREATE VIEW Nro_Clientes_Atendidos_x_Empleado AS
SELECT CustomerID,
    EmployeeID,
    COUNT(CustomerID) AS [Pedidos X Cliente]
FROM Orders
GROUP BY CustomerID,
    EmployeeID;

SELECT * FROM Nro_Clientes_Atendidos_x_Empleado

--4. MOSTRAR EL NUMERO DE PEDIDOS ATENDIDOS POR CADA EMPLEADO
CREATE VIEW Nro_Pedidos_Atendidos_x_Empleado AS
SELECT EmployeeID,
    COUNT(EmployeeID) AS [Pedidos Atendidos]
FROM Orders
GROUP BY EmployeeID;

SELECT * FROM Nro_Pedidos_Atendidos_x_Empleado


--5. MOSTRAR LA CATEGORIA, EL PROMEDIO DE PRECIOS Y NUMERO DE ARTICULOS POR CATEGORIA
CREATE VIEW Nro_Articulos_PrecioPromedio_x_Categoria AS
SELECT c.CategoryName,
    AVG(p.UnitPrice) AS [Promedio de Precios],
    COUNT(c.CategoryName) as [Articulos x Categoria]
FROM Products p
    INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY CategoryName;

SELECT * FROM Nro_Articulos_PrecioPromedio_x_Categoria

--6. MOSTRAR LAS FILAS DE LOS EMPLEADOS QUE TENGAN MAS DE 100 PEDIDOS ATENDIDOS
CREATE VIEW Pedidos_Atendidos_Mayores_a_100 AS
SELECT o.EmployeeID,
    Count(o.EmployeeID) as [Pedidos Atendidos]
FROM Orders o
    INNER JOIN Employees e ON e.EmployeeID = O.EmployeeID
GROUP BY o.EmployeeID
HAVING COUNT(o.EmployeeID) > 100;

SELECT * FROM Pedidos_Atendidos_Mayores_a_100


--7. MOSTRAR EL IDPEDIDO,EL NRO DE ARTICULO EN CADA PEDIDO Y EL MONTO DE CADA PEDIDO
CREATE VIEW Idpedido_NroArticulo_Monto_Pedido AS
SELECT od.OrderID,
    od.ProductID,
    SUM(od.UnitPrice) as [Monto Pedido]
FROM [Order Details] od
GROUP BY od.OrderID,
    od.ProductID;

SELECT * FROM Idpedido_NroArticulo_Monto_Pedido

--8. MOSTRAR EL NUMERO TOTAL DE ARTICULOS DE PEDIDOS Y ADEMAS EL MONTO TOTAL
CREATE VIEW Nro_Total_Articulos AS
SELECT COUNT(*) AS [Total Articulos],
    SUM(UnitPrice * Quantity) AS [Monto Total]
FROM [Order Details];

SELECT * FROM Nro_Total_Articulos
