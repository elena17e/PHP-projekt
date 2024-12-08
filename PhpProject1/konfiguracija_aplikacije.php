<?php
$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Konfiguracija aplikacije";

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

$greska = "";
$poruka = "";

if($_POST["odabir"] == "staro"){
    $veza2 = new Baza();
    $veza2->spojiDB();
    $upitdohvati2 = "SELECT id from `konfiguracija_aplikacije`";
$rezultatdohvati2 = $veza2->selectDB($upitdohvati2);
while ($red = mysqli_fetch_array($rezultatdohvati2)) {
    $redovi[] = $red;
}
  $veza2->zatvoriDB();   
   
}

if(isset($_POST["id_konfiguracija"])){
        $veza2 = new Baza();
    $veza2->spojiDB();
    $upitdohvati = "SELECT * FROM `konfiguracija_aplikacije` WHERE `id`= {$_POST['id_konfiguracije']}";
    $rezultdohvati = $veza2->selectDB($upitdohvati);
    while ($red = mysqli_fetch_array($rezultdohvati)) {
        $kolacici = $red["trajanje_kolacica"];
        $stranicenje = $red["broj_redaka_za_stanicenje"];
        $sesija = $red["trajanje_sesije"];
        $prijava = $red["broj_neuspjesnih_prijava"];
    }
    
    $upitazuriraj = "UPDATE konfiguracija_aplikacije SET status_konfiguracije='izmjena', configuration_status='edit' WHERE id={$_POST['id_konfiguracije']}";
    $rezultazuriraj = $veza2->selectDB($upitazuriraj);
    $veza2->zatvoriDB();
}

if (isset($_POST["konfiguriraj"])) {

    $uzorak = "/^\S+.*$/";

    foreach ($_POST as $k => $v) {
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    if (empty($greska)) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "INSERT INTO `konfiguracija_aplikacije` (`id`, `trajanje_kolacica`, `broj_redaka_za_stanicenje`, `trajanje_sesije`, `broj_neuspjesnih_prijava`, `status_konfiguracije`, `configuration_status`) VALUES (NULL, '{$_POST["kolacici"]}', '{$_POST["stranicenje"]}', '{$_POST["sesija"]}', '{$_POST["prijava"]}', 'normalno', 'normal');";

        $rezultat = $veza->selectDB($upit);
        $veza->zatvoriDB();
        
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
        
         $poruka .= "Aplikacija je uspješno konfigurirana!";
        
    }
}
if (isset($_POST["uredi_konfiguraciju"])) {

    $uzorak = "/^\S+.*$/";

    foreach ($_POST as $k => $v) {
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    if (empty($greska)) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "UPDATE konfiguracija_aplikacije SET trajanje_kolacica='{$_POST['kolacici']}', broj_redaka_za_stanicenje='{$_POST['stranicenje']}', trajanje_sesije='{$_POST['sesija']}', broj_neuspjesnih_prijava='{$_POST['prijava']}', status_konfiguracije='normalno', configuration_status='normal' WHERE id={$_POST['id_konf']}";

        $rezultat = $veza->selectDB($upit);
        $veza->zatvoriDB();
        
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
        
         $poruka .= "Aplikacija je uspješno konfigurirana!";
        
    }
}

$smarty->assign('red', $redovi);
$smarty->assign("radnja", $_POST["odabir"]);
$smarty->assign("id_konfiguracija", $_POST['id_konfiguracije']);
$smarty->assign("kolacici", $kolacici);
$smarty->assign("stranicenje", $stranicenje);
$smarty->assign("sesija", $sesija);
$smarty->assign("prijava", $prijava);
$smarty->assign("greska", $greska);
$smarty->assign("poruka", $poruka);
$smarty->display("konfiguracija_aplikacije.tpl");
$smarty->display("podnozje.tpl");
?>
