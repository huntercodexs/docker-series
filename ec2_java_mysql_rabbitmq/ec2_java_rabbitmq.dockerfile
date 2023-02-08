FROM amazonlinux

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
COPY jre/jre-8u212-linux-x64.rpm .
RUN rpm -ivh jre-8u212-linux-x64.rpm

# RABBITMQ
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y erlang --enablerepo=epel
RUN yum install -y yum-plugin-versionlock
RUN yum versionlock gcc-*
RUN yum install -y socat
RUN yum install -y logrotate
RUN wget https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_10/rabbitmq-server-3.6.10-1.el6.noarch.rpm
RUN rpm -ivh rabbitmq-server-3.6.10-1.el6.noarch.rpm
RUN rabbitmq-plugins enable rabbitmq_management &
RUN chkconfig rabbitmq-server on
RUN rabbitmq-server start &

EXPOSE 35900
