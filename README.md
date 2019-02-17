## Service utils

This is docker, docker-compose configs with utils containers for developing

easy up and stop

- postgres
    - save all data in ./postgres-data
    - user = postgres
    - password: mysecretpassword
    - port: 5432
- mysql
    - save all data in ./mysql-data
    - user root
    - password: mysecretpassword
    - port: 3306
- redis
    - port: 6379
- rabbitmq
    - ports: 5672, 15672
 
 ***
 To start service make
 
 > docker-compose up -d <app_name>
 
 To stop make
 
 > docker-compose stop <app_name>
