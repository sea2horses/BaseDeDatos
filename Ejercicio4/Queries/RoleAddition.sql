USE Farmacia;

-- Verificar que el usuario existe

SELECT name, type_desc
FROM sys.database_principals
WHERE name = 'usuario_farmacia';
GO

-- Removemos los permisos de usuario_farmacia

ALTER ROLE db_datareader
ADD MEMBER usuario_farmacia;

ALTER ROLE db_datawriter
ADD MEMBER usuario_farmacia;