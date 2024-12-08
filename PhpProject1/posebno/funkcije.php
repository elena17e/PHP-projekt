<?php

include 'dnevnik.class.php';
include "baza.class.php";
include "sesija.class.php";
require "$direktorij/vanjske_biblioteke/smarty-4.3.0/libs/Smarty.class.php";

Sesija::kreirajSesiju();


$smarty = new Smarty();
$smarty->setTemplateDir("$direktorij/templates")
        ->setCompileDir("$direktorij/templates_c")
        ->setConfigDir("$direktorij/configs");

$smarty->configLoad('primjer.conf');
$razina = $smarty->getConfigVars('razina_izvjestavanja');
$pomak = $smarty->getConfigVars('pomak');
error_reporting(constant($razina));


if(isset($_GET["odjava"])){
    Sesija::obrisiSesiju();
}

//postavlja razinu izvještavanja - ne za sve korisnike (treba učitati iz konfiguracije)!
//postavlja razinu izvještavanja - ne za sve korisnike (treba učitati iz konfiguracije)!
if (isset($_SESSION["razina"])) {
    error_reporting($_SESSION["razina"]);
}


$vrijeme_servera = time();
$vrijeme_sustava = $vrijeme_servera + ($pomak * 60 * 60);


if (isset($_GET['postavi'])) {
    header("Location: http://barka.foi.hr/WebDiP/pomak_vremena/vrijeme.html");
}


if (isset($_GET['virtualno'])) {
    $url = "http://barka.foi.hr/WebDiP/pomak_vremena/pomak.php?format=xml";

      if (!($fp = fopen($url, 'r'))) {
      echo "Problem: nije moguće otvoriti url: " . $url;
      exit;
      }
      $xml_string = fread($fp, 10000);
      fclose($fp);

      $domdoc = new DOMDocument;
      $domdoc->loadXML($xml_string);

      $params = $domdoc->getElementsByTagName('brojSati');
      $sati = 0;

      if ($params != NULL) {
      $sati = $params->item(0)->nodeValue;
      } 

    if (isset($_GET["primjeni"])) {
        azirirajkonfiguraciju("pomak", $sati); // citati iz datoteke ili konfiguracije
    }
}


if(isset($_SESSION['korisnik'])){
    $vezasesija = new Baza();
    $vezasesija->spojiDB();
    
    $upitsesijakor = "SELECT konfiguracija_aplikacije_id FROM korisnik WHERE korisnicko_ime = '{$_SESSION['korisnik']}'";
    $rezultatsesijakor = $vezasesija->selectDB($upitsesijakor);
    while ($red = mysqli_fetch_array($rezultatsesijakor)) {
        $konfiguracija_id = $red["konfiguracija_aplikacije_id"];
    }
    
    $upitsesija = "SELECT trajanje_sesije FROM konfiguracija_aplikacije WHERE id = '$konfiguracija_id'";
    $rezultatsesija = $vezasesija->selectDB($upitsesija);
    while ($red = mysqli_fetch_array($rezultatsesija)) {
        $trajanje = $red["trajanje_sesije"];
    }
    
    $upitizmjena = "SELECT korisnik.korisnicko_ime FROM korisnik RIGHT JOIN konfiguracija_aplikacije on korisnik.konfiguracija_aplikacije_id = konfiguracija_aplikacije.id WHERE konfiguracija_aplikacije.status_konfiguracije = 'izmjena' AND korisnik.id != 1";
    $rezultatizmjena = $vezasesija->selectDB($upitizmjena);
    while ($red = mysqli_fetch_array($rezultatizmjena)) {
    $redoviizmjene[] = $red["korisnicko_ime"];
}
    
    $vezasesija->zatvoriDB();

$vr_prijava = $_COOKIE["vrijeme_prijave"];
$array_prijava = explode(":",$vr_prijava);

if ((date("H:i:s", $vrijeme_sustava - (($array_prijava[0]* 60 * 60) + ($array_prijava[1] * 60) + ($array_prijava[2])))) > $trajanje) {
    Sesija::obrisiSesiju();
}

foreach ($redoviizmjene as $value) {
    if($_SESSION['korisnik'] === $value){
    Sesija::obrisiSesiju();
    }
}

}

function azirirajkonfiguraciju($kljuc, $vrijednost) {
    global $direktorij;
    $konfiguracija = file("$direktorij/configs/primjer.conf");

    $f = fopen("$direktorij/configs/primjer.conf", "w");
    for ($i = 0; $i < count($konfiguracija); $i++) {
        $redak = explode(" = ", $konfiguracija[$i]);
        if ($redak[0] == $kljuc) {
            $redak[1] = $vrijednost;
            fwrite($f, $redak[0] . " = " . $redak[1] . "\n");
        } else {
            fwrite($f, $redak[0] . " = " . $redak[1]);
        }
    }
    fclose($f);
}


$smarty->assign("putanja", $putanja);
$smarty->assign("naziv", $naziv);
$smarty->assign('vrijeme_sustava', $vrijeme_sustava);
$smarty->display("zaglavlje.tpl");
?>