<?php

#################################################
# FIREBIRD DATABASE CONNECTION
#################################################

//root@f6c930f8ed06:/etc/firebird/3.0# isql-fb
//Use CONNECT or CREATE DATABASE to specify a database
//
//SQL> CREATE DATABASE '/etc/firebird/3.0/databases/dbname1.fdb';
//SQL> CREATE TABLE customers (
//    id numeric(18,0) not null,
//    age integer,
//    email varchar(255),
//    name varchar(255),
//    primary key (id)
//);
//SQL> INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
//SQL> INSERT INTO customers (id, name, email, age) VALUES ('95734987', 'Mayra Smith Wiz', 'mayra@email.com', 35);
//SQL> COMMIT;
//SQL> SELECT * FROM customers;
//
//          ID NAME                EMAIL            AGE
//============ =================== ================ ============
//    94734987 John Smith Wiz      john@email.com   33
//    95734987 Mayra Smith Wiz     mayra@email.com  35
//
//SQL> QUIT;

echo "Connecting...";

try {

    $con = new PDO(
        "firebird:dbname=192.168.0.204:33050/etc/firebird/3.0/databases/dbname1.fdb",
        "SYSDBA",
        "123@fB$");

    echo "<h1>Connected Successful !</h1>";

    $r = $con->query("SELECT * FROM CUSTOMERS")->fetchAll(PDO::FETCH_ASSOC);

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
