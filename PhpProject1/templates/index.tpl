<section id="sadrzaj">
{if !isset($uvijeti) || isset($resetiraj)}
    <div id="pokazi_uvijete">
<div style="font-size: 50px;"><center><strong>kampanja.hr</strong></center></div>
    <center><p style="width: 30%;">Uz Vaš pristanak, mi i naši partneri koristimo kolačiće ili slične tehnologije za pohranu, pristup i obradu osobnih podataka kao što je vaš posjet ovoj web-stranici, IP adrese i identifikatore kolačića. Neki partneri ne traže Vašu privolu za obradu Vaših podataka i oslanjaju se na svoj legitimni poslovni interes. U bilo kojem trenutku možete povući svoj pristanak ili se usprotiviti obradi podataka na temelju legitimnog interesa u našim Pravilima zaštite privatnosti na ovoj web-stranici. 
            Mi i naši partneri obrađujemo podatke kako slijedi:
            Pohranjivanje i / ili pristup podacima na uređaju, Precizni geolokacijski podaci i identifikacija pregledavanjem uređaja, Prilagođeni oglasi i sadržaj, mjerenje oglasa i sadržaja, uvidi o publici, razvoj proizvoda</p></center>
        <center><form novalidate id="formaPrihvati" method="post" name="formaPrihvati" action="index.php">
            <input type="submit" value="Prihvati i zatvori"  name="uvijeti" id="prihvatiMe">
            </form></center>
    </div>
{else}
    <h1>Promocija</h1>
    <center><p>Dobrodošli na našu stranicu! Za početak možete vidjeti popis svih kampanja koje nudimo</p></center>
      <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="od" id="odl">Od:</label>
                          <input type="datetime-local" id="od" name="od">
                          <label for="do" id="dol">Do:</label>
                          <input type="datetime-local" id="do" name="do">
                          <input name="filtriraj1" type="submit" value="Filtriraj po datumu završetka"> 
                          <input name="filtriraj2" type="submit" value="Filtriraj po datumu početka">
                          </form>
            <table id="tablica">
                <caption>Ispis kampanja</caption>
                <thead>
                    <tr>
                        <th>Id kampanje</th>
                        <th>Naziv<a href="?page={$dohvati_str}&naziv=A">▲</a><a href="?page={$dohvati_str}&naziv=D">▼</a></th>
                        <th>Opis</th>
                        <th>Početak kampanje</th>
                        <th>Završetak kampanje</th>
                        <th>Količina proizvoda<a href="?page={$dohvati_str}&kolicina=A">▲</a><a href="?page={$dohvati_str}&kolicina=D">▼</a></th>
                    </tr>
                </thead>
                <tbody>
  
                   {section name=i loop=$red}
                            <tr>
                                <td><a href="kreiraj_kampanju.php?id={$red[i].id}">{$red[i].id}</a></td>
                                <td>{$red[i].naziv}</td> 
                                <td>{$red[i].opis}</td>
                                <td>{$red[i].datum_vrijeme_pocetka}</td>   
                                <td>{$red[i].datum_vrijeme_zavrsetka}</td>
                                <td>{$red[i].kolicina}</td>
                            </tr>
                        {/section}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="6">Ne postoji ni jedna kampanja!</td>
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
            {/if}
        </section>
