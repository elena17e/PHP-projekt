<?php

$naziv = "Zaboravljena lozinka";
$direktorij = dirname(getcwd());
$putanja = dirname(dirname($_SERVER['REQUEST_URI']));

include "../posebno/funkcije.php";

$greska = "";

if (isset($_GET['potvrdiL'])) {

    $veza = new Baza();
    $veza->spojiDB();

    $uzorak = "/^\S+.*$/";
    foreach ($_GET as $k => $v) {
        $v = filter_input(INPUT_GET, $k, FILTER_SANITIZE_STRING);
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }

    $email = mysqli_real_escape_string($veza->spojiDB(), $_GET['emailZ']);

    $stmt1 = $veza->spojiDB()->prepare("SELECT korisnicko_ime FROM korisnik WHERE email = ?");
    $stmt1->bind_param("s", $email);
    $stmt1->execute();
    $rezultatdohvatiKorime = $stmt1->get_result();

    $postoji = false;
    while ($red = $rezultatdohvatiKorime->fetch_array()) {
        $korisnik = $red["korisnicko_ime"];
        $postoji = true;
    }

    if ($postoji) {
        $generiraj_lozinku = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'), 1, 20);
        $sol = md5(date("Y.m.d. H:i:s", $vrijeme_sustava) . ":" . $korisnik);
        $lozinka_hash = hash("sha256", $sol . ":" . $generiraj_lozinku);
        $subject = "Zaboravljena lozinka!";
        $message = "Postovani! Vasa nova lozinka je: $generiraj_lozinku";
        $header = 'From: noreplay@barka.foi.hr';

        mail($email, $subject, $message, $header);

        $stmt2 = $veza->spojiDB()->prepare("UPDATE korisnik SET lozinka = ?, lozinka_sha256 = ?, sol = ?, password = ?, password_sha256 = ? WHERE email=?");
        $stmt2->bind_param("ssssss", $generiraj_lozinku, $lozinka_hash, $sol, $generiraj_lozinku, $lozinka_hash, $email);
        $stmt2->execute();
        $rezultatazuriraj = $stmt2->get_result();
        $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $stmt3 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
        $stmt3->bind_param("s", $korisnik);
        $stmt3->execute();
        $rezultatdohvatiKordnevnik = $stmt3->get_result();
        while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET lozinka = ?, lozinka_sha256 = ?, sol = ?, password = ?, password_sha256 = ? WHERE email=?");
        $radnja_id_dnevnik = "2";
        $stmt4 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
        $stmt4->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
        $stmt4->execute();
        $rezultatdnevnik = $stmt4->get_result();
        $vezadnevnik->zatvoriDB();

        header("Location: prijava.php");
        exit();
    } else {
        echo "Email koji ste unijeli ne postoji u bazi! Pokušajte ponovo";
    }

    $veza->zatvoriDB();
}

$smarty->assign('greska', htmlspecialchars($greska, ENT_COMPAT, 'UTF-8'));
$smarty->display("zaboravljena_lozinka.tpl");
$smarty->display("podnozje.tpl");
?>

