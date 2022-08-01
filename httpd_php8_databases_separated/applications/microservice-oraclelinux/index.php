<?php

//phpinfo();exit;

#################################################
# ORACLE DATABASE CONNECTION
#################################################
try {

    //driver:dbname[ip:port/service-name|container-name], username, password
    //$con = new PDO("oci:dbname=//192.168.0.174:1521/ORCLPDB1", "devel", "oracle1Ipw");
    $con = new PDO("oci:dbname=//192.168.0.174:1521/ORCLPDB1.localdomain", "devel", "oracle1Ipw");
    var_dump($con);

    $r = $con->query("SELECT * FROM DEVEL.USERS u")->fetchAll(PDO::FETCH_ASSOC);
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

exit;
