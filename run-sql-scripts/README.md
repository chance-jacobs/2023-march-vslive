# Demo for restoring with sql scripts

Steps to show a demonstrations of the fundamentals of using SQL Server Containers

## Setup

- Internet connection
- Install Docker for Desktop on Mac, Linux, or Windows

## Commands to create the sql container and database

Open powershell

Build the docker image

```
docker build -t hdot_image_1 .
```
Run the container

```
docker run -p 1402:1433 --name hdot1 -d hdot_image_1 -v sql2022volume:/var/opt/mssql
```

Remove container and image to strat from scratch

```
./cleanup.ps1 hdot1 hdot_image_1
```

Connect with Sql Management Studio to 127.0.0.1,1402
