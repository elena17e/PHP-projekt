<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Kreiraj Kampanju";

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

$greska = "";
$poruka = "";

if (isset($_POST["submit"])) {
    $uzorak = "/^\S+.*$/";

    foreach ($_POST as $k => $v) {
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    if (empty($greska) && !isset($_GET["id"])) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "INSERT INTO kampanja(`naziv`,`opis`,`datum_vrijeme_pocetka`,"
                . "`datum_vrijeme_zavrsetka`,`name`,`description`) "
                . "values('" . $_POST["naziv"]
                . "','" . $_POST["opis"]
                . "','" . $_POST["pocetak"]
                . "','" . $_POST["zavrsetak"]
                . "','" . $_POST["naziv"]
                . "','" . $_POST["opis"] . "');";

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

        $poruka .= "Kampanja je uspješno kreirana!";
    }
}
if (isset($_GET["id"])) {
    $greskaP = "";
    $porukaP = "";

    $veza2 = new Baza();
    $veza2->spojiDB();
    $upitpopuni = "SELECT * FROM `kampanja` WHERE "
            . "`id`= {$_GET['id']}";
    $rezultatpopuni = $veza2->selectDB($upitpopuni);
    while ($red = mysqli_fetch_array($rezultatpopuni)) {
        $naziv_kampanje = $red["naziv"];
        $opis = $red["opis"];
        $pocetak = $red["datum_vrijeme_pocetka"];
        $zavrsetak = $red["datum_vrijeme_zavrsetka"];
    }

    if (isset($_POST["submit"]) && empty($greska)) {

        $upitazuriraj2 = "UPDATE kampanja SET naziv='{$_POST['naziv']}', opis='{$_POST['opis']}', datum_vrijeme_pocetka='{$_POST['pocetak']}', datum_vrijeme_zavrsetka='{$_POST['zavrsetak']}', name='{$_POST['naziv']}', description='{$_POST['opis']}' WHERE id={$_GET['id']}";
        $rezultatazuriraj2 = $veza2->selectDB($upitazuriraj2);

        $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
        $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
        while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', $upitazuriraj2);
        $radnja_id_dnevnik = "2";
        $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
        $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
        $vezadnevnik->zatvoriDB();

        header("Location: popis_kampanja.php");
        exit();
    }
    $upitKorisnik = "SELECT id from korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
    $rezultatKorisnik = $veza2->selectDB($upitKorisnik);
    while ($red = mysqli_fetch_array($rezultatKorisnik)) {
        $korisnik_id = $red["id"];
    }

    $upitpridruzi = "SELECT id, opis FROM proizvod WHERE korisnik_id = '{$korisnik_id}'";
    $rezultatpridruzi = $veza2->selectDB($upitpridruzi);
    while ($red = mysqli_fetch_array($rezultatpridruzi)) {
        $redovi[] = $red;
    }
    if (isset($_POST['pridruzi'])) {
        if ($_POST['id_kampanje'] === "") {
            $greskaP .= "Nije popunjeno: Id kampanje <br>";
        }
        if ($_POST['opis_proizvoda'] === "") {
            $greskaP .= "Nije popunjeno: Opis proizvoda <br>";
        }

        if (empty($greskaP)) {



            $upitkampanjaproizvod = "INSERT INTO kampanja_has_proizvod(`kampanja_id`,`proizvod_id`) "
                    . "values('" . $_POST["id_kampanje"]
                    . "','" . $_POST["opis_proizvoda"] . "');";

            $rezultatkampanjaproizvod = $veza2->selectDB($upitkampanjaproizvod);
            $porukaP .= "Kampanji je uspješno pridružen proizvod!";

            $vezadnevnik = new Baza();
            $vezadnevnik->spojiDB();
            $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
            $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
            while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
                $korisnikdnevnik = $red["id"];
            }
            $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
            $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
            $upit_dnevnik = str_replace('\'', '`', $upitkampanjaproizvod);
            $radnja_id_dnevnik = "2";
            $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
            $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
            $vezadnevnik->zatvoriDB();
        }
    }
    $veza2->zatvoriDB();

    $datumpocetka = date('Y-m-d\TH:i', strtotime($pocetak));
    $datumzavrsetka = date('Y-m-d\TH:i', strtotime($zavrsetak));
}


$smarty->assign("id", $_GET['id']);
$smarty->assign("greska", $greska);
$smarty->assign("poruka", $poruka);
$smarty->assign("greskaP", $greskaP);
$smarty->assign("porukaP", $porukaP);
$smarty->assign("naziv_kampanje", $naziv_kampanje);
$smarty->assign("opis", $opis);
$smarty->assign("datumpocetka", $datumpocetka);
$smarty->assign("datumzavrsetka", $datumzavrsetka);
$smarty->assign('red', $redovi);
$smarty->display("kreiraj_kampanju.tpl");
$smarty->display("podnozje.tpl");
?>
