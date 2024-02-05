FROM openjdk:21

WORKDIR /home/openjdk21

RUN mkdir -p /home/openjdk21/microservices/users/

COPY ./microservices/users/* /home/openjdk21/microservices/users/

RUN ls /home/openjdk21/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk21/microservices-start.sh

EXPOSE 38801

