FROM openjdk:17.0.1

WORKDIR /home/openjdk-17.0.1

RUN mkdir -p /home/openjdk-17.0.1/microservices/users/

COPY ./microservices/users/* /home/openjdk-17.0.1/microservices/users/

RUN ls /home/openjdk-17.0.1/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk-17.0.1/microservices-start.sh

EXPOSE 38801
