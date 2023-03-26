#!/bin/bash

cd /home/nodejs/app2
npm init
npm install express --save
echo 'NPM is Running...' >> /home/nodejs/app2/details.log
node /home/nodejs/app2/app2.js &
