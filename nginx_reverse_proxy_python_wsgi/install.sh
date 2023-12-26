#!/bin/bash

source configure.sh

echo "INSTALL IS STARTING..."
sleep 2

#############
# PYTHON 3
#############

echo -n "INSTALL PYTHON ? Press [y=yes] [Enter=no]: "
read INSTALL_PYTHON

if [[ "${INSTALL_PYTHON}" == "y" ]]; then
    sudo apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
    sudo apt install -y python3-venv
fi

##########
# NGINX
##########

echo -n "INSTALL NGINX ? Press [y=yes] [Enter=no]: "
read INSTALL_NGINX
if [[ "${INSTALL_NGINX}" == "y" ]]; then
    sudo apt-get install -y nginx
fi

echo -n "CONFIGURE NGINX ? Press [y=yes] [Enter=no]: "
read CONFIGURE_NGINX
if [[ "${CONFIGURE_NGINX}" == "y" ]]; then
    sudo rm -rf /etc/nginx
    sudo mkdir -p /etc/nginx
    sudo cp -r ./restrict-server/nginx/proxy.conf /etc/nginx/proxy.conf
    sudo cp -r ./restrict-server/nginx/fastcgi.conf /etc/nginx/fastcgi.conf
    sudo cp -r ./restrict-server/nginx/mime.types /etc/nginx/mime.types
    sudo cp -r ./restrict-server/nginx/nginx.conf /etc/nginx/nginx.conf
    sudo cp -r ./restrict-server/nginx/conf.d/ /etc/nginx/conf.d/
    sudo cp -r ./restrict-server/nginx/htdocs/ /var/www/htdocs/
fi

echo "NGINX SERVER IS STARTING"
sudo service nginx start
sleep 2
sudo service nginx status
echo "...DONE"

###########
# DOCKER
###########

echo -n "BUILD DOCKER ? Press [y=yes] [Enter=no]: "
read BUILD_DOCKER
if [[ "${BUILD_DOCKER}" == "y" ]]; then
    docker network create nginx_reverse_proxy_python_wsgi_open_network
    docker-compose up --build &
    echo "Awaiting for docker-compose up --build - Please wait..."
    sleep 30
fi

docker-compose stop
docker-compose start
docker-compose ps

sleep 2
echo "----------------"

########################
# APPLICATIONS INSTALL
########################

mkdir -p $APPS_PATH
chmod 777 $APPS_PATH

pip install --upgrade pip
pip install virtualenv

for ((i = 0; i < ${#APPS[@]}; i++)); do

    echo "INSTALL ${APPS[$i]} IS STARTING"
    APP_NAME="${APPS[$i]}"
    APP_ENV=".${APPS[$i]}env"

    echo "Preparing environment"
    cp -r ./restrict-server/applications/${APPS[$i]} $APPS_PATH
    echo "Current Path: ${APPS_PATH}/${APP_NAME}/"
    cd "${APPS_PATH}/${APP_NAME}/"
    python3 -m venv ${APP_ENV}
    source "${APP_ENV}/bin/activate"

    echo "Install dependencies"
    #pip install -r requirements.txt #Maybe it can be crashed, so comment it line
    pip install wheel
    pip install gunicorn
    pip install flask
    pip install -U flask-cors
    deactivate

    echo "Cleaning old versions"
    sudo rm -rf "${SYSTEMD_DIR}/${APP_NAME}.service"
    sudo rm -rf "${LIB_DIR}/${APP_NAME}.service"
    sudo unlink "${SERVICE_DIR}/${APP_NAME}.service"

    echo "Creating service"
    sleep 1
    sudo cp "${APP_NAME}.service" "${SYSTEMD_DIR}/${APP_NAME}.service"
    sleep 1
    sudo cp "${APP_NAME}.service" "${LIB_DIR}/${APP_NAME}.service"
    sleep 1
    sudo ln -s "${LIB_DIR}/${APP_NAME}.service" "${SERVICE_DIR}/${APP_NAME}.service"

    echo "Starting service"
    sleep 1
    sudo service ${APP_NAME} start
    sleep 1
    sudo service ${APP_NAME} status

    sudo chmod 777 "${APPS_PATH}/${APP_NAME}/${APP_NAME}.sock"
    cd -
    echo "...DONE"

done

echo "Finishing all process"
sudo systemctl daemon-reload
sleep 2

echo "Everything is fine !"
exit 0
