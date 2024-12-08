<?php
$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Otvorene Kampanje";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"])) {
    header("Location: index.php");
    exit();
}

$veza = new Baza();
$veza->spojiDB();

$datum_sad = date("Y.m.d. H:i:s", $vrijeme_sustava);

$upit ="SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}'";
$rezultat = $veza->selectDB($upit);
while ($red = mysqli_fetch_array($rezultat)) {
    $redovi[] = $red;
}

if (isset($_GET['naziv'])) {
    if ($_GET['naziv'] == 'A') {
        $redovi = [];
        $upitsortiraj1A = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' ORDER BY kampanja.naziv ASC";
        $rezultatsortiraj1A = $veza->selectDB($upitsortiraj1A);
        while ($red = mysqli_fetch_array($rezultatsortiraj1A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['naziv'] == 'D') {
        $redovi = [];
        $upitsortiraj1D = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' ORDER BY kampanja.naziv DESC";
        $rezultatsortiraj1D = $veza->selectDB($upitsortiraj1D);
        while ($red = mysqli_fetch_array($rezultatsortiraj1D)) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['id'])) {
    if ($_GET['id'] == 'A') {
        $redovi = [];
        $upitsortiraj2A = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' ORDER BY kampanja.id ASC";
        $rezultatsortiraj2A = $veza->selectDB($upitsortiraj2A);
        while ($red = mysqli_fetch_array($rezultatsortiraj2A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['id'] == 'D') {
        $redovi = [];
        $upitsortiraj2D = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' ORDER BY kampanja.id DESC";
        $rezultatsortiraj2D = $veza->selectDB($upitsortiraj2D);
        while ($red = mysqli_fetch_array($rezultatsortiraj2D)) {
            $redovi[] = $red;
        }
    }
}

if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $upitfiltriraj = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' AND kampanja.naziv LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj = $veza->selectDB($upitfiltriraj);
    while ($red = mysqli_fetch_array($rezultatfiltriraj)) {
        $redovi[] = $red;
    }
}

if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $upitfiltriraj1 = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka FROM kampanja WHERE kampanja.datum_vrijeme_zavrsetka > '{$datum_sad}' AND kampanja.datum_vrijeme_pocetka < '{$datum_sad}' AND kampanja.opis LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj1 = $veza->selectDB($upitfiltriraj1);
    while ($red = mysqli_fetch_array($rezultatfiltriraj1)) {
        $redovi[] = $red;
    }
}

$veza->zatvoriDB();

$smarty->assign('red', $redovi);
$smarty->display("otvorene_kampanje.tpl");
$smarty->display("podnozje.tpl");
?>

