<?php
$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Opis i cijena proizvoda";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"]) || !isset($_GET["id_kampanja"])) {
    header("Location: index.php");
    exit();
}

$veza = new Baza();
$veza->spojiDB();


$upit = "SELECT proizvod.opis, proizvod.cijena, proizvod.kolicina, proizvod.id, proizvod.uvijeti_i_cijena_id, proizvod.naziv, proizvod.slika, proizvod.bodovi FROM proizvod LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id LEFT JOIN kampanja ON kampanja_has_proizvod.kampanja_id = kampanja.id WHERE kampanja.id = '{$_GET['id_kampanja']}' ";
$rezultat = $veza->selectDB($upit);
while ($red = mysqli_fetch_array($rezultat)) {
    $redovi[] = $red;
}
if (isset($_GET['opis'])) {
    if ($_GET['opis'] == 'A') {
        $redovi = [];
        $upitsortiraj1A = "SELECT proizvod.opis, proizvod.cijena, proizvod.kolicina, proizvod.id, proizvod.uvijeti_i_cijena_id, proizvod.naziv, proizvod.slika, proizvod.bodovi FROM proizvod LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id LEFT JOIN kampanja ON kampanja_has_proizvod.kampanja_id = kampanja.id WHERE kampanja.id = '{$_GET['id_kampanja']}'  ORDER BY proizvod.opis ASC";
        $rezultatsortiraj1A = $veza->selectDB($upitsortiraj1A);
        while ($red = mysqli_fetch_array($rezultatsortiraj1A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['opis'] == 'D') {
        $redovi = [];
        $upitsortiraj1D = "SELECT proizvod.opis, proizvod.cijena, proizvod.kolicina, proizvod.id, proizvod.uvijeti_i_cijena_id, proizvod.naziv, proizvod.slika, proizvod.bodovi FROM proizvod LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id LEFT JOIN kampanja ON kampanja_has_proizvod.kampanja_id = kampanja.id WHERE kampanja.id = '{$_GET['id_kampanja']}'  ORDER BY proizvod.opis DESC";
        $rezultatsortiraj1D = $veza->selectDB($upitsortiraj1D);
        while ($red = mysqli_fetch_array($rezultatsortiraj1D)) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['cijena'])) {
    if ($_GET['cijena'] == 'A') {
        $redovi = [];
        $upitsortiraj2A = "SELECT proizvod.opis, proizvod.cijena, proizvod.kolicina, proizvod.id, proizvod.uvijeti_i_cijena_id, proizvod.naziv, proizvod.slika, proizvod.bodovi FROM proizvod LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id LEFT JOIN kampanja ON kampanja_has_proizvod.kampanja_id = kampanja.id WHERE kampanja.id = '{$_GET['id_kampanja']}' ORDER BY proizvod.cijena ASC";
        $rezultatsortiraj2A = $veza->selectDB($upitsortiraj2A);
        while ($red = mysqli_fetch_array($rezultatsortiraj2A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['cijena'] == 'D') {
        $redovi = [];
        $upitsortiraj2D = "SELECT proizvod.opis, proizvod.cijena, proizvod.kolicina, proizvod.id, proizvod.uvijeti_i_cijena_id, proizvod.naziv, proizvod.slika, proizvod.bodovi FROM proizvod LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id LEFT JOIN kampanja ON kampanja_has_proizvod.kampanja_id = kampanja.id WHERE kampanja.id = '{$_GET['id_kampanja']}' ORDER BY proizvod.cijena DESC";
        $rezultatsortiraj2D = $veza->selectDB($upitsortiraj2D);
        while ($red = mysqli_fetch_array($rezultatsortiraj2D)) {
            $redovi[] = $red;
        }
    }
}

$veza->zatvoriDB();

$smarty->assign('session_uloga', $_SESSION["uloga"]);
$smarty->assign('id_kampanja', $_GET["id_kampanja"]);
$smarty->assign('red', $redovi);
$smarty->display("opis_cijena_proizvoda.tpl");
$smarty->display("podnozje.tpl");
?>