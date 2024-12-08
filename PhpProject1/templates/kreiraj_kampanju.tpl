  <section id="sadrzaj">
            <h2 class="tekst">Kreiraj/ažuriraj kampanju</h2>
            <form  enctype="multipart/form-data" id="formaKampanja" method="post" name="formaKampanja" 
                   action="" novalidate>
                    <label for="naziv" id="nazivl">Naziv:</label>
                    <input type="text" id="naziv" name="naziv" value={$naziv_kampanje}><br>
                    <label for="opis" id="opisl">Opis: </label>
                    <textarea id="opis" name="opis" placeholder="Unesite opis">{$opis}</textarea><br>
                    <label for="pocetak" id="pocetakl">Datum i vrijeme početka:</label>
                    <input type="datetime-local" id="pocetak" name="pocetak" value="{$datumpocetka}"><br>
                    <label for="zavrsetak" id="zavrsetakl">Datum i vrijeme završetka:</label>
                    <input type="datetime-local" id="zavrsetak" name="zavrsetak" value="{$datumzavrsetka}"><br>
                    <input name="submit" type="submit" value="Kreiraj">
                    </form>
              <div id="greske" style="text-align: center">
                {if isset($greska)}
                    <p>{$greska}</p>
                {else} 
                    Nema greške!
                {/if}
            </div>
                   <div id="poruka" style="text-align: center; margin-bottom: 140px;">
                {if isset($poruka)}
                    <p>{$poruka}</p>
                {/if}
            </div> 
            {if !empty($id)}
                 <h2 class="tekst">Pridruži proizvod kampanji</h2>
            <form  enctype="multipart/form-data" id="formaKampanjaPridruzi" method="post" name="formaKampanjaPridruzi" 
                   action="" novalidate>
                    <label for="id_kampanje" id="id_kampanjel">Id kampanje:</label>
                    <input type="number" id="id_kampanje" name="id_kampanje"  value={$id} ><br>
                    <label for="opis_proizvoda" id="opis_proizvodal">Opis proizvoda:</label>
                     <select id="opis_proizvoda" name="opis_proizvoda">
                    {section name=i loop=$red}
                    <option value={$red[i].id} >{$red[i].opis}</option>
                    {/section}
                     </select><br>
                    <input name="pridruzi" type="submit" value="Pridruži">
                    </form>
                  <div id="greske" style="text-align: center">
                {if isset($greskaP)}
                    <p>{$greskaP}</p>
                {/if}
            </div>
                   <div id="poruka" style="text-align: center; margin-bottom: 140px;">
                {if isset($porukaP)}
                    <p>{$porukaP}</p>
                {/if}
            </div> 
            {/if}
        </section>
