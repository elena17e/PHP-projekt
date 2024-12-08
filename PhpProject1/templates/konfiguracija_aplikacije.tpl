  <section id="sadrzaj" >
            <h1 class="tekst">Konfiguracija aplikacije</h1>
            <center><form  enctype="multipart/form-data" id="formaKonfiguracija" method="post" name="obrazac" 
                   action="" novalidate>
                  <fieldset>
                    <legend>Virtualno vrijeme</legend>
                    <label for="postavi"><a href="?postavi=pomak" target="_blank">Postavi pomak</a></label><br>
                    <label for="dohvati"><a href="?virtualno=dohvati">Dohvati pomak</a></label><br>
                    <label for="promjeni"><a href="?virtualno=dohvati&primjeni=vrijeme">Primjeni pomak</a></label><br>
                </fieldset> 
                <input name="submit" type="submit" value="Potvrdi"> 
                </form></center>
            <form id="odaberiRadnju" method="post" name="OdabirRadnje" 
                   action="" novalidate>
                <label for="radnja">Odaberi željenu radnju:</label>
                <select id="odabir" name="odabir">
                    <option value="novo" selected="selected">Kreiranje nove konfiguracije</option>
                    <option value="staro">Uređivanje postojeće konfiguracije</option>
                </select>
                <input name="radnja" type="submit" value="Odaberi">
            </form>
            {if $radnja === "novo"}
             <form  enctype="multipart/form-data" id="formadodijeli" method="post" name="formadodijeli" 
                   action="" novalidate>
                    <label for="kolacici" id="kolacicil">Trajanje kolačića:</label>
                    <input type="time" id="kolacici" name="kolacici"><br>
                    <label for="stranicenje" id="stranicenjel">Broj redaka za straničenje:</label>
                    <input type="number" id="stranicenje" name="stranicenje"><br>
                    <label for="sesija" id="sesijal">Trajanje sesije:</label>
                    <input type="time" id="sesija" name="sesija"><br>
                    <label for="prijava" id="prijaval">Broj neuspješnih prijava:</label>
                    <input type="number" id="prijava" name="prijava"><br>  
                    <input name="konfiguriraj" type="submit" value="Konfiguriraj">
                    </form>
            {/if}
            {if $radnja === "staro"}
                  <form  enctype="multipart/form-data" id="formaodaberi" method="post" name="formaodaberi" 
                   action="" novalidate>
                      <label for="id_konfiguracije" id="id_konfiguracijel">Odaberi id konfiguracije za uređivanje:</label>
                     <select id="id_konfiguracije" name="id_konfiguracije">
                    {section name=i loop=$red}
                    <option value={$red[i].id}>{$red[i].id}</option>
                    {/section}
                     </select>
                     <input name="id_konfiguracija" type="submit" value="Odaberi">
                    </form>
              {/if}
              {if isset($id_konfiguracija)}
                    <form  enctype="multipart/form-data" id="formazuriraj" method="post" name="formazuriraj" 
                   action="" novalidate>
                     <label for="id_konf" id="id_konfl">Id konfiguracije:</label>
                    <input type="number" id="id_konf" name="id_konf" value={$id_konfiguracija}><br>
                    <label for="kolacici" id="kolacicil">Trajanje kolačića:</label>
                    <input type="time" id="kolacici" name="kolacici" value={$kolacici}><br>
                    <label for="stranicenje" id="stranicenjel">Broj redaka za straničenje:</label>
                    <input type="number" id="stranicenje" name="stranicenje" value={$stranicenje}><br>
                    <label for="sesija" id="sesijal">Trajanje sesije:</label>
                    <input type="time" id="sesija" name="sesija" value={$sesija}><br>
                    <label for="prijava" id="prijaval">Broj neuspješnih prijava:</label>
                    <input type="number" id="prijava" name="prijava" value={$prijava}><br>  
                    <input name="uredi_konfiguraciju" type="submit" value="Konfiguriraj">
                    </form>
               {/if}
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
</section>
