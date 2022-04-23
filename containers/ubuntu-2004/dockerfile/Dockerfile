FROM ubuntu:20.04

RUN apt-get update && \
    apt-get upgrade && \
    apt-get clean

# MYSQL
#RUN apt-get install -y mysql-server -y
#
#RUN service mysql start

EXPOSE 8581

CMD ["bash", "mysql"]
