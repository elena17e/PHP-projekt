<?php

$direktorij = getcwd();
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Kreiraj proizvod";

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
$poruka1 = "";
$greska1 = "";
$status = true;

$veza1 = new Baza();
$veza1->spojiDB();

$upitdohvati = "SELECT id from uvijeti_i_cijena";
$rezultatdohvati = $veza1->selectDB($upitdohvati);
while ($red = mysqli_fetch_array($rezultatdohvati)) {
    $redovi[] = $red;
}
$upitdohvati1 = "SELECT id from korisnik WHERE tip_id = 2";
$rezultatdohvati1 = $veza1->selectDB($upitdohvati1);
while ($red = mysqli_fetch_array($rezultatdohvati1)) {
    $redovi1[] = $red;
}
$upitdohvati2 = "SELECT id from korisnik WHERE tip_id > 2";
$rezultatdohvati2 = $veza1->selectDB($upitdohvati2);
while ($red = mysqli_fetch_array($rezultatdohvati2)) {
    $redovi2[] = $red;
}
$veza1->zatvoriDB();

if (isset($_POST["submit"])) {
    $userfile = $_FILES['slika']['tmp_name'];
    $userfile_name = $_FILES['slika']['name'];
    $userfile_size = $_FILES['slika']['size'];
    $userfile_type = $_FILES['slika']['type'];
    $userfile_error = $_FILES['slika']['error'];
    if ($userfile_error > 0) {
        switch ($userfile_error) {
            case 1: $greska1 .= "Problem: Veličina veća od " . ini_get('upload_max_filesize') . "<br>";
                break;
            case 2: $greska1 .= "Problem: Veličina veća od {$_POST["MAX_FILE_SIZE"]} B <br>";
                break;
            case 3: $greska1 .= "Problem: Datoteka djelomično prenesena <br>";
                break;
            case 4: $greska1 .= "Problem: Datoteka nije prenesena <br>";
                break;
        }
    }


    $upfile = 'multimedija/' . $userfile_name;

    if (empty($greska1)) {
        if (is_uploaded_file($userfile)) {
            if (!move_uploaded_file($userfile, $upfile)) {
                $greska .= "Problem: nije moguće prenijeti datoteku na odredište <br>";
            }
        } else {
            $greska .= "Problem: mogući napad prijenosom. Datoteka:  $userfile_name <br>";
        }
    }
    $uzorak = "/^\S+.*$/";

    foreach ($_POST as $k => $v) {
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    if (empty($greska) && empty($greska1) && !isset($_GET["id"])) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "INSERT INTO proizvod(`naziv`,`opis`,`slika`,`kolicina`,`cijena`,`status_proizvoda`,`bodovi`,"
                . "`korisnik_id`,`uvijeti_i_cijena_id`,`name`,`description`,`picture`) "
                . "values('" . $_POST["naziv"]
                . "','" . $_POST["opis"]
                . "','" . $upfile
                . "','" . $_POST["kolicina"]
                . "','" . $_POST["cijena"]
                . "','" . $_POST["status"]
                . "','" . $_POST["bodovi"]
                . "','" . $_POST["korisnik_id"]
                . "','" . $_POST["uvijeti_i_cijena"]
                . "','" . $_POST["naziv"]
                . "','" . $_POST["opis"]
                . "','" . $upfile . "');";

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

        $poruka .= "Proizvod je uspješno kreiran!";
    }
}
if (isset($_GET["id"])) {

    $veza2 = new Baza();
    $veza2->spojiDB();
    $upitpopuni = "SELECT * FROM `proizvod` WHERE "
            . "`id`= {$_GET['id']}";
    $rezultatpopuni = $veza2->selectDB($upitpopuni);
    while ($red = mysqli_fetch_array($rezultatpopuni)) {
        $naziv_proizvoda = $red["naziv"];
        $opis = $red["opis"];
        $slika = $red["slika"];
        $kolicina = $red["kolicina"];
        $cijena = $red["cijena"];
        $bodovi = $red["bodovi"];
        $korisnik_id = $red["korisnik_id"];
        $uvijeti_i_cijena = $red["uvijeti_i_cijena_id"];
    }
    if ($kolicina == 0) {
        $status = false;
    }

    if (isset($_POST["submit"]) && empty($greska)) {

        $upitazuriraj2 = "UPDATE proizvod SET naziv='{$_POST['naziv']}', opis='{$_POST['opis']}', slika='{$_POST['slika']}', kolicina='{$_POST['kolicina']}', cijena='{$_POST['cijena']}', status_proizvoda='{$_POST['status']}', bodovi='{$_POST['bodovi']}', korisnik_id='{$_POST['korisnik_id']}', uvijeti_i_cijena_id='{$_POST['uvijeti_i_cijena']}', name='{$_POST['naziv']}', description='{$_POST['opis']}', picture='{$_POST['slika']}' WHERE id={$_GET['id']}";
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

        header("Location: popis_proizvoda.php");
        exit();
    }

    $veza2->zatvoriDB();
}

if (isset($_POST['dodijeli'])) {
    $veza3 = new Baza();
    $veza3->spojiDB();
    $upitdodijeli = "UPDATE korisnik SET tip_id='2' WHERE id={$_POST['korisnik_moderator']}";
    $rezultatdodijeli = $veza3->selectDB($upitdodijeli);
    $veza3->zatvoriDB();

    $vezadnevnik = new Baza();
    $vezadnevnik->spojiDB();
    $upitdohvatiKordnevnik = "SELECT id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
    $rezultatdohvatiKordnevnik = $vezadnevnik->selectDB($upitdohvatiKordnevnik);
    while ($red = mysqli_fetch_array($rezultatdohvatiKordnevnik)) {
        $korisnikdnevnik = $red["id"];
    }
    $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
    $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
    $upit_dnevnik = str_replace('\'', '`', $upitdodijeli);
    $radnja_id_dnevnik = "2";
    $upitdnevnik = "INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, '{$datum_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}', '{$korisnikdnevnik}', '{$radnja_id_dnevnik}', '{$radnja_dnevnik}', '{$upit_dnevnik}');";
    $rezultatdnevnik = $vezadnevnik->selectDB($upitdnevnik);
    $vezadnevnik->zatvoriDB();

    $poruka1 .= "Moderator je uspješno dodijeljen!";
}


$smarty->assign("id", $_GET['id']);
$smarty->assign("greska1", $greska1);
$smarty->assign("greska", $greska);
$smarty->assign("poruka", $poruka);
$smarty->assign("poruka1", $poruka1);
$smarty->assign("naziv_proizvoda", $naziv_proizvoda);
$smarty->assign("opis", $opis);
$smarty->assign("slika", $slika);
$smarty->assign("kolicina", $kolicina);
$smarty->assign("cijena", $cijena);
$smarty->assign("status", $status);
$smarty->assign("bodovi", $bodovi);
$smarty->assign("korisnik_id", $korisnik_id);
$smarty->assign("uvijeti_i_cijena", $uvijeti_i_cijena);
$smarty->assign('red', $redovi);
$smarty->assign('red1', $redovi1);
$smarty->assign('red2', $redovi2);
$smarty->display("kreiraj_proizvod.tpl");
$smarty->display("podnozje.tpl");
?>