<?php

$naziv = "Registracija";
$direktorij = dirname(getcwd());
$putanja = dirname(dirname($_SERVER['REQUEST_URI']));

include "../posebno/funkcije.php";
include "../posebno/meni.php";

$lozinka2Greske = "";
$lozinka1Greske = "";
$emailGreske = "";
$korimeGreske = "";
$imeprezimeGreske = "";
$CAPTCHAgreske = "";
$poruka = "";
$generiraj_kod = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 1, 7);

if (isset($_POST["potvrdiR"])) {
    foreach ($_POST as $k => $v) {
        $v = filter_input(INPUT_POST, $k, FILTER_SANITIZE_STRING);
    }

    if (($_POST["imeprezime"] === "")) {
        $imeprezimeGreske .= "Ime i prezime nije popunjeno <br>";
    }
    if (($_POST["korime"] === "")) {
        $korimeGreske .= "Korisničko ime nije popunjeno <br>";
    }
    if (strlen($_POST["korime"]) < 5) {
        $korimeGreske .= "Korisničko ime sadrži pre malo znakova <br>";
    }
    if (($_POST["email"] === "")) {
        $emailGreske .= "Email nije popunjen <br>";
    }
    if (($_POST["lozinka1"] === "")) {
        $lozinka1Greske .= "Lozinka nije popunjena <br>";
    }
    if ($_POST["lozinka2"] === "") {
        $lozinka2Greske .= "Ponovljena lozinka nije popunjena <br>";
    }
    if ($_POST["lozinka1"] !== $_POST["lozinka2"]) {
        $lozinka2Greske .= "Lozinka i ponovljena lozinka nisu jednake <br>";
    }
    if (strlen($_POST["lozinka1"]) < 15 || strlen($_POST["lozinka1"]) > 25) {
        $lozinka1Greske .= "Lozinka mora imati između 15 i 25 znakova <br>";
    }

    $hasBigLetter = false;
    $hasSmallLetter = false;
    $hasNumber = false;
    for ($i = 0; $i < strlen($_POST["lozinka1"]); $i++) {

        $charCode = ord($_POST["lozinka1"][$i]);

        if ($charCode > 47 && $charCode < 58) {
            $hasNumber = true;
        }
        if ($charCode > 64 && $charCode < 91) {
            $hasBigLetter = true;
        }
        if ($charCode > 96 && $charCode < 123) {
            $hasSmallLetter = true;
        }
    }
    if (!$hasBigLetter || !$hasSmallLetter || !$hasNumber) {
        $lozinka1Greske .= "Lozinka nema potrebne znakove <br>";
    }

    if (strpos($_POST["lozinka1"], ' ') !== false) {
        $lozinka1Greske .= "Lozinka sadrži ne dozvoljene znakove <br>";
    }

    if (mb_substr($_POST["lozinka1"], 0, 1) === '=' || mb_substr($_POST["lozinka1"], 0, 1) === '*' || mb_substr($_POST["lozinka1"], 0, 1) === '/' || mb_substr($_POST["lozinka1"], 0, 1) === '%') {
        $lozinka1Greske .= "Specijalni znak ne moze biti prvi znak lozinke <br>";
    }
    if (substr($_POST["lozinka1"], -1) === '=' || substr($_POST["lozinka1"], -1) === '*' || substr($_POST["lozinka1"], -1) === '/' || substr($_POST["lozinka1"], -1) === '%') {
        $lozinka1Greske .= "Specijalni znak ne moze biti zadnji znak lozinke <br>";
    }

    $emailic = $_POST["email"];
    $regex = "/^([^\W_][a-zA-Z0-9.+_-]{0,62}[^\W_])@([^\W_][a-zA-Z0-9.-]{0,251}[^\W_])\.(com|hr|info)$/";
    if (!preg_match($regex, $emailic)) {
        $emailGreske .= "Email nije ispravan<br>";
    }
    if ($_COOKIE["postoji"] == 1) {
        $korimeGreske .= "Korisničko ime zauzeo. Unesite drugo korime!<br>";
    }

    $recaptcha = $_POST['g-recaptcha-response'];
    $secret_key = '6LfdbzcmAAAAAJk0ksqFDIlA88hXMpRyhHbVgvdN';
    $url = 'https://www.google.com/recaptcha/api/siteverify?secret='
            . $secret_key . '&response=' . $recaptcha;
    $response = file_get_contents($url);
    $responsee = json_decode($response);
    if ($responsee->success != true) {
        $CAPTCHAgreske .= "Pogreška u Google reCAPTACHA verifikaciji <br>";
    }


    if (empty($imeprezimeGreske) && empty($emailGreske) && empty($lozinka1Greske) && empty($lozinka2Greske) && empty($korimeGreske) && empty($CAPTCHAgreske)) {
        $veza = new Baza();
        $veza->spojiDB();

        $l = mysqli_real_escape_string($veza->spojiDB(), $_POST["lozinka1"]);
        $korime = mysqli_real_escape_string($veza->spojiDB(), $_POST["korime"]);
        $sol = md5(date("Y.m.d. H:i:s", $vrijeme_sustava) . ":" . $korime);
        $lozinka_hash = hash("sha256", $sol . ":" . $l);

        $datumvrijeme = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $imeprezime = mysqli_real_escape_string($veza->spojiDB(), $_POST["imeprezime"]);
        $email = mysqli_real_escape_string($veza->spojiDB(), $_POST["email"]);

        $uvijetiPrihvaceni = 'P';
        $termsAccepted = 'A';

        $stmt1 = $veza->spojiDB()->prepare("INSERT INTO korisnik(`korisnicko_ime`,`ime_i_prezime`,`lozinka`,`email`,`datum_vrijeme_registracije`,`uvijet_koristenja`,`broj_unosa`,`status_racuna`,`tip_id`,`lozinka_sha256`,`sol`,"
                . "`konfiguracija_aplikacije_id`,`username`,`name_and_surname`,`password`,`terms_of_use`,`password_sha256`) "
                . "values(?,?,?,?,?,?,0,0,3,?,?,2,?,?,?,?,?);");

        $stmt1->bind_param("sssssssssssss", $korime, $imeprezime, $l, $email, $datumvrijeme, $uvijetiPrihvaceni,$lozinka_hash, $sol, $korime, $imeprezime, $l, $termsAccepted, $lozinka_hash);
        $stmt1->execute();
        $rezultat = $stmt1->get_result();

        $vezadnevnik = new Baza();
        $vezadnevnik->spojiDB();
        $stmt2 = $vezadnevnik->spojiDB()->prepare("SELECT id FROM korisnik WHERE korisnicko_ime = ?");
        $stmt2->bind_param("s", $korime);
        $stmt2->execute();
        $rezultatdohvatiKordnevnik = $stmt2->get_result();
        while ($red = $rezultatdohvatiKordnevnik->fetch_array()) {
            $korisnikdnevnik = $red["id"];
        }
        $datum_dnevnik = date("Y.m.d. H:i:s", $vrijeme_sustava);
        $radnja_dnevnik = basename($_SERVER['PHP_SELF']);
        $upit_dnevnik = str_replace('\'', '`', "INSERT INTO korisnik(`korisnicko_ime`,`ime_i_prezime`,`lozinka`,`email`,`datum_vrijeme_registracije`,`uvijet_koristenja`,`broj_unosa`,`status_racuna`,`tip_id`,`lozinka_sha256`,`sol`,"
                . "`konfiguracija_aplikacije_id`,`username`,`name_and_surname`,`password`,`terms_of_use`,`password_sha256`) "
                . "values(?,?,?,?,?,?,0,0,3,?,?,2,?,?,?,?,?);");
        $radnja_id_dnevnik = "4";
        $stmt3 = $vezadnevnik->spojiDB()->prepare("INSERT INTO `dnevnik` (`id`, `datum_vrijeme`, `radnja`, `upit`, `korisnik_id`, `tip_id`, `action`, `query`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);");
        $stmt3->bind_param("sssiiss", $datum_dnevnik, $radnja_dnevnik, $upit_dnevnik, $korisnikdnevnik, $radnja_id_dnevnik, $radnja_dnevnik, $upit_dnevnik);
        $stmt3->execute();
        $rezultatdnevnik = $stmt3->get_result();
        $vezadnevnik->zatvoriDB();

        $poruka = 'Provjerite vaš email da dovršite registraciju!';

        $subject = "Registracija!";
        $message = "Postovani vaš aktivacijski kod je $generiraj_kod! Potvrdite vašu registraciju na: https://barka.foi.hr/WebDiP/2022_projekti/WebDiP2022x034/obrasci/registracija.php?korime=$korime&kod=$generiraj_kod";

        mail($email, $subject, $message);

        $veza->zatvoriDB();
    }
}

