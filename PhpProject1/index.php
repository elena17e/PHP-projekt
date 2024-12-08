<?php
$direktorij = getcwd();
$tekst = basename($_SERVER['PHP_SELF']);
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Početna stranica";

include './posebno/funkcije.php';
include "posebno/meni.php";


if(isset($_POST['uvijeti'])){
    setcookie("uvijeti", "Prihvaćeni uvijeti", time() + (86400 * 2), "/");
}

$veza = new Baza();
$veza->spojiDB();

$broj_stranica = $veza->selectDB('SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY proizvod.kolicina')->num_rows;

$stranica = isset($_GET['page']) && is_numeric($_GET['page']) ? $_GET['page'] : 1;

if(isset($_SESSION['korisnik'])){
   $id_upit = $veza->selectDB("SELECT konfiguracija_aplikacije_id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'");

    while ($red = mysqli_fetch_array($id_upit)) {
        $id_konfiguracije = $red["konfiguracija_aplikacije_id"];
    } 
}
else{
    $id_konfiguracije = 1;
}

$rezultati_upit = $veza->selectDB("SELECT broj_redaka_za_stanicenje FROM konfiguracija_aplikacije WHERE id = '$id_konfiguracije'");
 while ($red = mysqli_fetch_array($rezultati_upit)) {
        $rezultati_na_stranici = $red["broj_redaka_za_stanicenje"];
    }

$upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY proizvod.kolicina LIMIT ?,?";


if (isset($_GET['naziv'])) {
    if ($_GET['naziv'] == 'A') {
        $redovi = [];
        $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY kampanja.naziv ASC LIMIT ?,?";
       
    }
    if ($_GET['naziv'] == 'D') {
        $redovi = [];
        $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY kampanja.naziv DESC LIMIT ?,?";
        
    }
}
if (isset($_GET['kolicina'])) {
    if ($_GET['kolicina'] == 'A') {
        $redovi = [];
        $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY proizvod.kolicina ASC LIMIT ?,?";
        
    }
    if ($_GET['kolicina'] == 'D') {
        $redovi = [];
        $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id  ORDER BY proizvod.kolicina DESC LIMIT ?,?";
       
    }
}

if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id WHERE kampanja.datum_vrijeme_zavrsetka > '{$_GET['od']}' AND kampanja.datum_vrijeme_zavrsetka < '{$_GET['do']}' ORDER BY proizvod.kolicina LIMIT ?,?";
   
}
if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $upit = "SELECT kampanja.id, kampanja.naziv, kampanja.opis, kampanja.datum_vrijeme_pocetka, kampanja.datum_vrijeme_zavrsetka, proizvod.kolicina FROM kampanja LEFT JOIN kampanja_has_proizvod ON kampanja_has_proizvod.kampanja_id = kampanja.id LEFT JOIN proizvod ON kampanja_has_proizvod.proizvod_id = proizvod.id WHERE kampanja.datum_vrijeme_pocetka > '{$_GET['od']}' AND kampanja.datum_vrijeme_pocetka < '{$_GET['do']}' ORDER BY proizvod.kolicina LIMIT ?,?";
   
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
$smarty->assign("resetiraj", $_GET["uvijetiResetiraj"]);       
$smarty->assign("uvijeti", $_COOKIE['uvijeti']);
$smarty->display("index.tpl");
$smarty->display("podnozje.tpl");
?>
       
       
