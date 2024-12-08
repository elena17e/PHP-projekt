<?php

include 'posebno/baza.class.php';
include 'posebno/sesija.class.php';
Sesija::kreirajSesiju();

$veza = new Baza();
$veza->spojiDB();
$upit1 = "SELECT korisnicko_ime FROM korisnik";
$rezultat1 = $veza->selectDB($upit1);
$podaci = mysqli_fetch_all($rezultat1);
$veza->zatvoriDB();


echo json_encode($podaci);

