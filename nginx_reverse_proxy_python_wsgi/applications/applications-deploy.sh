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
#python3 -m venv ${APP_ENV}
#source "${APP_ENV}/bin/activate"
pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors
#ufw allow ${APP_PORT}
#cp "${APP_NAME}.service" "/etc/systemd/system/${APP_NAME}.service"
#deactivate
python3 "${APP_NAME}.py" &
#systemctl start ${APP_NAME}
#systemctl enable ${APP_NAME}
#systemctl status ${APP_NAME}
#ufw delete allow ${APP_PORT}
#------------------------------------------------------------------------------------

sleep 2

#####################################################################################
# SAMPLE APPLICATION 2
#####################################################################################
APP_NAME="app2"
APP_ENV="app2env"
APP_PORT="55002"
cd "${HOME_APPS}/${APP_NAME}/"
#python3 -m venv ${APP_ENV}
#source "${APP_ENV}/bin/activate"
pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors
#ufw allow ${APP_PORT}
#cp "${APP_NAME}.service" "/etc/systemd/system/${APP_NAME}.service"
#deactivate
python3 "${APP_NAME}.py"
#systemctl start ${APP_NAME}
#systemctl enable ${APP_NAME}
#systemctl status ${APP_NAME}
#ufw delete allow ${APP_PORT}
#------------------------------------------------------------------------------------

