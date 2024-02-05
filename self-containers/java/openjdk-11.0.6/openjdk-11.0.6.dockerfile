FROM openjdk:11.0.6

WORKDIR /home/openjdk-11.0.6

RUN mkdir -p /home/openjdk-11.0.6/microservices/users/

COPY ./microservices/users/* /home/openjdk-11.0.6/microservices/users/

RUN ls /home/openjdk-11.0.6/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk-11.0.6/microservices-start.sh

EXPOSE 38801

