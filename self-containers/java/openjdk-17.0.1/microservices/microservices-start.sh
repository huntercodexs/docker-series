#!/bin/bash

cd /home/openjdk1701/microservices/users/
java -jar SIMPLE-API-USERS-22.01.1-SNAPSHOT.jar --spring.config.location=/home/openjdk1701/microservices/users/application.properties &

cd /home/openjdk1701/microservices/sales/
java -jar SIMPLE-API-SALES-22.01.1-SNAPSHOT.jar --spring.config.location=/home/openjdk1701/microservices/sales/application.properties &

cd /home/openjdk1701/microservices/supplies/
java -jar SIMPLE-API-SUPPLIES-22.01.1-SNAPSHOT.jar --spring.config.location=/home/openjdk1701/microservices/supplies/application.properties &

