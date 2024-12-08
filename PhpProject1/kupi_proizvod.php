<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Kupi proizvod";

include './posebno/funkcije.php';
include "posebno/meni.php";

$greskaCijena = "";
$greskaBodovi = "";
$poruka = "";

if (!isset($_SESSION["uloga"])) {
    header("Location: index.php");
    exit();
}

$veza = new Baza();
$veza->spojiDB();

$upitKorisnik = "SELECT id from korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
$rezultatKorisnik = $veza->selectDB($upitKorisnik);
while ($red = mysqli_fetch_array($rezultatKorisnik)) {
    $korisnik_id = $red["id"];
}
$upitProfil = "SELECT * from profil WHERE profil.korisnik_id = '{$korisnik_id}'";
$rezultatProfil = $veza->selectDB($upitProfil);

$profil = false;
while ($red = mysqli_fetch_array($rezultatProfil)) {
    if ($red) {
        $profil = true;
    }
    $bodovi = $red["bodovi"];
}

if (!isset($_GET["id_proizvod"]) || !isset($_GET["id_uvijeti"]) || !$profil) {
    header("Location: index.php");
    exit();
}

$upitProizvod = "SELECT * from proizvod WHERE id = '{$_GET['id_proizvod']}'";
$rezultatProizvod = $veza->selectDB($upitProizvod);

while ($red = mysqli_fetch_array($rezultatProizvod)) {
    $cijena_proizvoda = $red["cijena"];
    $kolicina_proizvoda = $red["kolicina"];
    $bodovi_proizvoda = $red["bodovi"];
}

$upitUvijeti = "SELECT * from uvijeti_i_cijena WHERE id = '{$_GET['id_uvijeti']}'";
$rezultatUvijeti = $veza->selectDB($upitUvijeti);

while ($red = mysqli_fetch_array($rezultatUvijeti)) {
    $uvijeti_bodovi = $red["bodovi"];
    $uvijeti_cijena = $red["cijena"];
}

$veza->zatvoriDB();

if (isset($_POST['potvrdiK'])) {
    if ($_POST["cijena"] === "" || $_POST["cijena"] != $cijena_proizvoda) {
        $greskaCijena .= "Niste unijeli ispravnu cijenu proizvoda <br>";
    }
    if($kolicina_proizvoda === 0){
        $greskaCijena .= "Nema proizvoda na zalihi <br>";
    }
    if (empty($greskaCijena)) {
        $veza1 = new Baza();
        $veza1->spojiDB();

        $upitUnesi1 = "INSERT INTO kupi_proizvod(`cijena_proizvoda`,`korisnik_id`,`proizvod_id`) "
                . "values('" . $_POST["cijena"]
                . "','" . $korisnik_id
                . "','" . $_GET['id_proizvod'] . "');";
        $rezultatUnesi1 = $veza1->selectDB($upitUnesi1);
        
         $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
        $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
        while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', $upitUnesi1);
        $radnja_id_dnevnik = "2";
        $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
        $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
        $vezadnevnik->zatvoriDB();
 
        
        $upitazuriraj1 = "UPDATE proizvod SET kolicina = kolicina - 1 WHERE id='{$_GET['id_proizvod']}'";
        $rezultatazuriraj1 = $veza1->selectDB($upitazuriraj1);
        
        $vezadnevnik1 = new Baza();
        $vezadnevnik1->spojiDB();
        $upit_dnevnik1 = str_replace('\'', '`', $upitazuriraj1);
        $upitdnevnik1 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik1}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik1}');";
        $rezultatdnevnik1 = $vezadnevnik1->selectDB($upitdnevnik1);
        $vezadnevnik1->zatvoriDB();
 
        
        $upitazuriraj2 = "UPDATE proizvod SET status_proizvoda = 0 WHERE kolicina = 0";
        $rezultatazuriraj2 = $veza1->selectDB($upitazuriraj2);
        
        $vezadnevnik2 = new Baza();
        $vezadnevnik2->spojiDB();
        $upit_dnevnik2 = str_replace('\'', '`', $upitazuriraj2);
        $upitdnevnik2 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik2}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik2}');";
        $rezultatdnevnik2 = $vezadnevnik2->selectDB($upitdnevnik2);
        $vezadnevnik2->zatvoriDB();
        
        $upitazurirajProfil = "UPDATE profil SET bodovi = bodovi + '{$uvijeti_bodovi}' WHERE profil.korisnik_id = '{$korisnik_id}'";
       $rezultatazurirajProfil = $veza1->selectDB($upitazurirajProfil);
    
        $vezadnevnik3 = new Baza();
        $vezadnevnik3->spojiDB();
        $upit_dnevnik3 = str_replace('\'', '`', $upitazurirajProfil);
        $upitdnevnik3 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik3}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik3}');";
        $rezultatdnevnik3 = $vezadnevnik3->selectDB($upitdnevnik3);
        $vezadnevnik3->zatvoriDB();
       
        $veza1->zatvoriDB();
        $poruka = 'Uspješna kupnja!';
    }
}

if (isset($_POST['iskoristiBodove'])) {
    if ($bodovi_proizvoda > $bodovi) {
        $greskaBodovi .= "Niste unijeli ispravnu cijenu proizvoda <br>";
    }
    if($kolicina_proizvoda === 0){
        $greskaBodovi .= "Nema proizvoda na zalihi <br>";
    }
    if (empty($greskaBodovi)) {
          $veza2 = new Baza();
        $veza2->spojiDB();

        $upitUnesi2 = "INSERT INTO kupi_proizvod(`bodovi`,`korisnik_id`,`proizvod_id`) "
                . "values('" . $bodovi_proizvoda
                . "','" . $korisnik_id
                . "','" . $_GET['id_proizvod'] . "');";

        $rezultatUnesi2 = $veza2->selectDB($upitUnesi2);
        
         $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
        $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
        while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', $upitUnesi2);
        $radnja_id_dnevnik = "2";
        $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
        $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
        $vezadnevnik->zatvoriDB();
        
        $upitazuriraj3 = "UPDATE proizvod SET kolicina = kolicina - 1 WHERE id='{$_GET['id_proizvod']}'";
        $rezultatazuriraj3 = $veza2->selectDB($upitazuriraj3);
        
        $vezadnevnik2 = new Baza();
        $vezadnevnik2->spojiDB();
        $upit_dnevnik2 = str_replace('\'', '`', $upitazuriraj3);
        $upitdnevnik2 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik2}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik2}');";
        $rezultatdnevnik2 = $vezadnevnik2->selectDB($upitdnevnik2);
        $vezadnevnik2->zatvoriDB();
        
        $upitazurirajProfil1 = "UPDATE profil SET bodovi = bodovi - '{$uvijeti_cijena}' WHERE profil.korisnik_id = '{$korisnik_id}'";
        $rezultatazurirajProfil1 = $veza2->selectDB($upitazurirajProfil1);
        
        $vezadnevnik3 = new Baza();
        $vezadnevnik3->spojiDB();
        $upit_dnevnik3 = str_replace('\'', '`', $upitazurirajProfil1);
        $upitdnevnik3 = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik3}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik3}');";
        $rezultatdnevnik3 = $vezadnevnik3->selectDB($upitdnevnik3);
        $vezadnevnik3->zatvoriDB();
    
        $veza2->zatvoriDB();
        $poruka = 'Uspješna kupnja!'; 
    }
}

$smarty->assign("greskaCijena", $greskaCijena);
$smarty->assign("greskaBodovi", $greskaBodovi);
$smarty->assign("poruka", $poruka);
$smarty->display("kupi_proizvod.tpl");
$smarty->display("podnozje.tpl");
?>