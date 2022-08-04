<?php

#################################################
# ORACLE DATABASE CONNECTION
#################################################

try {

    /**
     * Note: In this case the server database is working in another machine in a docker container
     * that is called oraclelinux
    */
    //driver:dbname[ip:port/service-name|container-name], username, password
    $con = new PDO("oci:dbname=oraclelinux:1521/ORCLPDB1", "DEVEL", "oracle1Ipw");
    var_dump($con);

    $r = $con->query("SELECT * FROM ALL_USERS au")->fetchAll(PDO::FETCH_ASSOC);
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
