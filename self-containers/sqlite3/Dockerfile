FROM ubuntu:20.04

## UPDATE SYSTEM
RUN apt-get update -y && apt-get upgrade -y

## ESSENTIALS
RUN apt-get install build-essential tar wget nano curl gcc make -y

## PREPARE
RUN mkdir -p /data/sqlite3/
RUN chmod 777 /data/sqlite3 -R

## COPY SOURCE CODE
COPY ./sqliteDB/ /data/sqlite3/

RUN cd /data/sqlite3/

RUN apt-get install gnupg2 -y

RUN apt-get install sqlite3 -y
RUN apt-get install libsqlite3-dev -y

### CONFIGURE & INSTALATION
#RUN chmod 777 /data -R
#RUN cd /data/sqlite3/ \
#    ./configure \
#    make \
#    make install \

### CHECK VERSION INSTALED
RUN sqlite3 --version

## PORT ACCESS
EXPOSE 5050

### PROCESS FINALLY
CMD ["bash"]