#!/bin/bash

#
# Script Location:
# --------------------
# /home/$USER/docker-series/elk_prometheus_grafana_zipkin_mysql_v1/prometheus/script/targets-export.sh
#
# Important Note:
# --------------------
# This script only export microservices from Eureka Service Discovery Log, it means say that
# all microservices and only these microservices registered in the Eureka will be exported from the
# current log produced by Eureka. Therefore, you need to inform the current and correct path to
# Eureka Service where all of the microservices has been registered. The log record that will be seek in the
# log look like something like that:
# Registered instance NEW-MICROSERVICE-DEMO/192.168.0.204:new-microservice-demo:31315 with status UP (replication=true)
#
# How to execute:
# --------------------
# ./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/ [--reload: optional]
#
# Reload Prometheus YML Configurations (SIGHUP)
# pgrep prometheus -> 1
# kill -HUP 1
# You can use the script prometheus-reload.sh to make it more easily
#
# Step by step:
# --------------------
# 1) Build Prometheus container: docker-compose up --build prometheus
# 2) Export targets to prometheus without reload prometheus:
#   2.1) ./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/
# 3) Export targets to prometheus with reload prometheus:
#   3.1) ./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/ --reload
#

EUREKA_LOG_FILE_PATH=$1
TARGET_FILE_PATH=$2
COMMAND=$3
ENVIRONMENT="development" #Use: production, development or sandbox
OPERATION_DATE=$(date '+%Y%m%d%H%M%S')
TEMPLATE="IP"

TARGET_JSON_FILE='
[\n\t{\n
\t\t"targets": ["CURRENT_IP:CURRENT_PORT"],\n
\t\t"labels": {\n
\t\t\t"env": "'${ENVIRONMENT}'",\n
\t\t\t"job": "job-CURRENT_ALIAS"\n
\t\t}\n
\t}\n]\n'

function generate_target_file {
    #Params
    #$1: CURRENT_ALIAS
    #$2: CURRENT_IP
    #$3: CURRENT_PORT
    #$4: TARGET_FILE_PATH

    if ls "$1.json" >> /dev/null 2>&1
    then
        rm "$1.json"
    fi

    touch "$1.json"

    echo -e ${TARGET_JSON_FILE} | sed -e "s/CURRENT_ALIAS/$1/g"  | sed -e "s/CURRENT_IP/$2/g" | sed -e "s/CURRENT_PORT/$3/g" >> "$1.json"

    if [[ $4 != "" && $4 != "./" && -e $4 ]]
    then
        cp -v "$1.json" "$4/$1.json"
    fi

    if ls ../targets >> /dev/null 2>&1
    then
        mv -v "$1.json" "../targets/$1.json"
    fi

    echo "$1.json was created successfully"
    echo -e "-----------------------------\n"
}

function generate_prometheus_file {
    #Params
    #$1: CREATE|CURRENT_ALIAS
    #$2: TARGET_FILE_PATH

    if [[ $1 == "CREATE" ]]
    then
        if ls "../prometheus.yml" >> /dev/null 2>&1
        then
            mkdir -p "../backup"
            cp "../prometheus.yml" "../backup/prometheus.yml-${OPERATION_DATE}"
        fi

        echo -e "scrape_configs:\n" > "../prometheus.yml"
    else
        #Don't modify these lines
        echo -ne "  - job_name: '$1'\n" >> "../prometheus.yml"
        echo -ne '    scrape_interval: 2s\n' >> "../prometheus.yml"
        echo -ne '    metrics_path: "/actuator/prometheus"\n' >> "../prometheus.yml"
        echo -ne '    file_sd_configs:\n' >> "../prometheus.yml"
        echo -ne '    - files:\n' >> "../prometheus.yml"
        echo -ne "      - $2/$1.json\n\n" >> "../prometheus.yml"
    fi
}

function reload_prometheus {
    cd ../../
    if ls ./prometheus/script/prometheus-reload.sh >> /dev/null 2>&1
    then
        docker exec -it prometheus sh /home/prometheus/prometheus-reload.sh
        echo ""
        echo "Prometheus reloaded successfully, please check the current service status on http://localhost:9090/targets"
    else
        echo "Error: Reload is not available, check the current path."
    fi
    cd -
}

if [[ ${EUREKA_LOG_FILE_PATH} == "" ]]
then
    echo "Missing EUREKA_LOG_FILE_PATH"
    exit
fi

TARGET_FILE_PATH=$(echo ${TARGET_FILE_PATH} | sed -e 's/[/]$//g')

if [[ ${TARGET_FILE_PATH} == "" ]]
then
    TARGET_FILE_PATH="./"
fi

#TEMPLATE=IP
INSTANCES=($(egrep "Registered instance ([a-zA-Z_-]+\/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[a-zA-Z_-]+:[0-9]+) with status UP" ${EUREKA_LOG_FILE_PATH} | cut -d: -f4-6 | egrep "replication=(true|false)" | sed -e 's/ Registered instance //g' | sed -e 's/ with status UP (replication=.*)//g' | sort | uniq))

if [[ ${#INSTANCES[@]} == "0" ]]
then
    #TEMPLATE=RANDOM-ID
    INSTANCES=($(egrep "Registered instance ([a-zA-Z_-]+\/[0-9a-zA-Z]+:[a-zA-Z_-]+:[0-9]+) with status UP" ${EUREKA_LOG_FILE_PATH} | cut -d: -f4-6 | egrep "replication=(true|false)" | sed -e 's/ Registered instance //g' | sed -e 's/ with status UP (replication=.*)//g' | sort | uniq))

    if [[ ${#INSTANCES[@]} == "0" ]]
    then
        echo "===================================="
        echo "Info: There is no targets to export."
        echo "===================================="
        exit
    fi

    TEMPLATE="RANDOM-ID"

    echo -e "\n\n"
    echo "NOTICE: TEMPLATE RANDOM-ID ACTIVATED"
    echo -e "\n\n"

else
    echo -e "\n\n"
    echo "NOTICE: TEMPLATE IP ACTIVATED"
    echo -e "\n\n"
fi

generate_prometheus_file "CREATE"

for instance in "${INSTANCES[@]}"
do
    echo "Processing [${instance}] data"

    CURRENT_NAME=$(echo $instance | cut -d "/" -f1)
    echo "Name: ${CURRENT_NAME}"

    if [[ ${TEMPLATE} == "IP" ]]
    then
        CURRENT_IP=$(echo $instance | cut -d ":" -f1 | cut -d "/" -f2)
    else
        CURRENT_IP="127.0.0.1"
    fi

    echo "IP: ${CURRENT_IP}"

    CURRENT_ALIAS=$(echo $instance | cut -d ":" -f2)
    echo "Alias: ${CURRENT_ALIAS}"

    CURRENT_PORT=$(echo $instance | cut -d ":" -f3)
    echo "Port: ${CURRENT_PORT}"

    generate_target_file ${CURRENT_ALIAS} ${CURRENT_IP} ${CURRENT_PORT} ${TARGET_FILE_PATH}
    generate_prometheus_file ${CURRENT_ALIAS} ${TARGET_FILE_PATH}

done

if [[ ${COMMAND} == "--reload" ]]
then
    reload_prometheus
fi

if [[ ${TEMPLATE} == "RANDOM-ID" ]]
then
    echo -e "\n\n"
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo "WARNING: The current configuration from the EUREKA SERVICE DISCOVERY is RANDOM-ID."
    echo "It means thar you need set up the configuration prometheus.yml file manually in the scope of IP for each target. "
    echo "Also check the json files (targets) generated."
    echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    echo -e "\n\n"
fi

exit
