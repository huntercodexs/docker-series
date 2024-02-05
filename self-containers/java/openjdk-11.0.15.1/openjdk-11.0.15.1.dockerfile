FROM openjdk:11.0.15

WORKDIR /home/openjdk-11.0.15.1

RUN mkdir -p /home/openjdk-11.0.15.1/microservices/users/

COPY ./microservices/users/* /home/openjdk-11.0.15.1/microservices/users/

RUN ls /home/openjdk-11.0.15.1/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk-11.0.15.1/microservices-start.sh

EXPOSE 38801

