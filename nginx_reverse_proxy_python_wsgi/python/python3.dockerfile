FROM python:3

ENV DIR_APP "/home/python3/applications/"
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR $DIR_APP

RUN chown nobody:nogroup $DIR_APP -R

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install --upgrade pip
RUN pip3 install flask
RUN pip3 install -U flask-cors

EXPOSE 5000
EXPOSE 8080
EXPOSE 1800