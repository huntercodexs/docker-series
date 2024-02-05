FROM openjdk:8u212

WORKDIR /home/openjdk8u212

RUN mkdir -p /home/openjdk8u212/microservices/users/

COPY ./microservices/users/* /home/openjdk8u212/microservices/users/

RUN ls /home/openjdk8u212/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk8u212/microservices-start.sh

EXPOSE 38801
EXPOSE 38802
EXPOSE 38803

