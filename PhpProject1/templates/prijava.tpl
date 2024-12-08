<section id="sadrzaj">
   
                    <h2 class="tekst">Prijava</h2>
                <form novalidate id="formaP" method="get" name="formaP" action="">
                    <label for="korime2" id="korime22">Korisničko ime: </label>
                    <input type="text" id="korime2" name="korime2" size="30" required="required" value={$kolacic}><br>
                    <label for="lozinka3" id="lozinka33">Lozinka: </label>
                    <input type="password" id="lozinka3" name="lozinka3" size="30" required="required" ><br>
                    <div id="zapamtiMe">   
                    <input type="checkbox" id="zapamti" name="zapamti" value="1">
                    <label for="zapamti" id="zapamtil">Zapamti me</label><br>
                    </div>
                    <div id="zaboravljena">  <a href="zaboravljena_lozinka.php">Zaboravljena lozinka?</a> </div>
                    <input type="submit" value="Potvrdi"  name="potvrdiP" id="prijaviMe">
                </form>
                <div id="poruka">
            {if isset($poruka)} 
                <p>{$poruka}</p>
            {/if}
                </div>
                 <div id="greske">
                
                {if isset($greska)}
                    <p>{$greska}</p>
                {else} 
                    Nema greške!
                {/if}
               
            </div>
                <p>
                    Registrirani korisnik:  iivic | 9876 <br> 
                    Moderator: aantic | 1234 <br> 
                    Administrator: epizek | 123456

                </p>
             
        </section>
