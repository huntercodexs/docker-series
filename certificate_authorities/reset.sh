#!/bin/sh

echo "********************************************************************************"
echo "Welcome to Certificate Authorities !"
echo "********************************************************************************"
echo "Reset the folders ? Press [Enter] to continue, [Ctrl+C] to cancel: "
read OP

#CA SERVER
rm -rfv ./share/caserver/easy-rsa/*.crt
rm -rfv ./share/caserver/easy-rsa/*.csr
rm -rfv ./share/caserver/easy-rsa/*.req
rm -rfv ./share/caserver/easy-rsa/*.key

#SSL SERVER 1
rm -rfv ./share/nginx-ssl-1/*.crt
rm -rfv ./share/nginx-ssl-1/*.csr
rm -rfv ./share/nginx-ssl-1/*.req
rm -rfv ./share/nginx-ssl-1/*.key

#NGINX SERVER 1
rm -rfv ./nginx-ssl-server-1/ssl/*.crt
rm -rfv ./nginx-ssl-server-1/ssl/*.csr
rm -rfv ./nginx-ssl-server-1/ssl/*.req
rm -rfv ./nginx-ssl-server-1/ssl/*.key

echo "OK !"