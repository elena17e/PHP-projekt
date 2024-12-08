<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Proizvodi po moderatoru";

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
$upitpopuni = "SELECT proizvod.id, proizvod.korisnik_id  from proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = proizvod.id";
$rezultatpopuni = $veza->selectDB($upitpopuni);
while ($red = mysqli_fetch_array($rezultatpopuni)) {
    $moderator_id [] = $red["korisnik_id"];
}
if (isset($_GET['id'])) {
    if ($_GET['id'] == 'A') {
        $moderator_id = [];
        $upitsortiraj1A = "SELECT proizvod.id, proizvod.korisnik_id  from proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = proizvod.id ORDER BY proizvod.korisnik_id ASC";
        $rezultatsortiraj1A = $veza->selectDB($upitsortiraj1A);
        while ($red = mysqli_fetch_array($rezultatsortiraj1A)) {
             $moderator_id [] = $red["korisnik_id"];
        }
    }
    if ($_GET['id'] == 'D') {
        $moderator_id = [];
        $upitsortiraj1D = "SELECT proizvod.id, proizvod.korisnik_id  from proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = proizvod.id ORDER BY proizvod.korisnik_id DESC";
        $rezultatsortiraj1D = $veza->selectDB($upitsortiraj1D);
        while ($red = mysqli_fetch_array($rezultatsortiraj1D)) {
             $moderator_id [] = $red["korisnik_id"];
        }
    }
}
if (isset($_GET['filtriraj1'])) {
    $moderator_id = [];
    $upitfiltriraj = "SELECT proizvod.id, proizvod.korisnik_id  from proizvod RIGHT JOIN kupi_proizvod on kupi_proizvod.proizvod_id = proizvod.id WHERE proizvod.korisnik_id LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj = $veza->selectDB($upitfiltriraj);
    while ($red = mysqli_fetch_array($rezultatfiltriraj)) {
         $moderator_id [] = $red["korisnik_id"];
    }
}
$moderator_broj = array_count_values($moderator_id);

$ukupan_broj = array_sum($moderator_broj);


$veza->zatvoriDB();

$smarty->assign('red', $moderator_broj);
$smarty->assign('ukupan_broj', $ukupan_broj);
$smarty->display("kupljeni_proizvodi_po_moderatoru.tpl");
$smarty->display("podnozje.tpl");
?>