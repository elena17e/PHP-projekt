<section id="sadrzaj">  
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po korimenu"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po nadimku">
                          </form>
            <table id="tablica">
                <caption>Ispis korisnika</caption>
                <thead>
                    <tr>
                        <th>Id korisnika</th>
                        <th>Korisničko ime<a href="?page={$dohvati_str}&korime=A">▲</a><a href="?page={$dohvati_str}&korime=D">▼</a></th>
                        <th>Nadimak<a href="?page={$dohvati_str}&nadimak=A">▲</a><a href="?page={$dohvati_str}&nadimak=D">▼</a></th>
                        <th>Ime i Prezime</th>
                        <th>Email</th>
                        <th>Lozinka</th>
                        <th>Tip korisnika</th>
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td>{$red[i].id}</td>
                                <td>{$red[i].korisnicko_ime}</td> 
                                 <td>{$red[i].nadimak}</td>
                                <td>{$red[i].ime_i_prezime}</td>   
                                <td>{$red[i].email}</td>
                                <td>{$red[i].lozinka}</td>
                                <td>{$red[i].tip_id}</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="7">Ne postoji ni jedan korisnik!</td>
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
                 
              
