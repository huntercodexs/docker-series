#!/bin/bash

cd /home/openjdk8u212/microservices/users/
java -jar SIMPLE-API-USERS-22.01.1-SNAPSHOT.jar &

cd /home/openjdk8u212/microservices/sales/
java -jar SIMPLE-API-SALES-22.01.1-SNAPSHOT.jar &

cd /home/openjdk8u212/microservices/supplies/
java -jar SIMPLE-API-SUPPLIES-22.01.1-SNAPSHOT.jar &

