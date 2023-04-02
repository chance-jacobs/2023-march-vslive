# Demo for restoring bacpac

Steps to show a demonstrations of the fundamentals of using SQL Server Containers

## Setup

- Internet connection
- Install Docker for Desktop on Mac, Linux, or Windows

## Commands to create the sql container and database

Open powershell as administrator

Create the volume

```
docker volume create c43vol
```

Build the docker image

```
docker build -t c43db .
```
Run the container

```
docker run --mount source=c43vol,destination=/var/opt/mssql -p 1420:1433 --name c43 -d c43db
```

Run this in powershell before cleanup if you get a not digitally signed error

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

Remove container and image to start from scratch

```
./cleanup.ps1 c43 c43db c43vol
```

Connect with Sql Management Studio to 127.0.0.1,1420
