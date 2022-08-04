<?php

#################################################
# MONGODB DATABASE CONNECTION
#################################################

require_once __DIR__ . '/vendor/autoload.php';

use MongoDB\Client;
use MongoDB\Driver\Manager;

echo "Connecting...";

try {

    $client = new \MongoDB\Client(
        'mongodb://root:MongoDB2019!@192.168.0.174:27017'
    );

    echo "<h1>Connected Successful</h1>";

    $cursor = $client
        ->selectDatabase('dbname')
        ->selectCollection('users');

    $result = $cursor->find();
    $docs = [];

    foreach ($result as $document) {

        $docs[] = [
            "id" => $document["_id"],
            "name" => $document["name"]
        ];

    }

    echo "<h1>Database read successful</h1>";
    var_dump($docs);

} catch (Exception $e) {
    echo "<h1>Exception</h1>";
    var_dump($e->getMessage());
}

phpinfo();
exit;
