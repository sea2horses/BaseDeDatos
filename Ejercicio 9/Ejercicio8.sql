-- v1_creacion_base_tabla.sql

IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = 'Farmacia'
)
BEGIN
    CREATE DATABASE Farmacia;
END;
GO

USE Farmacia;
GO

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

-- v2_datos_consultas.sql

USE Farmacia;
GO

INSERT INTO Productos (NombreProducto, Precio)
VALUES
('Paracetamol 500mg', 35.50),
('Ibuprofeno 400mg', 78.75),
('Amoxicilina 500mg', 120.00);
GO

SELECT *
FROM Productos;
GO

SELECT IdProducto, NombreProducto, Precio
FROM Productos
WHERE Precio > 50;
GO

SELECT IdProducto, NombreProducto, Precio
FROM Productos
ORDER BY Precio ASC;
GO

-- v3_seguridad_permisos.sql

USE master;
GO

CREATE LOGIN usuario_lab
WITH PASSWORD = 'lab12345*';
GO

USE Farmacia;
GO

CREATE USER usuario_farmacia
FOR LOGIN usuario_lab;
GO

ALTER ROLE db_datareader ADD MEMBER usuario_farmacia;
ALTER ROLE db_datawriter ADD MEMBER usuario_farmacia;
GO

SELECT name, type_desc
FROM sys.database_principals
WHERE name = 'usuario_farmacia';
GO

-- v4_prueba_y_retiro_permisos.sql

USE Farmacia;
GO

INSERT INTO Productos (NombreProducto, Precio)
VALUES ('Metamusil 400mg', 82.25);
GO

SELECT *
FROM Productos;
GO

ALTER ROLE db_datareader DROP MEMBER usuario_farmacia;
ALTER ROLE db_datawriter DROP MEMBER usuario_farmacia;
GO