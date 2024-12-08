<section id="sadrzaj">  
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po nazivu"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po opisu">
                          </form>
            <table id="tablica">
                <caption>Otvorene kampanje</caption>
                <thead>
                    <tr>
                        <th>Id kampanje<a href="?id=A">▲</a><a href="?id=D">▼</a></th>
                        <th>Naziv<a href="?naziv=A">▲</a><a href="?naziv=D">▼</a></th>
                        <th>Opis</th>
                        <th>Početak kampanje</th>
                        <th>Završetak kampanje</th>
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td><a href="opis_cijena_proizvoda.php?id_kampanja={$red[i].id}">{$red[i].id}</a></td>
                                <td>{$red[i].naziv}</td> 
                                <td>{$red[i].opis}</td>
                                <td>{$red[i].datum_vrijeme_pocetka}</td>   
                                <td>{$red[i].datum_vrijeme_zavrsetka}</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="5">Ne postoji ni jedna otvorena kampanja!</td>
                            </tr>
                        {/if}
            </tbody>
            </table>
        </section>
                 
              
