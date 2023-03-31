# Demo for restoring bacpac

Steps to show a demonstrations of the fundamentals of using SQL Server Containers

## Setup

- Internet connection
- Install Docker for Desktop on Mac, Linux, or Windows

## Commands to create the sql container and database

Open powershell

Build the docker image

```
docker build --build-arg PASSWORD=YourS3cureP@ass -t c43db .
```
Run the container

```
docker run -p 1420:1433 --name c43 -d c43db
```

Remove container and image to strat from scratch

```
./cleanup.ps1 c43 c43db
```

Connect with Sql Management Studio to 127.0.0.1,1420
