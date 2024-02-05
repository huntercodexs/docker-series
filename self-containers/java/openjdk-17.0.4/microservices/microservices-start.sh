#!/bin/bash

cd /home/openjdk-17.0.4/microservices/users/
java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar --spring.config.location=/home/openjdk-17.0.4/microservices/users/application.properties &

