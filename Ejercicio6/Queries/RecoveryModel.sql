USE master;
GO

SELECT 
    name AS BaseDeDatos,
    recovery_model_desc AS ModeloRecuperacion
FROM sys.databases
WHERE name = 'Farmacia';
GO