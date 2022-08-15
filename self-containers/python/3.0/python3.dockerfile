FROM python:3

ENV DIR_APP "/home/python3/pysimple"

WORKDIR "/home/python3/pysimple"

# SET USER TO RUN APP
RUN mkdir -p $DIR_APP
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_APP
RUN chown nobody:nogroup $DIR_APP -R

USER docker_series

EXPOSE 5000
EXPOSE 8080
EXPOSE 1800

#CMD ["/usr/local/bin/python", "-m", "pip", "install", "--upgrade", "pip"]
CMD ["pip install --upgrade pip"]
CMD ["pip3", "install"]
CMD ["pip3", "install", "flask"]
CMD ["pip3", "install", "-U", "flask-cors"]

CMD ["python3", "server.py"]
