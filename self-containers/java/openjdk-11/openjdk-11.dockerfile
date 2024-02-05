FROM openjdk:11

WORKDIR /home/openjdk11

RUN mkdir -p /home/openjdk11/microservices/users/

COPY ./microservices/users/* /home/openjdk11/microservices/users/

RUN ls /home/openjdk11/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk11/microservices-start.sh

EXPOSE 38801

