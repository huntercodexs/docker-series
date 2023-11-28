#!/bin/bash

if [[ $1 == 'prepare' ]]; then
    cp -r /usr/local/apache2/conf /home/webserver/shared/
    cp -r /usr/local/apache2/htdocs /home/webserver/shared/
    chown nobody:nogroup /home/webserver/shared -R
fi

if [[ $1 == 'restart' ]]; then
    cp -r /home/webserver/shared/conf /usr/local/apache2/
    cp -r /home/webserver/shared/htdocs /usr/local/apache2/

    chown root:root /usr/local/apache2/conf -R
    chown root:root /usr/local/apache2/htdocs -R

    /usr/local/apache2/bin/apachectl restart

    #a2ensite app.local.conf
    #a2enmod rewrite
    #service apache2 restart
fi