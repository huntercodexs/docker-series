FROM ubuntu:18.04

RUN apt-get update && \
    apt-get upgrade && \
    apt-get clean

# MYSQL
#RUN apt-get install -y mysql-server -y
#
#RUN service mysql start

EXPOSE 8580

CMD ["bash", "mysql"]
