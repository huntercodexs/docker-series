<?php

#################################################
# POSTGRES DATABASE CONNECTION
#################################################

//CREATE TABLE customers (
//    id serial NOT NULL,
//    name VARCHAR(250) NOT NULL,
//    email VARCHAR(250) NOT NULL,
//    age INTEGER,
//    PRIMARY KEY (id)
//);
//
//INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
//INSERT INTO customers (id, name, email, age) VALUES ('12734983', 'Solange Smart Wow', 'sol@email.com', 34);
//SELECT * FROM customers;

echo "Connecting...";

try {

    $con = new PDO(
        "pgsql:host=postgres;dbname=postgres",
        "postgres",
        "123@Mudar#");

    echo "<h1>Connected Successful !</h1>";

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
