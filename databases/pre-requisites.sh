#!/bin/bash
set -Eeo pipefail

# shellcheck disable=2154
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

echo "**************************************************************************************************"
echo "Welcome to Databases Prepare !"
echo "**************************************************************************************************"
echo "Continue ? Press [Enter] to continue, [Ctrl+C] to cancel: "
read OP

# MSSQL
mkdir -p ./microsoft/mssql/opt
rm -rf ./microsoft/mssql/opt/*
touch ./microsoft/mssql/opt/.lock

# MONGO
mkdir -p ./mongodb/mongo/MongoDB
rm -rf ./mongodb/mongo/MongoDB/*
touch ./mongodb/mongo/MongoDB/.lock

# MYSQL 5.7
mkdir -p ./mysql/mysql-57/lib
rm -rf ./mysql/mysql-57/lib/*
touch ./mysql/mysql-57/lib/.lock

# MYSQL 8.0
mkdir -p ./mysql/mysql-80/lib
rm -rf ./mysql/mysql-80/lib/*
touch ./mysql/mysql-80/lib/.lock

# ORACLE
rm -rf ./oracle/oradata
mkdir -p ./oracle/oradata
cd ./oracle/database/
if ! ls "LINUX.X64_193000_db_home.zip" >> /dev/null 2>&1
then
    echo "============================================================================================================"
    echo "W A R N I N G";
    echo "Database file [LINUX.X64_193000_db_home.zip] not found !"
    echo "============================================================================================================"
fi
tar -xvf oraclelinux-database-scripts-19c.tar.bz2
cd -

# POSTGRES
mkdir -p ./postgres/PostgresSQL
rm -rf ./postgres/PostgresSQL/*

# SQLITE3
mkdir -p ./sqlite3/sqliteDB/sqlite-autoconf
rm -rf ./sqlite3/sqliteDB/sqlite-autoconf/*

allown -y

echo ""
echo "Everything is done !"
echo ""

exit