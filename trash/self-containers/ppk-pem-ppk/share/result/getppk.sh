#!/bin/bash

FILENAME=$1

if  [ -e "/home/ppk-pem-ppk/pem/${FILENAME}.pem" ];
then
    puttygen /home/ppk-pem-ppk/pem/${FILENAME}.pem -o /home/ppk-pem-ppk/pem/${FILENAME}.ppk -O private
    cp /home/ppk-pem-ppk/pem/${FILENAME}.ppk /home/ppk-pem-ppk/result/${FILENAME}.ppk
    echo "OK !"
else
    echo "PEM File not found to convert /home/ppk-pem-ppk/pem/${FILENAME}.pem"
fi
