#!/bin/bash

cd /home/openjdk21/microservices/users/
java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar --spring.config.location=/home/openjdk21/microservices/users/application.properties &
