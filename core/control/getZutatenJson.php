<?php

if(isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
    if(strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) < time() - 600) {
        header('HTTP/1.1 304 Not Modified');
        exit;
    }
}

require_once ('../secrets.php');
header('Content-type:application/json;charset=utf-8');
header("Access-Control-Allow-Origin: $cors");

require_once ('../mysql.php');


$sql = "SELECT ZutatID AS 'value', Titel AS 'text', KategorieID AS 'kategorie'
        FROM Zutaten
        ORDER BY ZutatID ASC";
$result = $mysqli->query($sql);

$list = Array();

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {

        $list[] = $row;
    }
    echo json_encode($list);

} else {
    $error["error"] = "Empty.";
    echo json_encode( $error );
}