if (isset($_GET['korime']) && isset($_GET['kod'])) {
    $veza1 = new Baza();
    $veza1->spojiDB();

    $korimeget = mysqli_real_escape_string($veza1->spojiDB(), $_GET["korime"]);
    $kodget = mysqli_real_escape_string($veza1->spojiDB(), $_GET["kod"]);

    $stmt4 = $veza1->spojiDB()->prepare("SELECT datum_vrijeme_registracije FROM korisnik WHERE korisnicko_ime = ?");
    $stmt4->bind_param("s", $korimeget);
    $stmt4->execute();
    $rezultatdohvatiDatum = $stmt4->get_result();
    while ($red = $rezultatdohvatiDatum->fetch_array()) {
        $datum_registracije = $red["datum_vrijeme_registracije"];
    }

    if (date("Y.m.d. H:i:s", $vrijeme_sustava) > date('Y.m.d. H:i:s', strtotime($datum_registracije) + (10 * 60 * 60))) {
        $poruka = 'Vrijeme za registraciju je isteklo! Ponovo se registrirajte.';
        $stmt5 = $veza1->spojiDB()->prepare("DELETE FROM `korisnik` WHERE `korisnik`.`korisnicko_ime` = ?");
        $stmt5->bind_param("s", $korimeget);
        $stmt5->execute();
        $rezultatObrisi = $stmt5->get_result();
    } else {
        $stmt6 = $veza1->spojiDB()->prepare("UPDATE korisnik SET aktivacijski_kod = ?, activation_code = ?, status_racuna = 1 WHERE korisnicko_ime= ?");
        $stmt6->bind_param("sss", $kodget, $kodget, $korimeget);
        $stmt6->execute();
        $rezultatazuriraj = $stmt6->get_result();
        $poruka = 'Uspješno ste registrirani!';
    }

    $veza1->zatvoriDB();
}


$smarty->assign('poruka', htmlspecialchars($poruka, ENT_COMPAT, 'UTF-8'));
$smarty->assign('emailGreske', htmlspecialchars($emailGreske, ENT_COMPAT, 'UTF-8'));
$smarty->assign('imeprezimeGreske', htmlspecialchars($imeprezimeGreske, ENT_COMPAT, 'UTF-8'));
$smarty->assign('korimeGreske', htmlspecialchars($korimeGreske, ENT_COMPAT, 'UTF-8'));
$smarty->assign('lozinka1Greske', htmlspecialchars($lozinka1Greske, ENT_COMPAT, 'UTF-8'));
$smarty->assign('lozinka2Greske', htmlspecialchars($lozinka2Greske, ENT_COMPAT, 'UTF-8'));
$smarty->assign('CAPTCHAgreske', htmlspecialchars($CAPTCHAgreske, ENT_COMPAT, 'UTF-8'));
$smarty->display("registracija.tpl");
$smarty->display("podnozje.tpl");
?>