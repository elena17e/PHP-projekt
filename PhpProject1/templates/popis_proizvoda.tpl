<section id="sadrzaj">  
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po nazivu"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po opisu">
                          </form>
            <table id="tablica">
                <caption>Ispis proizvoda</caption>
                <thead>
                    <tr>
                        <th>Id proizvoda</th>
                        <th>Naziv<a href="?page={$dohvati_str}&naziv=A">▲</a><a href="?page={$dohvati_str}&naziv=D">▼</a></th>
                        <th>Opis</th>
                        <th>Slika</th>
                        <th>Količina<a href="?page={$dohvati_str}&kolicina=A">▲</a><a href="?page={$dohvati_str}&kolicina=D">▼</a></th>
                        <th>Cijena</th>
                        <th>Status</th>
                        <th>Bodovi</th>
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td><a href="kreiraj_proizvod.php?id={$red[i].id}">{$red[i].id}</a></td>
                                <td>{$red[i].naziv}</td> 
                                <td>{$red[i].opis}</td>
                                <td><img src="{$red[i].slika}" alt="slika_proizvod" width="200" height="200"/></td>   
                                <td>{$red[i].kolicina}</td>
                                <td>{$red[i].cijena}</td>
                                <td>{$red[i].status_proizvoda}</td>
                                <td>{$red[i].bodovi}</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="8">Ne postoji ni jedan proizvod!</td>
                            </tr>
                        {/if}
            </tbody>
            </table>
  {if (ceil($broj_stranica / $rezultati_na_stranici) > 0)}
<ul class="pagination">
	{if ($stranica > 1)}
	<li class="prev"><a href="?page={$stranica-1}">Prethodna</a></li>
	{/if}

	{if ($stranica > 3)}
	<li class="start"><a href="?page=1">1</a></li>
	<li class="dots">...</li>
	{/if}

	{if ($stranica-2 > 0)}<li class="page"><a href="?page={$stranica-2}">{$stranica-2 }</a></li>{/if}
	{if ($stranica-1 > 0)}<li class="page"><a href="?page={$stranica-1}">{$stranica-1}</a></li>{/if}

	<li class="currentpage"><a href="?page={$stranica}">{$stranica}</a></li>

	{if ($stranica+1 < ceil($broj_stranica / $rezultati_na_stranici)+1)}<li class="page"><a href="?page={$stranica+1}">{$stranica+1}</a></li>{/if}
	{if ($stranica+2 < ceil($broj_stranica / $rezultati_na_stranici)+1)}<li class="page"><a href="?page={$stranica+2}">{$stranica+2}</a></li>{/if}

	{if ($stranica < ceil($broj_stranica / $rezultati_na_stranici)-2)}
	<li class="dots">...</li>
	<li class="end"><a href="?page={ceil($broj_stranica / $rezultati_na_stranici)}">{ceil($broj_stranica / $rezultati_na_stranici)}</a></li>
	{/if}

	{if ($stranica < ceil($broj_stranica / $rezultati_na_stranici))}
	<li class="next"><a href="?page={$stranica+1}">Sljedeća</a></li>
	{/if}
</ul>
{/if}
        </section>
                 
              
