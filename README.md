# BookingDB

This is for building the docker image with the required DB/Table/Records for Booking Assignment.

[Link to Docker Image](https://hub.docker.com/repository/docker/qingzz/bookingdb)

Example 


```sh
sudo docker pull qingzz/bookingdb:latest
sudo docker run --name facilityBookingDB -e POSTGRES_PASSWORD=<PostgreSQL_PASSWORD> -p 5432:5432 -d qingzz/bookingdb:latest
```

Default value for environment variables
PostgreSQL_PASSWORD = F@ci1ityB00king

This docker image will run the sql script in sql/init.sql to create Database, Database User, Tables, Table records required for Booking Assignment.