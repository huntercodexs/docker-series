FROM amazonlinux:2

# SHOW EXTRAS PACKAGES FROM AMAZON LIST
RUN amazon-linux-extras

WORKDIR /home/openjdk-11.0.21

# UPDATE
RUN yum update -y
RUN yum install -y initscripts

# LIBS

# ESSENTIALS
RUN yum install -y wget

# OTHERS

# MYSQL CONNECTION
RUN yum install -y mysql

# JRE JAVA
# see https://www.oracle.com/sa/java/technologies/javase/javase8u211-later-archive-downloads.html
COPY jre/jdk-11.0.21_linux-x64_bin.rpm .
RUN rpm -ivh jdk-11.0.21_linux-x64_bin.rpm

RUN mkdir -p /home/openjdk-11.0.21/microservices/users/

COPY ./microservices/users/* /home/openjdk-11.0.21/microservices/users/

RUN ls /home/openjdk-11.0.21/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk-11.0.21/microservices-start.sh

EXPOSE 38801
