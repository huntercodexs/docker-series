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

# RABBITMQ
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y erlang --enablerepo=epel
#RUN yum install yum-plugin-versionlock
#RUN yum versionlock gcc-*
RUN yum install -y socat
RUN yum install -y logrotate
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
RUN wget https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_10/rabbitmq-server-3.6.10-1.el6.noarch.rpm
RUN rpm -Uvh rabbitmq-server-3.6.10-1.el6.noarch.rpm
RUN rabbitmq-plugins enable rabbitmq_management &
RUN chkconfig rabbitmq-server on &

EXPOSE 5672
EXPOSE 15672
