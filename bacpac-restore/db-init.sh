#wait for the SQL Server to come up
echo "Wait for SQL Server to start..."
sleep 10s

echo "Install dotnet"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

echo "Install dotnet runtime 6.0.0"
./dotnet-install.sh --architecture x64 --install-dir /usr/share/dotnet/ --runtime dotnet --version 6.0.0

echo "Install sqlpackage"
dotnet tool install -g microsoft.sqlpackage
chmod +x /opt/sqlpackage/sqlpackage


# Launch SQL Server, confirm startup is complete, deploy the DACPAC, then terminate SQL Server.
# See https://stackoverflow.com/a/51589787/488695
echo "Resore bacpac"
( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" 
sqlpackage /a:Import /tcs:"Server=localhost;Database=sfwmdc43;User Id=sa;Password=Chance#Demo;TrustServerCertificate=True;" /sf:/tmp/sfwmdc43dbdev-2023-3-29-9-28.bacpac
