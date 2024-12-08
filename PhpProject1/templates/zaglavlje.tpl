{config_load file="primjer.conf"}
<!DOCTYPE html>
<html lang="hr">

    <head>
       
        <title>{$naziv}</title>
        <link rel="icon" href="{$putanja}/multimedija/ikona.png">
        <meta name="author" content="Elena Pizek">
        <meta name="keywords" content="FOI, WebDiP">
        <meta name="description" content="{$smarty.now|date_format:"%d.%m.%Y. %H:%M;%S"}">
        <link href="{$putanja}/css/epizek.css" rel="stylesheet" type="text/css">
        <link href="{$putanja}/css/epizek_prilagodbe.css" rel="stylesheet" type="text/css"> 
        <meta name="viewport" content="{#pocetni_prikaz#}">
         <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script src="{$putanja}/javascript/epizek_jquery.js"></script>
        <meta charset="utf-8">
    </head>

    <body id="tijelo">
        <header>
            <a id="logo" href="{$putanja}/index.php">
                <img src="{$putanja}/multimedija/wow.png" alt="wow ikona" width="50"></a>
            <form id="odaberiJ" action="http://barka.foi.hr/WebDiP/2022/materijali/zadace/ispis_forme.php">
                <label for="jezik">Odaberi jezik stranice:</label>
                <select id="jezik" name="jezik">
                    <option value="HRV" selected="selected">Hrvatski jezik</option>
                    <option value="ENG">Engleski jezik</option>
                    <option value="GER">Njemački jezik</option>
                </select>
            </form>
            <a id="menu" href="#pretrazivanje">
                <img src="{$putanja}/multimedija/search.jpeg" alt="menu ikona" width="50"></a>
            <div id="pretrazivanje">
                <a href="#"><img src="{$putanja}/multimedija/close.png" alt="zatvori" width="25"></a>
                <form id="formaU" name="formaU" action="http://barka.foi.hr/WebDiP/2022/materijali/zadace/ispis_forme.php">
                    <label for="unos">Pojam: </label>
                    <input id="unos" type="search" name="unos">
                    <input type="submit" value="Pretraži">
                </form>
            </div>
            <h1 id="pocetak">{$naziv}</h1>
        </header>
          
