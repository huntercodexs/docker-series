#!/bin/bash

source configure.sh

echo "===================================================================="
echo "STARTING APPLICATIONS..."
sleep 1

##########
# NGINX
##########

echo "===================================================================="
echo "NGINX SERVER IS STARTING"
sudo service nginx start
sleep 1
sudo service nginx status
echo "...DONE"

###########
# DOCKER
###########

echo "===================================================================="
echo "DOCKER COMPOSE IS STARTING"
docker-compose start
docker-compose ps
echo "...DONE"

sleep 1

########################
# APPLICATIONS START
########################

for ((i = 0; i < ${#APPS[@]}; i++)); do

    echo "===================================================================="
    echo "APPLICATION ${APPS[$i]} IS STARTING"
    APP_NAME="${APPS[$i]}"

    sleep 1
    sudo service ${APP_NAME} start
    sleep 1
    sudo service ${APP_NAME} status

    sudo chmod 777 "${APPS_PATH}/${APP_NAME}/${APP_NAME}.sock"
    cd -
    echo "...DONE"

done

echo "===================================================================="
echo "Everything is fine !"
exit 0
