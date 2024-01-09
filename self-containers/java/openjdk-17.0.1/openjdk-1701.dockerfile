FROM openjdk:17.0.1

WORKDIR /home/openjdk1701

RUN mkdir -p /home/openjdk1701/microservices/users/
RUN mkdir -p /home/openjdk1701/microservices/sales/
RUN mkdir -p /home/openjdk1701/microservices/supplies/

COPY ./microservices/users/* /home/openjdk1701/microservices/users/
COPY ./microservices/sales/* /home/openjdk1701/microservices/sales/
COPY ./microservices/supplies/* /home/openjdk1701/microservices/supplies/

RUN ls /home/openjdk1701/microservices/users
RUN ls /home/openjdk1701/microservices/sales
RUN ls /home/openjdk1701/microservices/supplies

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk1701/microservices-start.sh

EXPOSE 38801
EXPOSE 38802
EXPOSE 38803
