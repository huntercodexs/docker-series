<?php

#################################################
# SQLITE DATABASE CONNECTION (LOCALHOST)
#################################################

//-- Firstly run the command bellow in the terminal to create an database: ex: sqlite.db
//-- root@c0b363cafda2:/# cd /opt/sqlite
//-- root@c0b363cafda2:/# sqlite3 dbname1.db
//-- SQLite version 3.31.1 2020-01-27 19:55:54
//-- Enter ".help" for usage hints.
//-- sqlite> CREATE TABLE customers(
//    --    ...>     id INT PRIMARY KEY NOT NULL UNIQUE,
//--    ...>     name TEXT NOT NULL
//--    ...> );
//-- sqlite> INSERT INTO customers(id, name) VALUES (1, 'Paloma dos Santos');
//-- sqlite> INSERT INTO customers(id, name) VALUES (2, 'Jaime dos Santos');
//-- sqlite> SELECT * FROM customers;
//-- 1|Paloma dos Santos|30|paloma@email.com
//-- 2|Jaime dos Santos|32|jaime@email.com
//-- sqlite>
//
//CREATE TABLE customers(
//    id INT PRIMARY KEY NOT NULL UNIQUE,
//    name TEXT NOT NULL
//);
//
//INSERT INTO customers(id, name) VALUES (1, 'John Smith Wiz');
//
//SELECT * FROM customers;
//
//DROP TABLE customers;

echo "Connecting...";

try {

    //driver:dbname[ip:port/service-name|container-name], username, password
    $con = new PDO("sqlite:/opt/sqlite/dbname1.db");

    echo "<h1>Connected Successful !</h1>";

    var_dump($con);

    $r = $con->query("SELECT * FROM customers")->fetchAll(PDO::FETCH_ASSOC);

    echo "<h1>Database Read Successful</h1>";

    var_dump('<pre>', $r, '</pre>');

} catch (PDOException $e) {

    $except = $e->getMessage();
    $error = "[PDOException:500]";
    $error .= "\nError: " . $except;

    if (preg_match('/could not find driver/', $except, $m, PREG_OFFSET_CAPTURE)) {
        $error .= "\nAvailable drivers: " . implode(", ", PDO::getAvailableDrivers());
    }

    var_dump($error);
}

phpinfo();
exit;