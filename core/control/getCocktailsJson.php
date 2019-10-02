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

if(isset($_GET['zutaten'])) {

    $zutat = trim($mysqli->real_escape_string($_GET['zutaten']));
    $zutaten[] = array_diff(explode(",", $zutat),array(""));

    if(count($zutaten) > 0) {
        $sql = "SELECT C.CocktailID, C.Name, K.Kommentar, COUNT(*) AS 'Zutaten'
            FROM Cocktails C, Zutaten Z, ZutatZuCocktail ZZC, Kommentare K
            WHERE Z.ZutatID = ZZC.ZutatID
            AND C.CocktailID = ZZC.CocktailID
            AND K.CocktailID = C.CocktailID
            AND Z.ZutatID IN (".$zutat.")
            GROUP BY ZZC.CocktailID
            HAVING COUNT(*) > 0
            ORDER BY COUNT(*) DESC
            LIMIT 0,30";
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
                $row["Ranking"] = $row["Zutaten"]/$row["AnzahlZutaten"];
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
