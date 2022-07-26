FROM node
WORKDIR /home/nodejs/app
COPY ./package*.json ./

# If just install
#RUN npm install

# If update
RUN npm install -g npm@8.15.0

RUN npm install -g nodemon

COPY . .
EXPOSE 3000
CMD ["nodemon", "app.js"]
