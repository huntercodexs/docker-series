#!/bin/bash

cd /home/openjdk-21.0.2/microservices/users/
java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar --spring.config.location=/home/openjdk-21.0.2/microservices/users/application.properties &

