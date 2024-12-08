<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Proizvodi po kampanji";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"])) {
    header("Location: index.php");
    exit();
} elseif (isset($_SESSION["uloga"]) && $_SESSION["uloga"] > 2) {
    Sesija::obrisiSesiju();
    header("Location: index.php");
    exit();
}

$veza = new Baza();
$veza->spojiDB();
$upitpopuni = "SELECT kampanja_has_proizvod.kampanja_id, kampanja_has_proizvod.proizvod_id as proizvod, kupi_proizvod.proizvod_id as proizvod_id from kampanja_has_proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = kampanja_has_proizvod.proizvod_id";
$rezultatpopuni = $veza->selectDB($upitpopuni);
while ($red = mysqli_fetch_array($rezultatpopuni)) {
    $kampanja_id [] = $red["kampanja_id"];
}
if (isset($_GET['id'])) {
    if ($_GET['id'] == 'A') {
        $kampanja_id = [];
        $upitsortiraj1A = "SELECT kampanja_has_proizvod.kampanja_id, kampanja_has_proizvod.proizvod_id as proizvod, kupi_proizvod.proizvod_id as proizvod_id from kampanja_has_proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = kampanja_has_proizvod.proizvod_id ORDER BY kampanja_has_proizvod.kampanja_id ASC";
        $rezultatsortiraj1A = $veza->selectDB($upitsortiraj1A);
        while ($red = mysqli_fetch_array($rezultatsortiraj1A)) {
             $kampanja_id [] = $red["kampanja_id"];
        }
    }
    if ($_GET['id'] == 'D') {
        $kampanja_id = [];
        $upitsortiraj1D = "SELECT kampanja_has_proizvod.kampanja_id, kampanja_has_proizvod.proizvod_id as proizvod, kupi_proizvod.proizvod_id as proizvod_id from kampanja_has_proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = kampanja_has_proizvod.proizvod_id ORDER BY kampanja_has_proizvod.kampanja_id DESC";
        $rezultatsortiraj1D = $veza->selectDB($upitsortiraj1D);
        while ($red = mysqli_fetch_array($rezultatsortiraj1D)) {
             $kampanja_id [] = $red["kampanja_id"];
        }
    }
}
if (isset($_GET['filtriraj1'])) {
    $kampanja_id = [];
    $upitfiltriraj = "SELECT kampanja_has_proizvod.kampanja_id, kampanja_has_proizvod.proizvod_id as proizvod, kupi_proizvod.proizvod_id as proizvod_id from kampanja_has_proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = kampanja_has_proizvod.proizvod_id WHERE kampanja_has_proizvod.kampanja_id LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj = $veza->selectDB($upitfiltriraj);
    while ($red = mysqli_fetch_array($rezultatfiltriraj)) {
         $kampanja_id [] = $red["kampanja_id"];
    }
}
$kampanja_broj = array_count_values($kampanja_id);

$ukupan_broj = array_sum($kampanja_broj);
$veza->zatvoriDB();

$smarty->assign('red', $kampanja_broj);
$smarty->assign('ukupan_broj', $ukupan_broj);
$smarty->display("kupljeni_proizvodi_po_kampanji.tpl");
$smarty->display("podnozje.tpl");
?>