#!/bin/bash

FILENAME=$1

if  [ -e "/home/ppk-pem-ppk/ppk/${FILENAME}.ppk" ];
then
    puttygen /home/ppk-pem-ppk/ppk/${FILENAME}.ppk -o /home/ppk-pem-ppk/ppk/${FILENAME}.pem -O private-openssh
    cp /home/ppk-pem-ppk/ppk/${FILENAME}.pem /home/ppk-pem-ppk/result/${FILENAME}.pem
    echo "OK !"
else
    echo "PPK File not found to convert /home/ppk-pem-ppk/ppk/${FILENAME}.ppk"
fi

