FROM openjdk:8u232

WORKDIR /home/openjdk8u232

RUN mkdir -p /home/openjdk8u232/microservices/users/

COPY ./microservices/users/* /home/openjdk8u232/microservices/users/

RUN ls /home/openjdk8u232/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk8u232/microservices-start.sh

EXPOSE 38801

