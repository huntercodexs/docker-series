FROM python:3

ENV DIR_APP "/home/python3/pysimple"
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR "/home/python3/pysimple"

#SETUP USER TO RUN APP
RUN chown nobody:nogroup $DIR_APP -R

#SETUP APPLICATION ENVIRONMENT FROM SCRIPT
#COPY setup.sh .
#RUN ./setup.sh

RUN pip install --upgrade pip
RUN pip3 install flask
RUN pip3 install -U flask-cors

#SETUP APPLICATION REQUIREMENTS
#COPY pysimple/requirements.txt .
#RUN pip3 install -r $DIR_APP/requirements.txt

CMD ["python3", "server.py"]

EXPOSE 5000
EXPOSE 8080
EXPOSE 1800