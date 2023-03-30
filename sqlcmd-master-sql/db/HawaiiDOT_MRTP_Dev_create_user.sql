DECLARE @char CHAR = '';
DECLARE @charI INT = 0;
DECLARE @password VARCHAR(100) = '';
DECLARE @len INT = 12; -- Length of Password
WHILE @len > 0
BEGIN
    SET @charI = ROUND(RAND() * 100, 0);
    SET @char = CHAR(@charI);
    IF @charI > 48
       AND @charI < 122
    BEGIN
        SET @password += @char;
        SET @len = @len - 1;
    END;
END;
--SELECT @password, '''' + 'hello' [Password];


DECLARE @SQL VARCHAR(MAX)=''

SELECT @SQL = 'CREATE LOGIN [hdotappuser] WITH PASSWORD = ''' + @password + ''' , DEFAULT_DATABASE = HawaiiDOT_MRTP_Dev, CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;'

EXEC (@SQL)

CREATE USER [hdotappuser] FOR LOGIN [hdotappuser];
GO


