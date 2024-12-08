<section id="sadrzaj">
                <h2 class="tekst">Registracija</h2>
                <form novalidate id="formaR" method="post" name="formaR" action="">
                    <label for="imeprezime" id="imeprezime1">Ime i Prezime </label>
                    <input type="text" id="imeprezime" name="imeprezime" maxlength="30" required="required"><br>
                    <div id="imeprezimeGreske">
                    {if isset($imeprezimeGreske)}
                        <p>{$imeprezimeGreske}</p>
                       {/if}
                    </div>
                    <label for="korime" id="korime1">Korisničko ime </label>
                    <input type="text" id="korime" name="korime" maxlength="30" required="required"><br>
                    <div id="korimeGreske">
                    {if isset($korimeGreske)}
                        <p>{$korimeGreske}</p>
                       {/if}
                    </div>
                    <label for="email" id="email1">Email adresa: </label>
                    <input type="email" id="email" name="email" maxlength="50" size="30" required="required"><br>
                        <div id="emailGreske">
                     {if isset($emailGreske)}
                        <p>{$emailGreske}</p>
                       {/if}
                       </div>
                    <label for="lozinka1" id="lozinka11">Lozinka: </label>
                    <input type="password" id="lozinka1" name="lozinka1" minlength="5" required="required" ><br>
                    <div id="lozinka1Greske">
                     {if isset($lozinka1Greske)}
                        <p>{$lozinka1Greske}</p>
                       {/if}
                       </div>
                    <label for="lozinka2" id="lozinka22">Potvrdi lozinku: </label>
                    <input type="password" id="lozinka2" name="lozinka2" minlength="5" required="required"><br>
                    <div id="lozinka2Greske">
                     {if isset($lozinka2Greske)}
                        <p>{$lozinka2Greske}</p>
                       {/if}
                       </div>
   
                       <div class="g-recaptcha" data-sitekey="6LfdbzcmAAAAAIWmV6soImxXG7M8S0Khnck1QpVT"></div>
                       <div id="CAPTCHAgreske">
                         {if isset($CAPTCHAgreske)}
                        <p>{$CAPTCHAgreske}</p>
                       {/if}
                       </div>  
                    <input type="submit" value="Potvrdi" name="potvrdiR" id="registrirajMe">
                </form>
               <div id="poruka">
            {if isset($poruka)} 
                <p>{$poruka}</p>
            {/if}
                </div>
                <div id="greskeR"></div>
        </section>
