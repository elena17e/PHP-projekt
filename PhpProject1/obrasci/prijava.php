<?php

$naziv = "Prijava";
$direktorij = dirname(getcwd());
$putanja = dirname(dirname($_SERVER['REQUEST_URI']));

include "../posebno/funkcije.php";
include "../posebno/meni.php";

$greska = "";
$poruka = "";

if ($_SERVER["HTTPS"] != "on") {
    header("Location: https://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]);
    exit();
}


if (isset($_GET["potvrdiP"])) {

    $uzorak = "/^\S+.*$/";
    foreach ($_GET as $k => $v) {
        $v = filter_input(INPUT_GET, $k, FILTER_SANITIZE_STRING);
        if (!preg_match($uzorak, $v)) {
            $greska .= "Nije popunjeno: " . $k . "<br>";
        }
    }



    if (empty($greska)) {

        $veza = new Baza();
        $veza->spojiDB();

        $korime = mysqli_real_escape_string($veza->spojiDB(), $_GET['korime2']);
        $lozinka = mysqli_real_escape_string($veza->spojiDB(), $_GET['lozinka3']);

        $stmt1 = $veza->spojiDB()->prepare("SELECT korisnik.broj_unosa, konfiguracija_aplikacije.broj_neuspjesnih_prijava FROM korisnik INNER JOIN konfiguracija_aplikacije ON konfiguracija_aplikacije.id = korisnik.konfiguracija_aplikacije_id WHERE korisnik.korisnicko_ime = ?");
        $stmt1->bind_param("s", $korime);
        $stmt1->execute();
        $rezultatprovjeri = $stmt1->get_result();
        while ($red1 = $rezultatprovjeri->fetch_array()) {
            $dozvoljeniunosi = $red1["broj_neuspjesnih_prijava"];
            $pokusajikorisnika = $red1["broj_unosa"];
        }

        $stmt2 = $veza->spojiDB()->prepare("SELECT *FROM `korisnik` WHERE "
                . "`korisnicko_ime`= ? AND "
                . "`lozinka`= ?");
        $stmt2->bind_param("ss", $korime, $lozinka);
        $stmt2->execute();
        $rezultat = $stmt2->get_result();

        $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $stmt3 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
        $stmt3->bind_param("s", $korime);
        $stmt3->execute();
        $rezultatdohvatiKordnevnik = $stmt3->get_result();
        while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', "SELECT *FROM `korisnik` WHERE `korisnicko_ime`= ? AND `lozinka`= ?");
        $radnja_id_dnevnik = "1";
        $stmt4 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
        $stmt4->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
        $stmt4->execute();
        $rezultatdnevnik = $stmt4->get_result();
        $vezadnevnik->zatvoriDB();

        $autenticiran = false;
        $blokiran = false;
        while ($red = $rezultat->fetch_array()) {
            if (hash("sha256", $red['sol'] . ":" . $lozinka) == $red['lozinka_sha256']) {
                if ($red) {
                    if ($red["status_racuna"] == 0) {
                        $blokiran = true;
                    } else {
                        $autenticiran = true;
                        $tip = $red["tip_id"];
                    }
                }
            }
        }

        if ($blokiran) {
            $poruka = 'Vaš račun nije aktivan!';
        }
        if ($autenticiran) {
            $poruka = 'Uspješna prijava!';

            $stmt5 = $veza->spojiDB()->prepare("UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?");
            $stmt5->bind_param("s", $korime);
            $stmt5->execute();
            $rezultatazuriraj1 = $stmt5->get_result();

            $vezadnevnik = new Baza();
            $vezadnevnik->spojiDB();
            $stmt6 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
            $stmt6->bind_param("s", $korime);
            $stmt6->execute();
            $rezultatdohvatiKordnevnik = $stmt6->get_result();
            while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
                $korisnikdnevnik = $red["id"];
            }
            $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
            $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
            $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET broj_unosa = 0 WHERE korisnicko_ime = ?");
            $radnja_id_dnevnik = "2";
            $stmt7 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
            $stmt7->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
            $stmt7->execute();
            $rezultatdnevnik = $stmt7->get_result();
            $vezadnevnik->zatvoriDB();

            if (isset($_GET['zapamti'])) {
                setcookie("autenticiran", $korime, false, '/', false);
            }

            Sesija::kreirajKorisnika($korime, $tip);

            setcookie("vrijeme_prijave", date("H:i:s", $vrijeme_sustava), false, '/', false);

            header("Location: ../index.php");
            exit();
        }

        if (!$autenticiran && !$blokiran) {
            if ($dozvoljeniunosi < $pokusajikorisnika) {
                $poruka = 'Previše pokušaja, korisnički račun zaključan!';
                $stmt8 = $veza->spojiDB()->prepare("UPDATE korisnik SET status_racuna = 0 WHERE korisnicko_ime= ?");
                $stmt8->bind_param("s", $korime);
                $stmt8->execute();
                $rezultatazuriraj2 = $stmt8->get_result();
                $vezadnevnik = new Baza();
                $vezadnevnik->spojiDB();
                $stmt9 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
                $stmt9->bind_param("s", $korime);
                $stmt9->execute();
                $rezultatdohvatiKordnevnik = $stmt9->get_result();
                while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
                    $korisnikdnevnik = $red["id"];
                }
                $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
                $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
                $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET status_racuna = 0 WHERE korisnicko_ime= ?");
                $radnja_id_dnevnik = "2";
                $stmt10 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
                $stmt10->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
                $stmt10->execute();
                $rezultatdnevnik = $stmt10->get_result();
                $vezadnevnik->zatvoriDB();
            } else {
                $poruka = 'Neuspješna prijava, pokušajte ponovo!';
                $stmt11 = $veza->spojiDB()->prepare("UPDATE korisnik SET broj_unosa = broj_unosa + 1 WHERE korisnicko_ime= ? ");
                $stmt11->bind_param("s", $korime);
                $stmt11->execute();
                $rezultatazuriraj = $stmt11->get_result();
                $vezadnevnik = new Baza();
                $vezadnevnik->spojiDB();
                $stmt12 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
                $stmt12->bind_param("s", $korime);
                $stmt12->execute();
                $rezultatdohvatiKordnevnik = $stmt12->get_result();
                while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
                    $korisnikdnevnik = $red["id"];
                }
                $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
                $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
                $upit_dnevnik = str_replace('\'', '`', "UPDATE korisnik SET broj_unosa = broj_unosa + 1 WHERE korisnicko_ime= ? ");
                $radnja_id_dnevnik = "2";
                $stmt13 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
                $stmt13->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
                $stmt13->execute();
                $rezultatdnevnik = $stmt13->get_result();
                $vezadnevnik->zatvoriDB();
            }
        }

        $veza->zatvoriDB();
    }
}

$smarty->assign('greska', htmlspecialchars($greska, ENT_COMPAT, 'UTF-8'));
$smarty->assign('poruka', htmlspecialchars($poruka, ENT_COMPAT, 'UTF-8'));
$smarty->assign('kolacic', htmlspecialchars($_COOKIE["autenticiran"], ENT_COMPAT, 'UTF-8'));
$smarty->display("prijava.tpl");
$smarty->display("podnozje.tpl");
?>