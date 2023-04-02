# Demo for restoring with master sql

Steps to show a demonstrations of the fundamentals of using SQL Server Containers

## Setup

- Internet connection
- Install Docker for Desktop on Mac, Linux, or Windows

## Commands to create the sql container and database

Open powershell as administrator

Create the volume

```
docker volume create hdotvol2
```

Build the docker image

```
docker build -t hdot_image_2 .
```
Run the container

```
docker run --mount source=hdotvol2,destination=/var/opt/mssql  -p 1403:1433 --name hdot2 -d hdot_image_2
```

Run this in powershell before cleanup if you get a not digitally signed error

```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

Remove container and image to strat from scratch

```
./cleanup.ps1 hdot2 hdot_image_2 hdotvol2
```

Connect with Sql Management Studio to 127.0.0.1,1403
