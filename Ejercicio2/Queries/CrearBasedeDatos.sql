/* =============================================
        CONSTRUCCIÓN DE LA BASE DE DATOS
   ============================================= */

-- 1. Crear la base de datos si no existe
IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = 'Farmacia'
)
BEGIN
    CREATE DATABASE Farmacia;
END;
GO

-- 2. Usar la base de datos
USE Farmacia;
GO

-- 3. Crear la tabla Productos si no existe
IF NOT EXISTS (
    SELECT *
    FROM sys.tables
    WHERE name = 'Productos'
)
BEGIN
    CREATE TABLE Productos (
        IdProducto INT IDENTITY(1,1) PRIMARY KEY,
        NombreProducto VARCHAR(100) NOT NULL,
        Precio DECIMAL(10,2) NOT NULL
    );
END;
GO

-- 4. Insertar 3 registros 
INSERT INTO Productos (NombreProducto, Precio)
VALUES
('Paracetamol 500mg', 35.50),
('Ibuprofeno 400mg', 78.75),
('Amoxicilina 500mg', 120.00);
GO
