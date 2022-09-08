#!/bin/bash

if [[ $1 == '--get' ]]; then
    cp -r /usr/local/apache2/conf /home/webserver/
    cp -r /usr/local/apache2/htdocs /home/webserver/
    chown nobody:nogroup /home/webserver -R
fi

if [[ $1 == '--apply' ]]; then
    cp -r /home/webserver/conf /usr/local/apache2/
    cp -r /home/webserver/htdocs /usr/local/apache2/
    chown root:root /usr/local/apache2/conf -R
    chown root:root /usr/local/apache2/htdocs -R
    /usr/local/apache2/bin/apachectl restart
fi