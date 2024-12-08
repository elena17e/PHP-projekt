<?php

echo "<nav id='navigacija' class='stupac'><ul>
            <li><a href=\"$putanja/index.php\">Početna</a></li>
            <li><a href=\"$putanja/o_autoru.html\">O autoru</a> </li>
            <li><a href=\"$putanja/dokumentacija.html\">Dokumentacija</a> </li>
            <li><a href=\"$putanja/obrasci/registracija.php\">Registracija</a></li>
            <li><a href=\"$putanja/obrasci/prijava.php\">Prijava</a></li> 
            <div class=\"dropdown\">
                 <li>Korisnici</li>
                 <div class=\"dropdown-content\">
                 <li><a href=\"$putanja/privatno/korisnici.php\">Popis korisnika</a></li>";
if (isset($_SESSION["uloga"]) && $_SESSION["uloga"] === 1) {
    echo "<li><a href=\"$putanja/zakljucani_racuni.php\">Zaključani računi</a></li>";
}

if (isset($_SESSION["uloga"]) && $_SESSION["uloga"] < 4) {
    echo"</div>
                     </div>
            <div class=\"dropdown\">
            <li>Kampanje</li>
            <div class=\"dropdown-content\">";
    echo "<li><a href=\"$putanja/otvorene_kampanje.php\">Otvorene Kampanje</a></li>";
}
if (isset($_SESSION["uloga"]) && $_SESSION["uloga"] < 3) {
    echo "<li><a href=\"$putanja/kreiraj_kampanju.php\">Kreiraj Kampanju</a></li>";
    echo "<li><a href=\"$putanja/kupljeni_proizvodi_po_kampanji.php\">Proizvodi po kampanji</a></li>";
}
echo "
            </div>
            </div>";
if (isset($_SESSION["uloga"]) && $_SESSION["uloga"] < 4) {
    echo "<li><a href=\"$putanja/profil.php\">Profil</a></li>";
}
if (isset($_SESSION["uloga"]) && $_SESSION["uloga"] === 1) {
    echo "<div class=\"dropdown\">
            <li>Proizvodi</li>
            <div class=\"dropdown-content\">
            <li><a href=\"$putanja/popis_proizvoda.php\">Popis proizvoda</a></li>
            <li><a href=\"$putanja/kreiraj_proizvod.php\">Kreiraj proizvod</a></li>
            <li><a href=\"$putanja/kupljeni_proizvodi_po_moderatoru.php\">Proizvodi po moderatoru</a></li>
            </div>
            </div>
            <li><a href=\"$putanja/dnevnik.php\">Dnevnik</a></li>
            <li><a href = \"$putanja/konfiguracija_aplikacije.php\">Konfiguracija</a></li>
            <li><a href='index.php?uvijetiResetiraj=da'>Resetiraj uvijete</a> </li>";
}
if (isset($_SESSION["uloga"])) {
    echo "<li><a href='?odjava=da'>Odjava</a> </li>";
}
echo "</ul></nav>";
?>