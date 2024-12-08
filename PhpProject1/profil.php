<?php

$direktorij = getcwd();
$tekst = basename($_SERVER['PHP_SELF']);
$putanja = dirname($_SERVER['REQUEST_URI']);
$naziv = "Profil";

include './posebno/funkcije.php';
include "posebno/meni.php";

if (!isset($_SESSION["uloga"])) {
    header("Location: index.php");
    exit();
}


$greska1 = "";
$greska = "";

$veza1 = new Baza();
$veza1->spojiDB();

$upitKorisnik = "SELECT id from korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
$rezultatKorisnik = $veza1->selectDB($upitKorisnik);
while ($red = mysqli_fetch_array($rezultatKorisnik)) {
    $korisnik_id = $red["id"];
}
$upitProfil = "SELECT * from profil WHERE profil.korisnik_id = '{$korisnik_id}'";
$rezultatProfil = $veza1->selectDB($upitProfil);

$profil = false;
while ($red = mysqli_fetch_array($rezultatProfil)) {
   if($red){
    $profil = true;
   }
      $bodovi = $red["bodovi"];
      $profilna = $red["slika"];
      $nadimak = $red["nadimak"];
}

$upitProizvodi = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}'";
$rezultatProizvodi = $veza1->selectDB($upitProizvodi);
while ($red = mysqli_fetch_array($rezultatProizvodi)) {
    $redovi[] = $red;
}
if (isset($_GET['naziv'])) {
    if ($_GET['naziv'] == 'A') {
        $redovi = [];
        $upitsortiraj1A = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' ORDER BY proizvod.naziv ASC";
        $rezultatsortiraj1A = $veza1->selectDB($upitsortiraj1A);
        while ($red = mysqli_fetch_array($rezultatsortiraj1A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['naziv'] == 'D') {
        $redovi = [];
        $upitsortiraj1D = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' ORDER BY proizvod.naziv DESC";
        $rezultatsortiraj1D = $veza1->selectDB($upitsortiraj1D);
        while ($red = mysqli_fetch_array($rezultatsortiraj1D)) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['cijena'])) {
    if ($_GET['cijena'] == 'A') {
        $redovi = [];
        $upitsortiraj2A = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' ORDER BY proizvod.cijena ASC";
        $rezultatsortiraj2A = $veza1->selectDB($upitsortiraj2A);
        while ($red = mysqli_fetch_array($rezultatsortiraj2A)) {
            $redovi[] = $red;
        }
    }
    if ($_GET['cijena'] == 'D') {
        $redovi = [];
        $upitsortiraj2D = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' ORDER BY proizvod.cijena DESC";
        $rezultatsortiraj2D = $veza1->selectDB($upitsortiraj2D);
        while ($red = mysqli_fetch_array($rezultatsortiraj2D)) {
            $redovi[] = $red;
        }
    }
}
if (isset($_GET['filtriraj1'])) {
    $redovi = [];
    $upitfiltriraj = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' AND proizvod.naziv LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj = $veza1->selectDB($upitfiltriraj);
    while ($red = mysqli_fetch_array($rezultatfiltriraj)) {
        $redovi[] = $red;
    }
}

if (isset($_GET['filtriraj2'])) {
    $redovi = [];
    $upitfiltriraj1 = "SELECT proizvod.naziv, proizvod.opis, proizvod.slika, proizvod.cijena from proizvod LEFT JOIN kupi_proizvod ON kupi_proizvod.proizvod_id = proizvod.id WHERE kupi_proizvod.korisnik_id = '{$korisnik_id}' AND proizvod.opis LIKE '%{$_GET['trazi']}%'";
    $rezultatfiltriraj1 = $veza1->selectDB($upitfiltriraj1);
    while ($red = mysqli_fetch_array($rezultatfiltriraj1)) {
        $redovi[] = $red;
    }
}

$veza1->zatvoriDB();

if (isset($_POST['potvrdiProfil'])) {
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

    if (!preg_match($uzorak, $_POST["nadimak"])) {
        $greska .= "Nije popunjen nadimak! <br>";
    }


    if (empty($greska) && empty($greska1)) {
        $veza = new Baza();
        $veza->spojiDB();

        $upit = "INSERT INTO profil(`slika`,`nadimak`,`bodovi`,`korisnik_id`,`picture`,`nickname`) "
                . "values('" . $upfile
                . "','" . $_POST["nadimak"]
                . "',0,'"
                . $_SESSION["uloga"]
                . "','" . $upfile
                . "','" . $_POST["nadimak"] . "');";

        $rezultat = $veza->selectDB($upit); 
        
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
        
        $veza->zatvoriDB();
        header("Location: profil.php");
        exit();
    }
}

$smarty->assign('red', $redovi);
$smarty->assign("nadimak", $nadimak);
$smarty->assign("profilna", $profilna);
$smarty->assign("bodovi", $bodovi);
$smarty->assign("profil", $profil);
$smarty->assign("greska", $greska);
$smarty->assign("greska1", $greska1);
$smarty->display("profil.tpl");
$smarty->display("podnozje.tpl");
?>
    