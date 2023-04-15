#!/bin/bash

echo "********************************************************************************"
echo "Welcome to PPK Convert to PEM and Vice-Versa !"
echo "********************************************************************************"
echo "Remove all ppk and pem keys ? Press [Enter] to continue, [Ctrl+C] to cancel: "
read OP

rm ./share/pem/*.pem
rm ./share/pem/*.ppk
rm ./share/ppk/*.pem
rm ./share/ppk/*.ppk
rm ./share/result/*.pem
rm ./share/result/*.ppk
