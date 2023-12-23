#!/bin/bash

HOME_APPS=/home/python3/applications
LIB_DIR=/lib/systemd/system
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR=${SYSTEMD_DIR}/multi-user.target.wants
FAKE_LOG_FILE=${HOME_APPS}/fake-log.log

pip install --upgrade pip
pip install virtualenv

#####################################################################################
# DEPLOY
#####################################################################################

echo "STARTING APPLICATION DEPLOY..."

### SAMPLE APPLICATION 1

echo "DEPLOY APPLICATION 1 STARTED"
APP_NAME="app1"
APP_ENV="app1env"
APP_PORT="55001"
cd "${HOME_APPS}/${APP_NAME}/"
python3 -m venv ${APP_ENV}
source "${APP_ENV}/bin/activate"
pip install -r requirements.txt
pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors
cp "${APP_NAME}.service" "${SYSTEMD_DIR}/${APP_NAME}.service"
cp "${APP_NAME}.service" "${LIB_DIR}/${APP_NAME}.service"
ln -s "${LIB_DIR}/${APP_NAME}.service" "${SERVICE_DIR}/${APP_NAME}.service"
#systemctl daemon-reload
#service ${APP_NAME} start
#service ${APP_NAME} status
#ufw allow ${APP_PORT}
#ufw delete allow ${APP_PORT}
python3 "${APP_NAME}.py" &
deactivate
echo "...OK"
#------------------------------------------------------------------------------------

sleep 2

### SAMPLE APPLICATION 2

echo "DEPLOY APPLICATION 2 STARTED"
APP_NAME="app2"
APP_ENV="app2env"
APP_PORT="55002"
cd "${HOME_APPS}/${APP_NAME}/"
python3 -m venv ${APP_ENV}
source "${APP_ENV}/bin/activate"
pip install -r requirements.txt
pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors
cp "${APP_NAME}.service" "${SYSTEMD_DIR}/${APP_NAME}.service"
cp "${APP_NAME}.service" "${LIB_DIR}/${APP_NAME}.service"
ln -s "${LIB_DIR}/${APP_NAME}.service" "${SERVICE_DIR}/${APP_NAME}.service"
#systemctl daemon-reload
#service ${APP_NAME} start
#service ${APP_NAME} status
#ufw allow ${APP_PORT}
#ufw delete allow ${APP_PORT}
python3 "${APP_NAME}.py" &
deactivate
echo "...OK"
#------------------------------------------------------------------------------------

echo "...DONE"

#####################################################################################
# NGINX
#####################################################################################

echo "STARTING NGINX SERVER..."
service nginx status
sleep 2
service nginx start
sleep 2
service nginx status
echo "...DONE"

# dont remove this line because this one keep the container running
tail -f ${FAKE_LOG_FILE}
