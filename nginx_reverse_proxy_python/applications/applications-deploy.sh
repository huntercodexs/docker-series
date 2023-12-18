#!/bin/bash

HOME_APPS=/home/python3/applications

pip install --upgrade pip
pip install virtualenv

#####################################################################################
# SAMPLE APPLICATION 1
#####################################################################################
APP_NAME="app1"
APP_ENV="app1env"
APP_PORT="55001"
cd "${HOME_APPS}/${APP_NAME}/"

pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors

python3 "${APP_NAME}.py" &
#------------------------------------------------------------------------------------

sleep 2

#####################################################################################
# SAMPLE APPLICATION 2
#####################################################################################
APP_NAME="app2"
APP_ENV="app2env"
APP_PORT="55002"
cd "${HOME_APPS}/${APP_NAME}/"

pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors

python3 "${APP_NAME}.py" &
#------------------------------------------------------------------------------------

if ! ls /etc/nginx/sites-enabled/applications-server >> /dev/null
then
    ln -s /etc/nginx/sites-available/applications-server /etc/nginx/sites-enabled/applications-server
fi

ufw allow 'Nginx Full'
