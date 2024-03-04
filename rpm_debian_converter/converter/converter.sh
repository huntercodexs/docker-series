#!/bin/bash

OPTION=$1
FILENAME=$2

echo "OPTION: [${OPTION}]"
echo "FILENAME: [${FILENAME}]"

if [[ $OPTION == "deb" ]]
then
    if ! ls "/home/ubuntu/rpm_debian_converter/source/${FILENAME}.rpm" >> /dev/null 2>&1
    then
        echo "FILE NOT FOUND: ${FILENAME}.rpm"
        exit
    else
        echo "Processing..."
        rm -f *.deb
        alien --scripts "/home/ubuntu/rpm_debian_converter/source/${FILENAME}.rpm"
        NAME=$(basename *.deb)
        mv -v ${NAME} "/home/ubuntu/rpm_debian_converter/debian/"
        echo "Your DEBIAN file result is placed in the folder: /debian/"
        echo "You can install the ${NAME} using the command: dpkg -i ${NAME}"
    fi
fi

if [[ $OPTION == "rpm" ]]
then
    if ! ls "/home/ubuntu/rpm_debian_converter/source/${FILENAME}.deb" >> /dev/null 2>&1
    then
        echo "FILE NOT FOUND: ${FILENAME}.deb"
        exit
    else
        echo "Processing..."
        rm -f *.rpm
        alien -r --scripts "/home/ubuntu/rpm_debian_converter/source/${FILENAME}.deb"
        NAME=$(basename *.rpm)
        mv -v ${NAME} "/home/ubuntu/rpm_debian_converter/rpm/"
        echo "Your RPM file result is placed in the folder: /rpm/"
        echo "You can install the ${NAME} using the command: rpm -ivh ${NAME}"
    fi
fi

echo ""
echo "[TIP]"
echo "Maybe you need to execute the following command: "
echo "cd /usr/bin"
echo "ln -s /bin/systemctl systemctl"
echo "ls -ltr /usr/bin/systemctl"
echo ""
echo "DONE !"
