#!/bin/bash

cd /home/nodejs/app1
npm init
npm install express --save
echo 'NPM is Running...' >> /home/nodejs/app1/details.log
node /home/nodejs/app1/app1.js &
