<?php

require_once ('secrets.php');

$mysqli = mysqli_connect($host, $user, $password, $database, 3306);
unset ($user, $password);

// Check connection
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit;
}

/* change character set to utf8 */
if (!$mysqli->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $mysqli->error);
    exit();
}

function close_mysql($mysqli)
{
    $mysqli->close();
}
register_shutdown_function('close_mysql', $mysqli);
