  <section id="sadrzaj">
            <h1 class="tekst">Definiraj uvijete za proizvod</h1>
            <form  enctype="multipart/form-data" id="formaUvijeti" method="post" name="formaUvijeti" 
                   action="" novalidate>
                    <label for="bodovi" id="bodovil">Osvojeni bodovi kupnjom:</label>
                    <input type="number" id="bodovi" name="bodovi"><br>
                     <label for="cijena" id="cijenal">Cijena proizvoda u bodovima:</label>
                    <input type="cijena" id="cijena" name="cijena"><br>
                    <input name="submit" type="submit" value="Potvrdi">
                    </form>
              <div id="greske" style="text-align: center">
                {if isset($greska)}
                    <p>{$greska}</p>
                {/if}
            </div>
                   <div id="poruka" style="text-align: center; margin-bottom: 260px;">
                {if isset($poruka)}
                    <p>{$poruka}</p>
                {/if}
            </div> 
</section>
