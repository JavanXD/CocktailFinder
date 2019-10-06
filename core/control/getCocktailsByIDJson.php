<?php

if(isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
    if(strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) < time() - 600) {
        header('HTTP/1.1 304 Not Modified');
        exit;
    }
}
require_once ('../secrets.php');
header('Content-type:application/json;charset=utf-8');
header("Access-Control-Allow-Origin: " . CORS);

require_once ('../mysql.php');

if(isset($_GET['cocktails'])) {

    $cocktails = trim($mysqli->real_escape_string($_GET['cocktails']));
    $cocktailsArr[] = array_diff(explode(",", $cocktails),array(""));

    if (count($cocktailsArr) > 0) {
        $sql = "SELECT C.CocktailID, C.Name, K.Kommentar
            FROM Cocktails AS C, Kommentare AS K
            WHERE K.CocktailID = C.CocktailID
            AND C.CocktailID IN (".$cocktails.")";
        $result = $mysqli->query($sql);

        $list = Array();
        $row_zutaten = Array();

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                // hol zum Cocktail noch mehr Infos
                $sql = 'SELECT Z.ZutatID, Z.Titel, ZZC.Menge
                        FROM Cocktails C, Zutaten Z, ZutatZuCocktail ZZC
                        WHERE Z.ZutatID = ZZC.ZutatID
                        AND C.CocktailID = ZZC.CocktailID
                        AND C.CocktailID = "' . $row['CocktailID'] . '"
                        ORDER BY ZZC.Reihenfolge ASC';
                $result_product = $mysqli->query($sql);
                while ($row_zutat = $result_product->fetch_assoc()) {
                    $row_zutaten[] = $row_zutat;
                }
                // erweitere Array
                $row["AnzahlZutaten"] = count($row_zutaten);
                $row["zutaten"] = $row_zutaten;
                unset($row_zutaten);

                // füge erweiterten Cocktail der Liste hinzu
                $list[] = $row;
            }

            echo json_encode($list);
            exit;
        } else {
            $error["error"] = "Empty.";
        }
    }else{
        $error["error"] = "Keine Zutat = Alle";
    }
}else{
    $error["error"] = "Falscher Parameter.";
}
echo json_encode( $error );
