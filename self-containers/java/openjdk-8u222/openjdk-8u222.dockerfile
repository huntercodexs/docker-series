FROM openjdk:8u222

WORKDIR /home/openjdk8u222

RUN mkdir -p /home/openjdk8u222/microservices/users/

COPY ./microservices/users/* /home/openjdk8u222/microservices/users/

RUN ls /home/openjdk8u222/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk8u222/microservices-start.sh

EXPOSE 38801

