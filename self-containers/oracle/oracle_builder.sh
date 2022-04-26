#!/bin/bash

###########################################################################################################
# [Fonte]
# https://www.oracle.com/br/technical-resources/articles/database-performance/oracle-db19c-com-docker.html
###########################################################################################################

DATABASE_ZIPFILE="LINUX.X64_193000_db_home.zip"
INSTANCE_ORACLE="docker-images/OracleDatabase/SingleInstance/dockerfiles"
INSTANCE_VERSION="${INSTANCE_ORACLE}/19.3.0"

echo "**************************************************************************************************"
echo "Welcome to Oracle Builder!"
echo "**************************************************************************************************"
echo "Continue ? Press [Enter] to continue, [Ctrl+C] to cancel: "
read OP

docker login

sudo mkdir -p ./oracle/oracleData
sudo chmod 777 ./oracle/oracleData
sudo chown nobody:nogroup ./oracle/oracleData

# Current Folder Content
# ${DATABASE_ZIPFILE} (Required, this file should be downloaded before builder)
cd ./oracle/oracleData/

if ! ls docker-images >> /dev/null 2>&1
then
    git clone https://github.com/oracle/docker-images.git
else
    echo -ne "\n"
    echo "[Skipping] https://github.com/oracle/docker-images.git already exists !"
    echo -ne "\n"
fi

if ! ls database/${DATABASE_ZIPFILE}
then
    echo "[ERROR] Missing file: database/${DATABASE_ZIPFILE}"
    exit
fi

cp -rfv database/${DATABASE_ZIPFILE} ${INSTANCE_VERSION}/

if ! ls ${INSTANCE_VERSION}/${DATABASE_ZIPFILE}
then
    echo "[ERROR] Copy error file ${DATABASE_ZIPFILE} to ${INSTANCE_VERSION}"
    exit
fi

cd ${INSTANCE_ORACLE}/

ls -ltr

./buildContainerImage.sh -v 19.3.0 -e

rm -rfv 19.3.0/${DATABASE_ZIPFILE}

#echo "Please define a password to oracle administrator: "
#read -s ORACLE_PASSWORD

#docker exec -it oracle19c ./setPassword.sh ${ORACLE_PASSWORD}

#echo "To run this container use the commands bellow: "
#echo "docker run --name oracle19c -p 1521:1521 -p 5500:5500 -v projects:/opt/oracle/oradata oracle/database:19.3.0-ee"

#echo "-----------------------------------------------------------------------------------------------------------------"
#echo "Others commands can be used: "
#echo "
#docker stop oracle19c
#docker start oracle19c
#docker exec -it oracle19c /bin/bash
#docker exec -ti 067b6bde0f93 sqlplus system/_YOUR_ORACLE_PASSWORD_@orclpdb1
#sqlplus sys/_YOUR_ORACLE_PASSWORD_@ORCLCDB as sysdba
#sqlplus sys/_YOUR_ORACLE_PASSWORD_@ORCLPDB1 as sysdba
#sqlplus devel/_YOUR_ORACLE_PASSWORD_@ORCLPDB1
#ORCLPDB1.localdomain"

#echo "-----------------------------------------------------------------------------------------------------------------"
#
#echo "
## DATABASE
#CREATE USER DEVEL IDENTIFIED BY _YOUR_ORACLE_PASSWORD_;
#GRANT CREATE SESSION, CREATE TABLE TO devel;
#ALTER USER devel QUOTA 50m ON SYSTEM;
#CREATE SMALLFILE TABLESPACE USERS DATAFILE '/u01/app/oracle/oradata/ORCL/users.dbf' SIZE 10G;
#ALTER DATABASE DEFAULT TABLESPACE USERS;
#SELECT * FROM ALL_USERS au;
#SELECT * FROM ALL_USERS au WHERE USERNAME = 'DEVEL';
#"
#echo "-----------------------------------------------------------------------------------------------------------------"

echo ""
docker logout
echo ""
echo "Done !"
echo ""
