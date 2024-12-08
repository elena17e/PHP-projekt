<?php

$direktorij = dirname(getcwd());
$putanja = dirname(dirname($_SERVER['REQUEST_URI']));
$naziv = "Korisnici";

include "../posebno/funkcije.php";
include "../posebno/meni.php";

$veza = new Baza();
$veza->spojiDB();

$broj_stranica = $veza->selectDB('SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id')->num_rows;

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

$upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id LIMIT ?,?";


if (isset($_GET['nadimak'])) {
    if ($_GET['nadimak'] == 'A') {
        $redovi = [];
        $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id  ORDER BY profil.nadimak ASC LIMIT ?,?";
       
    }
    if ($_GET['nadimak'] == 'D') {
        $redovi = [];
        $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id  ORDER BY profil.nadimak DESC LIMIT ?,?";
       
    }
}
if (isset($_GET['korime'])) {
    if ($_GET['korime'] == 'A') {
        $redovi = [];
        $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id  ORDER BY korisnik.korisnicko_ime ASC LIMIT ?,?";
      
    }
    if ($_GET['korime'] == 'D') {
        $redovi = [];
        $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id  ORDER BY korisnik.korisnicko_ime DESC LIMIT ?,?";
        
    }
}

if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id WHERE korisnik.korisnicko_ime LIKE '%{$_GET['trazi']}%' LIMIT ?,?";
   
}

if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $upit = "SELECT korisnik.id, korisnik.korisnicko_ime, korisnik.ime_i_prezime, korisnik.email, korisnik.lozinka, korisnik.tip_id, profil.nadimak FROM korisnik INNER JOIN profil ON profil.korisnik_id = korisnik.id WHERE profil.nadimak LIKE '%{$_GET['trazi']}%' LIMIT ?,?";
  
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
$smarty->display("korisnici.tpl");
$smarty->display("podnozje.tpl");
?>

