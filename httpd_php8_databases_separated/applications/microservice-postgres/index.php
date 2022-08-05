<?php

#################################################
# POSTGRES DATABASE CONNECTION
#################################################

echo "Connecting...";

try {

    $con = new PDO(
        "pgsql:host=postgres;dbname=postgres",
        "postgres",
        "123@Mudar#");

    echo "<h1>Connected Successful !</h1>";

    $r = $con->query("SELECT * FROM users")->fetchAll(PDO::FETCH_ASSOC);

    echo "<h1>Database Read Successful</h1>";
    var_dump($r);

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
