-- 1. Crear login a nivel de servidor
CREATE LOGIN usuario_lab
WITH PASSWORD = 'Lab12345*';

-- 2. Usar la base de datos correspondiente
USE Farmacia;
GO

-- 3. Crear usuario dentro de la base de datos
CREATE USER usuario_farmacia
FOR LOGIN usuario_lab;
GO

-- 4. Asignar permisos básicos al usuario
ALTER ROLE db_datareader ADD MEMBER usuario_farmacia;
ALTER ROLE db_datawriter ADD MEMBER usuario_farmacia;
GO