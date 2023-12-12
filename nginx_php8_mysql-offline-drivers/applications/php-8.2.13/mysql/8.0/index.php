
<?php

#################################################
# MYSQL80 DATABASE CONNECTION
#################################################

echo "PHP-8.2.13 and MYSQL-8.0 is Connecting...";

try {

    //driver:dbname[ip:port/service-name|container-name], username, password
    $con = new PDO("mysql:host=192.168.0.204:3708;dbname=database", "root", "root123");

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