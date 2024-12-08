<section id="sadrzaj">
                    <h2 class="tekst">Zaboravili ste lozinku?</h2>
                <form novalidate id="formaLozinka" method="get" name="formaLozinka" action="">
                    <label for="emailZ" id="emailZ">Unesite email: </label>
                    <input type="email" id="emailZ" name="emailZ" maxlength="50" size="30"><br><br>   
                    <input type="submit" value="Pošalji novu lozinku"  name="potvrdiL" id="posalji">
                    <a href="prijava.php"><input type="button" value="Odustani"  name="odustani"></a>
                </form> 
                    <div id="greske">
                {if isset($greska)}
                    <p>{$greska}</p>
                {/if}
               
            </div>
</section>
