<?php

require_once ('../secrets.php');
header('Content-type:application/json;charset=utf-8');
header("Access-Control-Allow-Origin: $cors");

require_once ('../mysql.php');


$sql = "SELECT Titel AS 'text'
        FROM Zutaten
        ORDER BY ZutatID ASC";
$result = $mysqli->query($sql);

$list = Array();

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {

        $list[] = $row["text"];
    }
    echo json_encode($list);

}
