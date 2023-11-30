<?php

#################################################
# MSSQL DATABASE CONNECTION
#################################################

//CREATE TABLE demo.dbo.customers (
//    id bigint IDENTITY(1,1) NOT NULL,
//    name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
//    email varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
//    age int NULL,
//    CONSTRAINT PK__customer__3213E83F145A0C82 PRIMARY KEY (id)
//);
//
//INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
//INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);

echo "Connecting...";

try {

    //driver:dbname[ip:port/service-name|container-name], username, password
    $con = new PDO("sqlsrv:Server=192.168.0.204;Database=master", "SA", "123@Mudar#");

    echo "<h1>Connected Successful !</h1>";

    var_dump($con);

    $r = $con->query("SELECT * FROM demo.dbo.customers")->fetchAll(PDO::FETCH_ASSOC);

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
