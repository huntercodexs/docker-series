FROM openjdk:8u212

WORKDIR /home/openjdk8u212

RUN mkdir -p /home/openjdk8u212/microservices/users/
RUN mkdir -p /home/openjdk8u212/microservices/sales/
RUN mkdir -p /home/openjdk8u212/microservices/supplies/

COPY ./microservices/users/* /home/openjdk8u212/microservices/users/
COPY ./microservices/sales/* /home/openjdk8u212/microservices/sales/
COPY ./microservices/supplies/* /home/openjdk8u212/microservices/supplies/

RUN ls /home/openjdk8u212/microservices/users
RUN ls /home/openjdk8u212/microservices/sales
RUN ls /home/openjdk8u212/microservices/supplies

RUN java -version

COPY ./microservices/microservices-start.sh /usr/bin/microservices-start
