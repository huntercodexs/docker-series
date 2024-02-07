FROM amazonlinux:2

# SHOW EXTRAS PACKAGES FROM AMAZON LIST
RUN amazon-linux-extras

WORKDIR /home/artifactory

# UPDATE
RUN yum update -y
RUN yum install -y initscripts

# TOOLS
RUN yum install -y nano
RUN yum install -y tar
RUN yum install -y zip
RUN yum install -y unzip
RUN yum install -y wget
RUN yum install -y vim
RUN yum install -y curl

# JRE JAVA
# see https://www.oracle.com/sa/java/technologies/javase/javase8u211-later-archive-downloads.html
COPY jre/jre-8u221-linux-x64.rpm .
RUN rpm -ivh jre-8u221-linux-x64.rpm

# JFROG - ARTIFACTORY 7.77.3
RUN wget https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/7.77.3/jfrog-artifactory-oss-7.77.3-linux.tar.gz
RUN tar -xvf jfrog-artifactory-oss-7.77.3-linux.tar.gz

EXPOSE 80
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
EXPOSE 8181
