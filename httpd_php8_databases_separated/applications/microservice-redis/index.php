<?php

#################################################
# REDIS CONNECTION
#################################################

$redis = new Redis();

$redis->connect( '192.168.0.174', 6379, 2.5, NULL, 150 );
$redis->auth("123@Mudar#");
$redis->set('key_name_test', 'value to key name test is 1');

echo $redis->get('key_name_test');

phpinfo();
exit;
