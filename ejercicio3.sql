-- Crear tabla de productos
CREATE TABLE Productos (
    IDProducto SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Precio NUMERIC(10, 2) NOT NULL
);

-- Crear tabla de vendedores
CREATE TABLE Vendedores (
    IDVendedor SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL
);

-- Crear tabla de ventas
CREATE TABLE Ventas (
    IDVenta SERIAL PRIMARY KEY,
    IDProducto INT NOT NULL,
    IDVendedor INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Fecha DATE NOT NULL,
    FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto) ON DELETE CASCADE,
    FOREIGN KEY (IDVendedor) REFERENCES Vendedores(IDVendedor) ON DELETE CASCADE
);

-- Agregando datos a las tablas para poder hacer las consultas

-- Datos Productos
INSERT INTO Productos (IDProducto, Nombre, Precio) VALUES
(1, 'Laptop', 1200.50),
(2, 'Smartphone', 850.00),
(3, 'Tablet', 600.25),
(4, 'Auriculares', 150.75),
(5, 'Monitor', 300.99);

SELECT * FROM
	Productos;

-- Datos Vendedores
INSERT INTO Vendedores (IDVendedor, Nombre, Region) VALUES
(1, 'Juan Pérez', 'Norte'),
(2, 'María López', 'Sur'),
(3, 'Carlos Gómez', 'Este'),
(4, 'Ana Ramírez', 'Oeste'),
(5, 'Luis Torres', 'Centro');
SELECT * FROM
	Vendedores;

-- Datos Ventas
INSERT INTO Ventas (IDProducto, IDVendedor, Cantidad, Fecha) VALUES
(1, 1, 3, '2024-12-01'),
(2, 2, 5, '2024-12-02'),
(3, 3, 2, '2024-12-03'),
(4, 4, 10, '2024-12-04'),
(5, 5, 1, '2024-12-05'),
(1, 2, 2, '2024-12-06'),
(3, 1, 4, '2024-12-07'),
(2, 4, 3, '2024-12-08'),
(5, 3, 6, '2024-12-09'),
(4, 5, 7, '2024-12-10');

SELECT * FROM
	Ventas;

TRUNCATE TABLE Ventas;

-- 1.- Ingresos totales generados por cada producto
SELECT p.Nombre, SUM(v.Cantidad * p.Precio) AS IngresosTotales
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
GROUP BY p.Nombre;

-- 2.- Cinco fechas con mayor cantidad de ventas
SELECT Fecha, SUM(Cantidad) AS TotalVentas
FROM Ventas
GROUP BY Fecha
ORDER BY TotalVentas DESC
LIMIT 5;

-- 3.- Lista de productos vendidos por X vendedor
SELECT p.Nombre, v.Cantidad
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
WHERE v.IDVendedor = 1;

-- 4.- Vendedores con cero ventas
SELECT *
FROM Vendedores
WHERE IDVendedor NOT IN (SELECT DISTINCT IDVendedor FROM Ventas);

-- 5.- Región con mayor ingresos
SELECT ven.Region, SUM(v.Cantidad * p.Precio) AS IngresosTotales
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
JOIN Vendedores ven ON v.IDVendedor = ven.IDVendedor
GROUP BY ven.Region
ORDER BY IngresosTotales DESC
LIMIT 1;

-- 6.- Vendedores con más de X ventas totales
SELECT ven.Nombre, SUM(v.Cantidad) AS TotalVendidos
FROM Ventas v
JOIN Vendedores ven ON v.IDVendedor = ven.IDVendedor
GROUP BY ven.Nombre
HAVING SUM(v.Cantidad) > 5;

-- 7.- Cantidad de ventas de productos por región
SELECT p.Nombre AS Producto, ven.Region, SUM(v.Cantidad) AS CantidadTotal
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
JOIN Vendedores ven ON v.IDVendedor = ven.IDVendedor
GROUP BY p.Nombre, ven.Region;

-- 8.- Las regiones donde se vendió X producto
SELECT DISTINCT p.IDProducto, ven.region
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
JOIN Vendedores ven ON v.IDVendedor = ven.IDVendedor
WHERE v.IDProducto = 2;

-- 9.- Vendedores que solo han hecho ventas en X región
SELECT ven.Nombre
FROM Vendedores ven
JOIN Ventas v ON ven.IDVendedor = v.IDVendedor
WHERE ven.Region = 'Sur'
GROUP BY ven.Nombre
HAVING COUNT(DISTINCT ven.Region) = 1;

-- 10.- Ventas donde se superaron ingresos de 2,000 por producto vendido
SELECT v.IDVenta, p.Nombre AS Producto, ven.Nombre AS Vendedor, (v.Cantidad * p.Precio) AS Ingresos
FROM Ventas v
JOIN Productos p ON v.IDProducto = p.IDProducto
JOIN Vendedores ven ON v.IDVendedor = ven.IDVendedor
WHERE (v.Cantidad * p.Precio) > 2000;
