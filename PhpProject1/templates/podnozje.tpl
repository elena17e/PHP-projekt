 <footer>
            <address>Kontakt: <a href="mailto:epizek@foi.hr">Elena Pizek</a></address>
            <a href="http://validator.w3.org/check?uri=http://barka.foi.hr/WebDiP/2022/zadaca_03/epizek/o_autoru.html">
                <img src="{$putanja}/multimedija/HTML5.png" alt="HTML5" width="50"/>
            </a>
            <a href="https://jigsaw.w3.org/css-validator/validator?uri=http://barka.foi.hr/WebDiP/2022/zadaca_03/epizek/o_autoru.html">
                <img src="{$putanja}/multimedija/CSS3.png" alt="CSS3" width="50">
            </a><br>
               <span>
                <strong>Trenutna razina izvještavanja: </strong>
                {error_reporting()} | 
                <strong>Vrijeme sustava: </strong>
                {$smarty.now|date_format:"%Y.%m.%d. %H:%M:%S"} |
                <strong>Virtualno vrijeme: </strong>
                {date("Y.m.d. H:i:s", $vrijeme_sustava)}
            </span>
            <br><br>
            <form id="odaberiP" action="http://barka.foi.hr/WebDiP/2022/materijali/zadace/ispis_forme.php">
                <label for="privola">Prikupljanje podataka:</label>
                <select id="privola" name="privola">
                    <option value="Bez">Bez prikupljanja</option>
                    <option value="Osnovno" selected="selected">Osnovno</option>
                    <option value="Sve">Sve</option>
                </select>
            </form>
            <p>&copy; 2023 E.Pizek</p>
            <img src="{$putanja}/multimedija/CC.png" alt="CC" width="50">
        </footer>
    </body>
</html>