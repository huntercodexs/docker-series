#!/bin/bash

cd /home/nodejs/app
npm init
npm install express --save
echo 'NPM is Running...' >> /home/nodejs/app/details.log
node /home/nodejs/app/app.js &
