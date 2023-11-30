FROM ubuntu:20.04

WORKDIR "/opt/jenkins"

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# INSTALL TOOLS
RUN apt-get install -y curl
RUN apt-get install -y vim

# SETUP JENKINS REPOSITORIES
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key |  \
    tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ |  \
    tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# INSTALL JENKINS
RUN apt-get update -y
RUN apt-get install -y fontconfig
RUN apt-get install -y openjdk-11-jre
RUN apt-get install -y jenkins

EXPOSE 8080
EXPOSE 50000

CMD ["jenkins"]
