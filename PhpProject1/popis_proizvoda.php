<?php
$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Popis proizvoda";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"])) {
    header("Location: index.php");
    exit();
} elseif (isset($_SESSION["uloga"]) && $_SESSION["uloga"] != 1) {
    Sesija::obrisiSesiju();
    header("Location: index.php");
    exit();
}

$veza = new Baza();
$veza->spojiDB();

$broj_stranica = $veza->selectDB('SELECT * FROM proizvod')->num_rows;

$stranica = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;

$id_upit = $veza->selectDB("SELECT konfiguracija_aplikacije_id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'");

    while ($red = mysqli_fetch_array($id_upit)) {
        $id_konfiguracije = $red["konfiguracija_aplikacije_id"];
    }

$rezultati_upit = $veza->selectDB("SELECT broj_redaka_za_stanicenje FROM konfiguracija_aplikacije WHERE id = '$id_konfiguracije'");
 while ($red = mysqli_fetch_array($rezultati_upit)) {
        $rezultati_na_stranici = $red["broj_redaka_za_stanicenje"];
    }
    

$upit = 'SELECT * FROM proizvod LIMIT ?,?';



if (isset($_GET['naziv'])) {
    if ($_GET['naziv'] == 'A') {
        $redovi = [];
        $upit = "SELECT * FROM proizvod ORDER BY naziv ASC LIMIT ?,?";
    }
    if ($_GET['naziv'] == 'D') {
        $redovi = [];
        $upit = "SELECT * FROM proizvod ORDER BY naziv DESC LIMIT ?,?";
    }
}
if (isset($_GET['kolicina'])) {
    if ($_GET['kolicina'] == 'A') {
        $redovi = [];
        $upit = "SELECT * FROM proizvod ORDER BY kolicina ASC LIMIT ?,?";
       
    }
    if ($_GET['kolicina'] == 'D') {
        $redovi = [];
        $upit = "SELECT * FROM proizvod ORDER BY kolicina DESC LIMIT ?,?";
      
}
}
if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $upit = "SELECT * FROM proizvod WHERE naziv LIKE '%{$_GET['trazi']}%' LIMIT ?,?";
   
}

if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $upit = "SELECT * FROM proizvod WHERE opis LIKE '%{$_GET['trazi']}%' LIMIT ?,?";
}

if ($stmt = $veza->spojiDB()->prepare($upit)) {
    $izracunaj_str = ($stranica - 1) * $rezultati_na_stranici;
    $stmt->bind_param('ii', $izracunaj_str, $rezultati_na_stranici);
    $stmt->execute();
    $rezultat = $stmt->get_result();
    $stmt->close();
}

while ($red = mysqli_fetch_array($rezultat)) {
    $redovi[] = $red;
}

$veza->zatvoriDB();

$smarty->assign('rezultati_na_stranici', $rezultati_na_stranici);
$smarty->assign('dohvati_str', $_GET['page']);
$smarty->assign('red', $redovi);
$smarty->assign('broj_stranica', $broj_stranica);
$smarty->assign('stranica', $stranica);
$smarty->display("popis_proizvoda.tpl");
$smarty->display("podnozje.tpl");
?>

