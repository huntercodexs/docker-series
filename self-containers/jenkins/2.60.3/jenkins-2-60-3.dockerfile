FROM jenkins/jenkins:2.60.3

#-----------------------------------------------------------------------------------------------------------
#SETTINGS
#-----------------------------------------------------------------------------------------------------------
ENV HTTP_PORT 8080
ENV HTTPS_PORT 8083
ENV AGENT_PORT 50000
ENV JENKINS_SLAVE_AGENT_PORT ${AGENT_PORT}

VOLUME "/var/jenkins_home"

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
#INSTALL PLUGINS
#-----------------------------------------------------------------------------------------------------------
#RUN jenkins-plugin-cli --plugins cloudbees-folder:6.758.vfd75d09eea_a_1
#RUN jenkins-plugin-cli --plugins cloudbees-folder

#-----------------------------------------------------------------------------------------------------------
#FIX ISSUES: https://github.com/jenkinsci/docker/blob/587b2856cd225bb152c4abeeaaa24934c75aa460/Dockerfile
#-----------------------------------------------------------------------------------------------------------
#USER jenkins
#RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d
#
#ENV TINI_VERSION 0.14.0
#ENV TINI_SHA 6c41ec7d33e857d4779f14d9c74924cab0c7973485d2972419a3b7c7620ff5fd
#
##RUN curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini && chmod +x /bin/tini \
##  && echo "$TINI_SHA  /bin/tini" | sha256sum -c -
#
#COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy
#
#ARG JENKINS_VERSION
#ENV JENKINS_VERSION ${JENKINS_VERSION:-2.60.3}
#
#ARG JENKINS_SHA=2d71b8f87c8417f9303a73d52901a59678ee6c0eefcf7325efed6035ff39372a
#
#ARG JENKINS_URL=https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war
#
#RUN curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war \
#  && echo "${JENKINS_SHA}  /usr/share/jenkins/jenkins.war" | sha256sum -c -
#
#ENV JENKINS_UC https://updates.jenkins.io
#ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
#
#COPY jenkins-support /usr/local/bin/jenkins-support
#COPY jenkins.sh /usr/local/bin/jenkins.sh
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
#
##COPY plugins.sh /usr/local/bin/plugins.sh
##COPY install-plugins.sh /usr/local/bin/install-plugins.sh
#COPY jenkins-plugin-cli.sh /usr/local/bin/jenkins-plugin-cli.sh

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
