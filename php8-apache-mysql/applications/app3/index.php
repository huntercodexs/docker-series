<?php

$host = 'mysql-80';
$user = 'root';
$pass = 'root123';

$conn = new mysqli($host, $user, $pass);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "<h1>APP3: This is a page write by PHP8-APACHE + MYSQL !</h1>";
    echo "Connected to MySQL server successfully!";
}