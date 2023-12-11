#!/bin/bash

cp -rf /home/proxy/conf /usr/local/apache2/
cp -rf /home/proxy/conf/htdocs /usr/local/apache2/

chown root:root /usr/local/apache2/conf -R
chown root:root /usr/local/apache2/htdocs -R

/usr/local/apache2/bin/apachectl restart