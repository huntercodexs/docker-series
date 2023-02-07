FROM redhat/ubi8

# UPDATE
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y initscripts

# LIBS

# ESSENTIALS

# OTHERS

# RPM
RUN dnf install -y rpm*

RUN groupadd dockerseries -g 9999
RUN useradd rpmuser -g dockerseries -d /home/rpmuser
RUN chown rpmuser:dockerseries /home/rpmuser -R

USER rpmuser
RUN cd /home/rpmuser

RUN mkdir -p /home/rpmuser/rpmbuild/BUILD
RUN mkdir -p /home/rpmuser/rpmbuild/RPMS
RUN mkdir -p /home/rpmuser/rpmbuild/SOURCES
RUN mkdir -p /home/rpmuser/rpmbuild/SPECS
RUN mkdir -p /home/rpmuser/rpmbuild/SRPMS
RUN rpmbuild

USER root

EXPOSE 35900
