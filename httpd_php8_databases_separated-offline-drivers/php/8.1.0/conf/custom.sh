#!/bin/bash

#MongoDB dependencies - composer require mongodb/mongodb
cp -r /opt/mongodb/vendor /var/www/webserver/application-mongodb/
cp -r /opt/mongodb/composer.* /var/www/webserver/application-mongodb/

