#!/bin/bash

cd /home/openjdk-11.0.6/microservices/users/
java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar --spring.config.location=/home/openjdk-11.0.6/microservices/users/application.properties &
