#!/bin/bash

source configure.sh

echo "===================================================================="
echo "STOPPING APPLICATIONS..."
sleep 1

##########
# NGINX
##########

echo "===================================================================="
echo "NGINX SERVER IS STOPPING"
sudo service nginx stop
sleep 1
sudo service nginx status
echo "...DONE"

###########
# DOCKER
###########

echo "===================================================================="
echo "DOCKER COMPOSE IS STOPPING"
docker-compose stop
docker-compose ps
echo "...DONE"

sleep 1

########################
# APPLICATIONS START
########################

for ((i = 0; i < ${#APPS[@]}; i++)); do

    echo "===================================================================="
    echo "APPLICATION ${APPS[$i]} IS STOPPING"
    APP_NAME="${APPS[$i]}"

    sleep 1
    sudo service ${APP_NAME} stop
    sleep 1
    sudo service ${APP_NAME} status

    cd -
    echo "...DONE"

done

echo "===================================================================="
echo "Everything is fine !"
exit 0
