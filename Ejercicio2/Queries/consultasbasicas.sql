/* ==================================
            CONSULTAS BÁSICAS
   ================================== */

-- 1. Consulta básica: mostrar todos los productos
SELECT *
FROM Productos;
GO

-- 2. Consulta básica: mostrar productos con precio mayor a 100
SELECT IdProducto, NombreProducto, Precio
FROM Productos
WHERE Precio > 50;
GO

-- 3. Consulta básica: ordenar productos por precio de menor a mayor
SELECT IdProducto, NombreProducto, Precio
FROM Productos
ORDER BY Precio ASC;
GO