  <section id="sadrzaj">
            <h1 class="tekst">Kreiraj/ažuriraj proizvod</h1>
            <form  enctype="multipart/form-data" id="formaKreirajP" method="post" name="formaKreirajP" 
                   action="" novalidate>
                    <label for="naziv" id="nazivl">Naziv:</label>
                    <input type="text" id="naziv" name="naziv" value={$naziv_proizvoda}><br>
                    <label for="opis" id="opisl">Opis: </label>
                    <textarea id="opis" name="opis" placeholder="Unesite opis">{$opis}</textarea><br>
                    <label for="slika" id="slikal">Slika: </label>
                    <input type="file" name="slika" id="slika" value={$slika}/><br><br>
                    <input type="hidden" name="MAX_FILE_SIZE" value="30000"/>
                    <label for="kolicina" id="kolicinal">Kolicina:</label>
                    <input type="number" id="kolicina" name="kolicina" value={$kolicina}><br>
                     <label for="cijena" id="cijenal">Cijena:</label>
                    <input type="number" id="cijena" name="cijena" value={$cijena}><br>
                    <label for="status" id="statusl">Status:</label>
                     <select id="status" name="status">
                     <option value="0" {if !$status} selected {/if}>0</option>
                     <option value="1" {if $status} selected {/if}>1</option>
                     </select><br>
                     <label for="bodovi" id="bodovil">Bodovi:</label>
                    <input type="number" id="bodovi" name="bodovi" value={$bodovi}><br>
                    <label for="korisnik_id" id="korisnik_idl">Zadužen korisnik:</label>
                     <select id="korisnik_id" name="korisnik_id">
                    {section name=i loop=$red1}
                    <option value={$red1[i].id} {if $korisnik_id == $red1[i].id} selected {/if}>{$red1[i].id}</option>
                    {/section}
                     </select><br>
                     <label for="uvijeti_i_cijena" id="uvijeti_i_cijenal">Uvijeti:</label>
                     <select id="uvijeti_i_cijena" name="uvijeti_i_cijena">
                    {section name=i loop=$red}
                    <option value={$red[i].id} {if $uvijeti_i_cijena == $red[i].id} selected {/if}>{$red[i].id}</option>
                    {/section}
                     </select><br>
                    <input name="submit" type="submit" value="Kreiraj">
                    </form>
              <div id="greske" style="text-align: center">
                {if isset($greska)}
                    <p>{$greska}</p>
                {/if}
                 {if isset($greska1)}
                    <p>{$greska1}</p>
                {/if}
            </div>
                   <div id="poruka" style="text-align: center;">
                {if isset($poruka)}
                    <p>{$poruka}</p>
                {/if}
            </div>
            <h2 class="tekst">Dodijeli ulogu moderatora</h2>
            <form  enctype="multipart/form-data" id="formaDodijeliM" method="post" name="formaDodijeliM" 
                   action="" novalidate>
                  <label for="korisnik_moderator" id="korisnik_moderatorl">Korisnik:</label>
                     <select id="korisnik_moderator" name="korisnik_moderator">
                    {section name=i loop=$red2}
                    <option value={$red2[i].id}>{$red2[i].id}</option>
                    {/section}
                     </select><br>
                 <input name="dodijeli" type="submit" value="Dodijeli">
                 </form>
                 <div id="poruka" style="text-align: center;">
                {if isset($poruka1)}
                    <p>{$poruka1}</p>
                {/if}
            </div>
        </section>
