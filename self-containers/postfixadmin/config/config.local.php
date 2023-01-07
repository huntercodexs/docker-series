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
$CONF['admin_email'] = $_ENV['POSTFIXADMIN_EMAIL_ADMIN'];
$CONF['admin_smtp_password'] = $_ENV['POSTFIXADMIN_SMTP_PASSWORD'];
$CONF['encrypt'] = $_ENV['POSTFIXADMIN_ENCRYPT_TYPE'];
$CONF['database_ssl_verify_server_cert'] = $_ENV['POSTFIXADMIN_SSL_VERIFY_SERVER_CERT'];
$CONF['configured'] = true;

//DEBUG
file_put_contents("DEBUG.log", "[/DEBUG]" . PHP_EOL, FILE_APPEND);
file_put_contents("DEBUG.log", print_r($CONF, true) . PHP_EOL, FILE_APPEND);
file_put_contents("DEBUG.log", "[DEBUG/]" . PHP_EOL, FILE_APPEND);
file_put_contents("DEBUG.log", "--------" . PHP_EOL, FILE_APPEND);