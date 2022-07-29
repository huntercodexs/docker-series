
# Docker Series

The Docker Series to most containers dockerized

-------------

# Information

Please use the branch selection to access others configurations to most need and purposes

-------------

# Dockers Configurations Contained

- HTTPD
- PHP-FPM

-------------

# How to use

<pre>
# Server version: Apache/2.4.54 (Unix)
# Server built:   Jul 12 2022 04:31:28
#
# Execute the script "webserver.sh prepare" after docker-compose up -d
#   > docker exec -it webserver /bin/bash
#   > /home/apache2/webserver.sh prepare
# Edit the files in /httpd_php8_separated/webserver/conf/ in this project path [conf|htdocs]
#   > httpd.conf
#   > sites-available.conf
# Execute again the script "webserver.sh restart"
#   > /home/webserver/webserver.sh restart
# Restart apache service: "service webserver restart"
# Check if a2enmod is ok: "a2enmod rewrite"
# If needed check virtualhost name is ok: "a2ensite app.local.conf"
</pre>

-------------

