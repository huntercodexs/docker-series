#!/bin/bash

source configure.sh

###########
# DOCKER
###########

echo "===================================================================="
echo "DOCKER COMPOSE UNINSTALL IS STARTING..."
sleep 1

docker-compose stop
docker-compose down --volumes

########################
# APPLICATIONS START
########################

echo "===================================================================="
echo "APPLICATIONS UNINSTALL IS STARTING..."
sleep 1

for ((i = 0; i < ${#APPS[@]}; i++)); do

    echo "--------------------------------------------------------------------"
    echo "Application ${APPS[$i]}..."
    APP_NAME="${APPS[$i]}"
    APP_ENV=".${APPS[$i]}env"

    echo "Stopping service and remove .service files"
    sudo service ${APP_NAME} stop
    sudo rm -rf "${SYSTEMD_DIR}/${APP_NAME}.service"
    sudo rm -rf "${LIB_DIR}/${APP_NAME}.service"
    sudo unlink "${SERVICE_DIR}/${APP_NAME}.service"

    echo "Removing files"
    sudo rm -rf "${APPS_PATH}/${APP_NAME}"
    echo "Checking service status: Expected [Unit ${APP_NAME}.service could not be found.]"
    sleep 1
    sudo service ${APP_NAME} status
    echo "...DONE"

done

echo "===================================================================="
echo "Finishing all process"
sudo systemctl daemon-reload
sleep 2

echo ""
echo "NOTE: Maybe you want to uninstall all of docker containers, so you can use the follow command"
echo "docker system prune -a"
echo ""

echo "===================================================================="
echo "Everything is fine !"
exit 0