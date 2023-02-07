FROM fedora:latest

# UPDATE
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y initscripts

# LIBS

# ESSENTIALS

# OTHERS

# RPM
RUN yum install -y rpmdevtools rpmlint

RUN groupadd dockerseries -g 9999
RUN useradd rpmuser -g dockerseries -d /home/rpmuser
RUN chown rpmuser:dockerseries /home/rpmuser -R
USER rpmuser
RUN cd /home/rpmuser
RUN rpmdev-setuptree
USER root

EXPOSE 35900
