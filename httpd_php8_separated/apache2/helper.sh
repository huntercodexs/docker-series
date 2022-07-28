#!/bin/bash

if [[ $1 == 'share' ]]; then
    cp -r /usr/local/apache2/conf /home/apache2/
    cp -r /usr/local/apache2/htdocs /home/apache2/
    chown nobody:nogroup /home/apache2 -R
fi

if [[ $1 == 'deploy' ]]; then
    cp -r /home/apache2/conf /usr/local/apache2/
    cp -r /home/apache2/htdocs /usr/local/apache2/
    chown root:root /usr/local/apache2/conf -R
    chown root:root /usr/local/apache2/htdocs -R

    #a2ensite app.local.conf
    #a2enmod rewrite
    #service apache2 restart
fi