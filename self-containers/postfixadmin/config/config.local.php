<?php
$CONF['database_type'] = $_ENV['POSTFIXADMIN_DB_TYPE'];
$CONF['database_host'] = $_ENV['POSTFIXADMIN_DB_HOST'];
$CONF['database_port'] = $_ENV['POSTFIXADMIN_DB_PORT'];
$CONF['database_user'] = $_ENV['POSTFIXADMIN_DB_USER'];
$CONF['database_password'] = $_ENV['POSTFIXADMIN_DB_PASSWORD'];
$CONF['database_name'] = $_ENV['POSTFIXADMIN_DB_NAME'];
$CONF['setup_password'] = $_ENV['POSTFIXADMIN_SETUP_PASSWORD'];
$CONF['smtp_server'] = $_ENV['POSTFIXADMIN_SMTP_SERVER'];
$CONF['smtp_port'] = $_ENV['POSTFIXADMIN_SMTP_PORT'];
$CONF['admin_email'] = 'admin@email.com';
$CONF['admin_smtp_password'] = 'admin';
$CONF['encrypt'] = 'md5crypt';
$CONF['configured'] = true;

// Enable whether to get all env vars
//echo "[/DEBUG]\n";
//print_r($CONF);
//echo "[DEBUG/]";