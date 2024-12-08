<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Zaključani računi";

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

$poruka = "";

$veza = new Baza();
$veza->spojiDB();


$stmt1 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0");
$stmt1->execute();
$rezultat = $stmt1->get_result();
while ($red = $rezultat->fetch_array()) {
    $redovi[] = $red;
}
if (isset($_GET['imeprezime'])) {
    if ($_GET['imeprezime'] == 'A') {
        $redovi = [];
        $stmt2 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0  ORDER BY ime_i_prezime ASC");
        $stmt2->execute();
        $rezultatsortiraj1A = $stmt2->get_result();
        while ($red = $rezultatsortiraj1A->fetch_array()) {
            $redovi[] = $red;
        }
    }
    if ($_GET['imeprezime'] == 'D') {
        $redovi = [];
        $stmt3 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0 ORDER BY ime_i_prezime DESC");
        $stmt3->execute();
        $rezultatsortiraj1D = $stmt3->get_result();
        while ($red = $rezultatsortiraj1D->fetch_array()) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['korime'])) {
    if ($_GET['korime'] == 'A') {
        $redovi = [];
        $stmt4 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0  ORDER BY korisnicko_ime ASC");
        $stmt4->execute();
        $rezultatsortiraj2A = $stmt4->get_result();
        while ($red = $rezultatsortiraj2A->fetch_array()) {
            $redovi[] = $red;
        }
    }
    if ($_GET['korime'] == 'D') {
        $redovi = [];
        $stmt5 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0  ORDER BY korisnicko_ime DESC");
        $stmt5->execute();
        $rezultatsortiraj2D = $stmt5->get_result();
        while ($red = $rezultatsortiraj2D->fetch_array()) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $trazi = mysqli_real_escape_string($veza->spojiDB(), $_GET['trazi']);
    $stmt6 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0 AND korisnicko_ime LIKE '%{$trazi}%'");
    $stmt6->execute();
    $rezultatfiltriraj = $stmt6->get_result();
    while ($red = $rezultatfiltriraj->fetch_array()) {
        $redovi[] = $red;
    }
}

if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $trazi1 = mysqli_real_escape_string($veza->spojiDB(), $_GET['trazi']);
    $stmt7 = $veza->spojiDB()->prepare("SELECT id, korisnicko_ime, ime_i_prezime, email, tip_id, broj_unosa FROM korisnik WHERE status_racuna = 0 AND ime_i_prezime LIKE '%{$trazi1}%'");
    $stmt7->execute();
    $rezultatfiltriraj1 = $stmt7->get_result();
    while ($red = $rezultatfiltriraj1->fetch_array()) {
        $redovi[] = $red;
    }
}

$stmt8 = $veza->spojiDB()->prepare("SELECT id from korisnik WHERE tip_id > 1 AND status_racuna = 1");
$stmt8->execute();
$rezultatdohvati = $stmt8->get_result();
while ($red = $rezultatdohvati->fetch_array()) {
    $redovi1[] = $red;
}

if (isset($_GET['id_otkljucaj'])) {
    $otkljucaj = mysqli_real_escape_string($veza->spojiDB(), $_GET['id_otkljucaj']);
    $stmt9 = $veza->spojiDB()->prepare("UPDATE korisnik SET status_racuna = 1 WHERE id= ?");
    $stmt9->bind_param("i", $otkljucaj);
    $stmt9->execute();
    $rezultatazuriraj = $stmt9->get_result();

    $vezadnevnik = new Baza();
    $vezadnevnik->spojiDB();
    $stmt10 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
    $stmt10->bind_param("s", $_SESSION['korisnik']);
    $stmt10->execute();
    $rezultatdohvatiKordnevnik = $stmt10->get_result();
    while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
        $korisnikdnevnik = $red["id"];
    }
    $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
    $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
    $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET status_racuna = 1 WHERE id= ?");
    $radnja_id_dnevnik = "2";
    $stmt11 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
    $stmt11->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
    $stmt11->execute();
    $rezultatdnevnik = $stmt11->get_result();
    $vezadnevnik->zatvoriDB();
}
if (isset($_POST['blokiraj'])) {
    $stmt12 = $veza->spojiDB()->prepare("UPDATE korisnik SET status_racuna = 0 WHERE id= ? ");
    $stmt12->bind_param("i",  $_POST['korisnik']);
    $stmt12->execute();
    $rezultatazuriraj1 = $stmt12->get_result();
    $poruka .= "Korisnik je uspješno blokiran!";
    $vezadnevnik = new Baza();
    $vezadnevnik->spojiDB();
    $stmt13 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
    $stmt13->bind_param("s", $_SESSION['korisnik']);
    $stmt13->execute();
    $rezultatdohvatiKordnevnik = $stmt13->get_result();
    while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
        $korisnikdnevnik = $red["id"];
    }
    $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
    $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
    $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET status_racuna = ? WHERE id= ? ");
    $radnja_id_dnevnik = "2";
    $stmt14 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
    $stmt14->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
    $stmt14->execute();
    $rezultatdnevnik = $stmt14->get_result();
    $vezadnevnik->zatvoriDB();
}


$veza->zatvoriDB();

$smarty->assign('red',$redovi);
$smarty->assign('red1', $redovi1);
$smarty->assign('poruka', htmlspecialchars($poruka, ENT_COMPAT, 'UTF-8'));
$smarty->display("zakljucani_racuni.tpl");
$smarty->display("podnozje.tpl");
?>