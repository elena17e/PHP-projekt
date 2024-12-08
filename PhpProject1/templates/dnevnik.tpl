<section id="sadrzaj"> 
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="od" id="odl">Od:</label>
                          <input type="datetime-local" id="od" name="od">
                          <label for="do" id="dol">Do:</label>
                          <input type="datetime-local" id="do" name="do">
                          <input name="filtriraj1" type="submit" value="Filtriraj po datumu"> 
                          </form>
     <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj1" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="number" id="trazi" name="trazi">
                          <input name="filtriraj2" type="submit" value="Filtriraj po korisniku"> 
                          <input name="filtriraj3" type="submit" value="Filtriraj po radnji">
                          </form>
            <table id="tablica">
                <caption>Ispis iz dnevnika</caption>
                <thead>
                    <tr>
                      <th>Datum radnje<a href="?page={$dohvati_str}&datum=A">▲</a><a href="?page={$dohvati_str}&datum=D">▼</a></th>
                       <th>Korisnik</th>
                       <th>Naziv radnje<a href="?page={$dohvati_str}&naziv=A">▲</a><a href="?page={$dohvati_str}&naziv=D">▼</a></th>
                       <th>Tip radnje</th>
                      <th>Upit</th>
                    </tr>
                </thead>
                <tbody>
                      {section name=i loop=$red}
                            <tr>
                                <td>{$red[i].datum_vrijeme}</td> 
                                <td>{$red[i].korisnik_id}</td>
                                <td>{$red[i].radnja}</td> 
                                <td>{$red[i].tip_id}</td>
                                <td>{$red[i].upit}</td>
                            </tr>
                        {/section}

                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="5">Ne postoji ni jedan zapis u dnevniku!</td>
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