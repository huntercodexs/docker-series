FROM node:18.7.0

ENV APP_SOURCE "./app"
ENV DIR_APP "/home/nodejs/app"
ENV DIR_MODULES "/home/nodejs"

RUN mkdir -p $DIR_MODULES
WORKDIR $DIR_MODULES
COPY $APP_SOURCE/package*.json $DIR_MODULES/

## COMMOM DEPENDENCIES TO RUN APP
RUN npm install
RUN npm install -g express
RUN npm install -g npm@8.15.0
RUN npm install -g nodemon

RUN mv $DIR_MODULES/package*.json $DIR_MODULES/node_modules/

WORKDIR $DIR_APP
COPY $APP_SOURCE $DIR_APP

#SETUP USER TO RUN APP
RUN chown nobody:nogroup $DIR_APP -R

EXPOSE 3000
EXPOSE 8080

CMD ["nodemon", "app.js"]
