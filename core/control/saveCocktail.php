<?php

require_once ('../secrets.php');
header('Content-type:application/json;charset=utf-8');
header("Access-Control-Allow-Origin: $cors");

require_once ('../mysql.php');


$cocktail = $_REQUEST['cocktail'];
$cocktail = json_decode($cocktail, true);

$usedPassword = $_POST['password'];

if ($usedPassword === $saveCocktailPassword) {

    if ($cocktail != null && $cocktail != "") {

        $Name = trim($mysqli->real_escape_string($cocktail['Name']));
        $Kommentar = trim($mysqli->real_escape_string($cocktail['Kommentar']));

        if (isset($Name) && $Name != "" && isset($Kommentar)  && $Kommentar != "") {

            $Zutaten = array($cocktail["Zutaten"]);

            $TitelArr = array_filter($Zutaten[0]["Titel"], 'strlen');
            $MengeArr = array_filter($Zutaten[0]["Menge"], 'strlen');

            if (count($TitelArr) > 1) {

                if (count($MengeArr) == count($TitelArr)) {

                    /* disable autocommit */
                    $mysqli->autocommit(FALSE);
                    $all_query_ok=true; // our control variable


                    $mysqli->query("INSERT INTO Cocktails (Name) VALUES ('".$Name."')") ? null : $all_query_ok=false;
                    $CocktailID = $mysqli->insert_id;

                    $mysqli->query("INSERT INTO Kommentare (Kommentar, CocktailID) VALUES ('".$Kommentar."', '".$CocktailID."')") ? null : $all_query_ok=false;
                    $KommentarID = $mysqli->insert_id;

                    if($all_query_ok) {
                        $mysqli->commit();

                        $i = 0;
                        foreach ($TitelArr as &$value) {

                            if (!empty($value)) {
                                $Titel = trim($mysqli->real_escape_string($value));
                                $Menge = trim($mysqli->real_escape_string($MengeArr[$i]));


                                $result = $mysqli->query("SELECT ZutatID FROM Zutaten WHERE Titel='".$Titel."' LIMIT 0,1");
                                $row_cnt = $result->num_rows;
                                if ($row_cnt == 0) {
                                    // first time created
                                    $mysqli->query("INSERT INTO Zutaten (Titel) VALUES ('".$Titel."')");
                                    $ZutatID = $mysqli->insert_id;
                                }else {
                                    $row = $result->fetch_assoc();
                                    $ZutatID = $row["ZutatID"];
                                }

                                $mysqli->query("INSERT INTO ZutatZuCocktail (ZutatID, CocktailID, Menge, Reihenfolge) VALUES ('".$ZutatID."', '".$CocktailID."', '".$Menge."', '".$i."')");
                                $ZutatZuCocktailID = $mysqli->insert_id;

                                $mysqli->commit();

                                $i++;
                            }
                        }
                        echo json_encode($cocktail);
                        exit;
                    }else{
                        $mysqli->rollback();
                        $error["error"] = "Fehler beim Anlegen des Cocktailnamen. Gibt es den schon?";
                    }
                }else{
                    $error["error"] = "Fehler: Ungleiche Anzahl an Zutaten und Mengen.";
                }
            }else{
                $error["error"] = "Mindestens zwei Zutaten eingeben.";
            }
        }else{
            $error["error"] = "Name und Kommentar/Beschreibung eingeben.";
        }
    }else{
        $error["error"] = "Falsche Parameter.";
    }
}else{
    $error["error"] = "Fehlerhafte Authentifizierung.";
}
echo json_encode($error);
