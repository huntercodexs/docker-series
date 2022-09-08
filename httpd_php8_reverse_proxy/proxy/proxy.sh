#!/bin/bash

if [[ $1 == '--get' ]]; then
    cp -r /usr/local/apache2/conf /home/proxy/
    cp -r /usr/local/apache2/htdocs /home/proxy/
    chown nobody:nogroup /home/proxy -R
fi

if [[ $1 == '--apply' ]]; then
    cp -r /home/proxy/conf /usr/local/apache2/
    cp -r /home/proxy/htdocs /usr/local/apache2/
    chown root:root /usr/local/apache2/conf -R
    chown root:root /usr/local/apache2/htdocs -R
    /usr/local/apache2/bin/apachectl restart
fi
