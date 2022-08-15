FROM node

ENV DIR_APP "/home/nodejs/app"

WORKDIR "/home/nodejs/app"

#SETUP USER TO RUN APP
RUN chown nobody:nogroup $DIR_APP -R

COPY ./app /home/nodejs/app

RUN npm install
RUN npm install -g express
RUN npm install -g npm@8.15.0
RUN npm install -g nodemon

CMD ["nodemon", "app.js"]

EXPOSE 3000
EXPOSE 8080
