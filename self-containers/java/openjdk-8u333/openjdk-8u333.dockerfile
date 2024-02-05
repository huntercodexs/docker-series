FROM amazonlinux:2

# SHOW EXTRAS PACKAGES FROM AMAZON LIST
RUN amazon-linux-extras

WORKDIR /home/openjdk8u333

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
COPY jre/jre-8u333-linux-x64.rpm .
RUN rpm -ivh jre-8u333-linux-x64.rpm

RUN mkdir -p /home/openjdk8u333/microservices/users/

COPY ./microservices/users/* /home/openjdk8u333/microservices/users/

RUN ls /home/openjdk8u333/microservices/users

RUN java -version

COPY ./microservices/microservices-start.sh /home/openjdk8u333/microservices-start.sh

EXPOSE 38801
