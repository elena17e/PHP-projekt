<section id="sadrzaj">
    {if (!$profil)}
                 <h1 class="tekst">Kreiraj profil</h1>
                 <div id="Profildiv">
                <form  enctype="multipart/form-data" id="formaProfil" method="post" name="formaProfil" 
                   action="" novalidate>
                    <label for="nadimak" id="nadimakl">Željeni nadimak: </label>
                    <input type="text" id="nadimak" name="nadimak" maxlength="50" size="30"><br><br> 
                    <label for="slika" id="slikal">Slika: </label>
                    <input type="file" name="slika" id="slika"/><br><br>
                    <input type="hidden" name="MAX_FILE_SIZE" value="30000"/>
                    <input type="submit" value="Kreiraj profil"  name="potvrdiProfil" id="posalji">
                </form>    
                
                {if isset($greska)}
                    <p>{$greska}</p>
                {/if}
           
                {if isset($greska1)}
                    <p>{$greska1}</p>
                {/if}
            </div>
         {else}
          <h1 class="tekst">Moj Profil</h1> 
          <div class="Osobnipodaci">
            <img src={$profilna} alt="profilna" width="300" height="400"/>
            <p >{$nadimak}</p>     
          </div>
          <h2>Stanje bodova</h2>
          <p>Trenutni bodovi: {$bodovi} </p>
          <h2>Kupljeni proizvodi</h2>
            <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po nazivu"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po opisu">
                          </form>
                   <table id="tablica">
                <caption>Moje kupnje</caption>
                <thead>
                    <tr>
                        <th>Naziv<a href="?naziv=A">▲</a><a href="?naziv=D">▼</a></th>
                        <th>Opis</th>
                        <th>Slika</th>
                        <th>Cijena<a href="?cijena=A">▲</a><a href="?cijena=D">▼</a></th>
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td>{$red[i].naziv}</td> 
                                <td>{$red[i].opis}</td>
                                <td><img src="{$red[i].slika}" alt="kupljeni_proizvod" width="200" height="200"/></td>   
                                <td>{$red[i].cijena} €</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="4">Nije pronađena ni jedna kupnja!</td>
                            </tr>
                        {/if}
            </tbody>
                   </table>
           
       {/if}
       
</section>
