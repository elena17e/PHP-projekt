<section id="sadrzaj" style="margin-bottom: 200px;">
            <table id="tablica">
                <caption>Proizvodi u kampanji</caption>
                <thead>
                    <tr>
                         {if $session_uloga == 3}
                        <th>Opis<a href="?id_kampanja={$id_kampanja}&opis=A">▲</a><a href="?id_kampanja={$id_kampanja}&opis=D">▼</a></th>
                        <th>Cijena<a href="?id_kampanja={$id_kampanja}&cijena=A">▲</a><a href="?id_kampanja={$id_kampanja}&cijena=D">▼</a></th>
                         {/if}
                          {if $session_uloga < 3}
                            <th>Id</th>
                            <th>Naziv</th>
                            <th>Opis<a href="?id_kampanja={$id_kampanja}&opis=A">▲</a><a href="?id_kampanja={$id_kampanja}&opis=D">▼</a></th>
                            <th>Slika</th>
                            <th>Kolicina</th>
                            <th>Bodovi</th>
                           <th>Cijena<a href="?id_kampanja={$id_kampanja}&cijena=A">▲</a><a href="?id_kampanja={$id_kampanja}&cijena=D">▼</a></th>
                           {/if}
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                {if $session_uloga == 3}
                                <td>{$red[i].opis}</td>
                                <td>{$red[i].cijena}</td>
                                {/if}
                                 {if $session_uloga < 3}
                                 <td>{$red[i].id}</td>
                                 <td>{$red[i].naziv}</td>
                                 <td>{$red[i].opis}</td>
                                 <td><img src={$red[i].slika} alt="proizvod" width="200" height="200"/></td>
                                 <td>{$red[i].kolicina}</td>
                                 <td>{$red[i].bodovi}</td>
                                <td>{$red[i].cijena}</td> 
                                <td><a href="definiraj_uvijete.php?id_proizvod={$red[i].id}">Definiraj uvijete</a></td>
                                 {/if}
                               <td> {if ($red[i].kolicina > 0)}<a href="kupi_proizvod.php?id_proizvod={$red[i].id}&id_uvijeti={$red[i].uvijeti_i_cijena_id}">Kupi</a>{/if}</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                   {if $session_uloga == 3}
                                <td style="text-align: center;" colspan="2">Kampanja nema proizvoda!</td>
                                {/if}
                                {if $session_uloga < 3}
                                    <td style="text-align: center;" colspan="7">Kampanja nema proizvoda!</td>
                                {/if}
                            </tr>
                        {/if}
            </tbody>
            </table>
        </section>
