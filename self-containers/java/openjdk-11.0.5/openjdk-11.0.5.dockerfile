FROM openjdk:11.0.5

WORKDIR /home/openjdk-11.0.5

RUN mkdir -p /home/openjdk-11.0.5/microservices/users/

COPY ./microservices/users/* /home/openjdk-11.0.5/microservices/users/

RUN ls /home/openjdk-11.0.5/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk-11.0.5/microservices-start.sh

EXPOSE 38801

