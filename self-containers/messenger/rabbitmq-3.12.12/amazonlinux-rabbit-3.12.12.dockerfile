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
ENV ELIXIR_ERL_OPTIONS "+fnu"
RUN amazon-linux-extras install epel -y
RUN wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_25.0.3-1~centos~7_amd64.rpm
RUN yum install esl-erlang_25.0.3-1~centos~7_amd64.rpm -y
RUN #yum install -y erlang --enablerepo=epel
#RUN yum install yum-plugin-versionlock
#RUN yum versionlock gcc-*
RUN yum install -y socat
RUN yum install -y logrotate
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
RUN wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.12.12/rabbitmq-server-3.12.12-1.el8.noarch.rpm
RUN rpm -Uvh rabbitmq-server-3.12.12-1.el8.noarch.rpm
RUN rabbitmq-plugins enable rabbitmq_management &
RUN chkconfig rabbitmq-server on &

EXPOSE 5672
EXPOSE 15672

