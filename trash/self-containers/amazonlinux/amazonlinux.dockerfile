FROM amazonlinux

# SHOW EXTRAS PACKAGES FROM AMAZON LIST
RUN amazon-linux-extras

# UPDATE
RUN yum update -y
RUN yum install -y initscripts

# LIBS

# ESSENTIALS

# OTHERS

EXPOSE 35900
