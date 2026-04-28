BACKUP DATABASE Farmacia
TO DISK = 'C:\DATABASES\BACKUPS\Farmacia.bak'
WITH 
    FORMAT,
    INIT,
    NAME = 'Backup Completo Farmacia';
GO