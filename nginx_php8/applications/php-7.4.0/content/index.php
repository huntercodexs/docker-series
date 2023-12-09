<?php

echo "Sample say, PHP-7.4.0 is working...<br/>";

parse_str($_SERVER["QUERY_STRING"], $output);

var_dump($output);

phpinfo();

