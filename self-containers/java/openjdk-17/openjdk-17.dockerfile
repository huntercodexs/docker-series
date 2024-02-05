FROM openjdk:17

WORKDIR /home/openjdk17

RUN mkdir -p /home/openjdk17/microservices/users/

COPY ./microservices/users/* /home/openjdk17/microservices/users/

RUN ls /home/openjdk17/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk17/microservices-start.sh

EXPOSE 38801

