<section id="sadrzaj" style="margin-bottom: 200px;"> 
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po korimenu"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po imenu">
                          </form>
            <table id="tablica">
                <caption>Zaključani korisnički računi</caption>
                <thead>
                    <tr>
                        <th>Id korisnika</th>
                        <th>Korisničko ime<a href="?korime=A">▲</a><a href="?korime=D">▼</a></th>
                        <th>Ime i Prezime<a href="?imeprezime=A">▲</a><a href="?imeprezime=D">▼</a></th>
                        <th>Email</th>
                        <th>Tip korisnika</th>
                        <th>Broj unosa</th>  
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td>{$red[i].id}</td>
                                <td>{$red[i].korisnicko_ime}</td> 
                                <td>{$red[i].ime_i_prezime}</td>   
                                <td>{$red[i].email}</td>
                                <td>{$red[i].tip_id}</td>
                                <td>{$red[i].broj_unosa}</td>
                               <td><a href="zakljucani_racuni.php?id_otkljucaj={$red[i].id}">Otključaj</a></td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                    <td style="text-align: center;" colspan="6">Nema zaključanih računa korisnika!</td>
                            </tr>
                        {/if}
            </tbody>
            </table>
            <h2 class="tekst">Blokiraj korisnika</h2>
            <form  enctype="multipart/form-data" id="formaBlokiraj" method="post" name="formaBlokiraj" 
                   action="" novalidate>
                  <label for="korisnik" id="korisnikl">Korisnik:</label>
                     <select id="korisnik" name="korisnik">
                    {section name=i loop=$red1}
                    <option value={$red1[i].id}>{$red1[i].id}</option>
                    {/section}
                     </select><br>
                 <input name="blokiraj" type="submit" value="Blokiraj">
                 </form>
                 <div id="poruka" style="text-align: center;">
                {if isset($poruka)}
                    <p>{$poruka}</p>
                {/if}
            </div>
        </section>
