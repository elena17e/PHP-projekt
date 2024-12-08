<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Definiraj uvijete";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"]) || !isset($_GET['id_proizvod'])) {
    header("Location: index.php");
    exit();
} elseif (isset($_SESSION["uloga"]) && $_SESSION["uloga"] > 2 || !isset($_GET['id_proizvod'])) {
    Sesija::obrisiSesiju();
    header("Location: index.php");
    exit();
}

$greska = "";
$poruka = "";

if (isset($_POST["submit"])) {
    $uzorak = "/^\S+.*$/";

    foreach ($_POST as $k => $v) {
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    if (empty($greska)) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "INSERT INTO uvijeti_i_cijena(`bodovi`,`cijena`) "
                . "values('" . $_POST["bodovi"]
                . "','" . $_POST["cijena"] . "');";
        
         $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
        $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
        while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', $upit);
        $radnja_id_dnevnik = "2";
        $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
        $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
        $vezadnevnik->zatvoriDB();

        $rezultat = $veza->selectDB($upit);

        $upit1 = "SELECT id from uvijeti_i_cijena WHERE bodovi = '{$_POST["bodovi"]}' AND cijena = '{$_POST["cijena"]}'";
        $rezultat1 = $veza->selectDB($upit1);
        while ($red = mysqli_fetch_array($rezultat1)) {
            $uvijeti_id = $red["id"];
        }

        $upit2 = "UPDATE proizvod SET uvijeti_i_cijena_id='{$uvijeti_id}' WHERE id='{$_GET['id_proizvod']}'";
        $rezultat2 = $veza->selectDB($upit2);
        
        $vezadnevnik1 = new Baza();
        $vezadnevnik1->spojiDB();
        $upit_dnevnik1 = str_replace('\'', '`', $upit2);
        $upitdnevnik1 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik1}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik1}');";
        $rezultatdnevnik1 = $vezadnevnik1->selectDB($upitdnevnik1);
        $vezadnevnik1->zatvoriDB();

        $veza->zatvoriDB();

        $poruka .= "Uvijeti su uspješno definirani!";
    }
}

$smarty->assign("greska", $greska);
$smarty->assign("poruka", $poruka);
$smarty->display("definiraj_uvijete.tpl");
$smarty->display("podnozje.tpl");
?>