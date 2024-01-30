FROM amazonlinux:2

# SHOW EXTRAS PACKAGES FROM AMAZON LIST
RUN amazon-linux-extras

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
COPY ec2/jre/jre-8u212-linux-x64.rpm .
RUN rpm -ivh jre-8u212-linux-x64.rpm

EXPOSE 8080
EXPOSE 31303

