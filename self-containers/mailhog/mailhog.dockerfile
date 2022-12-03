FROM ubuntu:20.04

# DISABLE ASK (Please select the geographic area in which you live)
ENV DEBIAN_FRONTEND noninteractive

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# GO + GIT
RUN apt-get -y install golang-go
RUN apt-get -y install git

# MAIL HOG
RUN go get github.com/mailhog/MailHog

# RUN THE MAIL HOG
CMD ~/go/bin/MailHog

EXPOSE 8025
EXPOSE 1025
