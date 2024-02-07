FROM ubuntu:22.04

WORKDIR /home/artifactory

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# TOOLS
RUN apt install -y nano
RUN apt install -y tar
RUN apt install -y zip
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y vim
RUN apt install -y curl
RUN apt install -y gpg

# JFROG - ARTIFACTORY LATEST
#RUN echo "deb https://releases.jfrog.io/artifactory/artifactory-debs xenial main" | tee -a /etc/apt/sources.list.d/artifactory.list
#RUN curl -fsSL  https://releases.jfrog.io/artifactory/api/gpg/key/public | gpg --dearmor -o /etc/apt/trusted.gpg.d/artifactory.gpg
#RUN apt update
#RUN apt install jfrog-artifactory-oss -y

# JFROG - ARTIFACTORY 7.77.3
RUN wget https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/7.77.3/jfrog-artifactory-oss-7.77.3-linux.tar.gz
RUN tar -xvf jfrog-artifactory-oss-7.77.3-linux.tar.gz

EXPOSE 80
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
EXPOSE 8181
