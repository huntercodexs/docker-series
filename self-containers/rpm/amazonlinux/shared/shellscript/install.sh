#!/bin/bash

command=$1

user=jereelton
group=jereelton
application=counter
script=${application}.sh

app_dir=/opt/services/${application}
config_dir=/etc/opt/services/${application}
data_dir=/var/opt/services/${application}
log_dir=/var/log/services/${application}
service_dir=/usr/lib/systemd/system

if [[ "${command}" == "install" ]]
then
    echo "Installing..."

    rm -rf ${application}.service >> /dev/null 2>&1
    touch ${application}.service

    echo "[Unit]" >> ${application}.service
    echo "Description=${application}.service" >> ${application}.service
    echo "After=network-online.target" >> ${application}.service
    echo "" >> ${application}.service
    echo "[Service]" >> ${application}.service
    echo "Type=simple" >> ${application}.service
    echo "WorkingDirectory=/var/opt/services/${application}" >> ${application}.service
    echo "ExecStart=/bin/bash /opt/services/${application}/${application}.sh" >> ${application}.service
    echo "Restart=on-abort" >> ${application}.service
    echo "User=${user}" >> ${application}.service
    echo "Group=${group}" >> ${application}.service
    echo "" >> ${application}.service
    echo "[Install]" >> ${application}.service
    echo "WantedBy=multi-user.target" >> ${application}.service
    echo "" >> ${application}.service

    chown ${user}:${group} ${application}.service

    getent group ${group} >/dev/null || groupadd -f -g 30001 -r ${group}

    if ! getent passwd ${user} >> /dev/null 2>&1
    then
        if ! getent passwd 30001 >> /dev/null 2>&1
        then
          useradd -r -u 30001 -g ${group} -d /home/${user} -s /sbin/nologin -c "${user} account" ${user}
        else
          useradd -r -g ${group}  -d /home/${user} -s /sbin/nologin -c "mappv account" ${user}
        fi
    fi

    mkdir -p ${app_dir}
    mkdir -p ${config_dir}
    mkdir -p ${data_dir}
    mkdir -p ${log_dir}

    cp ${script} ${app_dir}/${script}
    cp ${application}.service ${service_dir}/${application}.service

    chown ${user}:${group} ${app_dir} -R
    chown ${user}:${group} ${config_dir} -R
    chown ${user}:${group} ${data_dir} -R
    chown ${user}:${group} ${log_dir} -R

    sudo systemctl enable ${application}.service
    sudo systemctl start ${application}.service
    sudo systemctl daemon-reload

    echo "Please wait..."
    sleep 3
    sudo systemctl status ${application}.service

fi

if [[ "${command}" == "uninstall" ]]
then
    echo "Uninstalling..."

    userdel ${user}
    groupdel ${group}

    rm -rf ${app_dir}
    rm -rf ${config_dir}
    rm -rf ${data_dir}
    rm -rf ${log_dir}

    sudo systemctl stop ${application}.service

    rm -rf ${service_dir}/${application}.service
    if ls /etc/systemd/system/multi-user.target.wants/${application}.service >> /dev/null 2>&1
    then
        sudo unlink /etc/systemd/system/multi-user.target.wants/${application}.service
    fi
    echo "Please wait..."
    sleep 3
    sudo systemctl daemon-reload
fi

echo "DONE"
