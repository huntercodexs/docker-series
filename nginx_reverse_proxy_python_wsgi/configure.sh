#!/bin/bash

APPS_PATH=/home/$USER/tmp/applications
LIB_DIR=/lib/systemd/system
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR=${SYSTEMD_DIR}/multi-user.target.wants
APPS=($(ls ./restrict-server/applications/))
