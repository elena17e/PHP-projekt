<section id="sadrzaj" style="margin-bottom: 150px;">
                    <h1 class="tekst">Kupi proizvod</h1>
                    <div style="   margin-top: 50px;
    border-radius: 5px;
    border-style: dotted;
    border-width: 1px;
    color: #eebd2a;">
                <form novalidate id="formaCijena" method="post" name="formaCijena" action="">
                    <label for="cijena" id="cijenal">Unesite cijenu: </label>
                    <input type="number" id="cijena" name="cijena"><br>
                    <input type="submit" value="Provedi kupnju"  name="potvrdiK" id="posalji">
                     </form> 
                    <div style="color: white;">
                    {if isset($greskaCijena)}
                    <p>{$greskaCijena}</p>
                     {/if}
                    </div>
                    <p style=" text-align: center;">ili</p>
                    <form novalidate id="formaBodovi" method="post" name="formaBodovi" action="">
                    <input type="submit" value="Iskoristi bodove"  name="iskoristiBodove" id="iskoristi">
                    <a href="otvorene_kampanje.php"><input type="button" value="Odustani"  name="odustani"></a>
                      <div style="color: white;">
                    {if isset($greskaBodovi)}
                    <p>{$greskaBodovi}</p>
                     {/if}
                    </div>
                </form>
                    </div>
                     <div id="poruka" style="color: white;">
            {if isset($poruka)} 
                <p>{$poruka}</p>
            {/if}
                </div> 
                
</section>
