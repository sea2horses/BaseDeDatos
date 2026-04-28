
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


-- Documentación
-- Procedimiento del sistema
USE Farmacia;
GO

EXEC sp_help Productos;
GO

-- Consulta de los datos de la tabla
SELECT *
FROM Productos;
GO

-- Llave primaria
SELECT 
    KU.TABLE_NAME AS NombreTabla,
    KU.COLUMN_NAME AS CampoClavePrimaria,
    TC.CONSTRAINT_NAME AS NombreRestriccion
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU
    ON TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
WHERE TC.CONSTRAINT_TYPE = 'PRIMARY KEY'
  AND KU.TABLE_NAME = 'Productos';
GO

-- Restricciones de la tabla
SELECT 
    tc.TABLE_NAME AS NombreTabla,
    tc.CONSTRAINT_NAME AS NombreRestriccion,
    tc.CONSTRAINT_TYPE AS TipoRestriccion
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
WHERE tc.TABLE_NAME = 'Productos';
GO