FROM jenkins/jenkins:latest

#-----------------------------------------------------------------------------------------------------------
#SETTINGS
#-----------------------------------------------------------------------------------------------------------
ENV HTTP_PORT 8080
ENV HTTPS_PORT 8083
ENV AGENT_PORT 50000
ENV JENKINS_SLAVE_AGENT_PORT ${AGENT_PORT}

WORKDIR "/var/jenkins_home"

#-----------------------------------------------------------------------------------------------------------
#UPDATE
#-----------------------------------------------------------------------------------------------------------
USER root
RUN apt-get update -y
RUN apt-get upgrade -y

#-----------------------------------------------------------------------------------------------------------
#ADDITIONAL TOOLS
#-----------------------------------------------------------------------------------------------------------
RUN apt-get install -y vim
RUN apt-get install -y curl
RUN apt-get install -y wget

#-----------------------------------------------------------------------------------------------------------
#WHEN USE SSL
#-----------------------------------------------------------------------------------------------------------
#ENV CERT_PEM https.pem
#ENV CERT_DIR "/var/lib/jenkins/cert"
#ENV PK_KEY https.key
#ENV PK_DIR "/var/lib/jenkins/pk"
#COPY ${CERT_PEM} ${CERT_DIR}
#COPY ${PK_KEY} ${PK_DIR}
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=${CERT_DIR} --httpsPrivateKey=${PK_DIR}

#-----------------------------------------------------------------------------------------------------------
#FINISH
#-----------------------------------------------------------------------------------------------------------
USER jenkins
#HTTPS
EXPOSE ${HTTPS_PORT}
#HTTP
EXPOSE ${HTTP_PORT}
#AGENT
EXPOSE ${AGENT_PORT}