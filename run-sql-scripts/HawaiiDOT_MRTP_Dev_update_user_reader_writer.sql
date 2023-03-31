USE [HawaiiDOT_MRTP_Dev]
GO

DECLARE @user sysname = 'hdotappuser';
DECLARE @login sysname = 'hdotappuser';
DECLARE @SQL nvarchar(max) = '';

SELECT @SQL = @SQL + '
    USE [HawaiiDOT_MRTP_Dev];

    IF NOT EXISTS(SELECT 1 FROM sys.database_principals WHERE name = ''' + @user + ''')
    BEGIN
        CREATE USER ' + QUOTENAME(@user)
           + ' FOR LOGIN ' + QUOTENAME(@login)
           + ' WITH DEFAULT_SCHEMA=[dbo];
    END
    ELSE
    BEGIN
        EXEC sp_change_users_login ''Update_One'', ''' + @user + ''', ''' + @login + ''';
    END

    EXEC sys.sp_addrolemember ''db_datareader'', ''' + @user + ''';

    EXEC sys.sp_addrolemember ''db_datawriter'', '''+ @user + '''; 
';

EXEC sp_executesql @sql;
--print @sql


