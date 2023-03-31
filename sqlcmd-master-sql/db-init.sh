#wait for the SQL Server to come up
echo "Wait for SQL Server to start..."
sleep 30s

echo "Creating database...."
#run the setup script to create the DB, table, index, sproc, and populate data
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 6I9G2B]LG3H2 -i /src/HawaiiDOT_MRTP_Dev_create_database.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 6I9G2B]LG3H2 -d HawaiiDOT_MRTP_Dev -i /src/Master.sql