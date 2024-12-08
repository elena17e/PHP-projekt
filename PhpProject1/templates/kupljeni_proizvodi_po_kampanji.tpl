<section id="sadrzaj">  
    <form  enctype="multipart/form-data" id="filtriraj" method="get" name="filtriraj" action="" novalidate>
                           <label for="trazi" id="trazil">Trazi:</label>
                          <input type="text" id="trazi" name="trazi">
                          <input name="filtriraj1" type="submit" value="Filtriraj po Idi-ju"> 
                          </form>
            <table id="tablica">
                <caption>Kupljeni proizvodi po kampanji</caption>
                <thead>
                    <tr>
                        <th>Id kampanje<a href="?id=A">▲</a><a href="?id=D">▼</a></th>
                       <th>Broj kupljenih proizvoda</th>
                       <th>Postotak</th>
                    </tr>
                </thead>
                <tbody>
  
                   {foreach $red as $key => $value}
                            <tr>
                                <td style="text-align: center">{$key}</td> 
                                 <td style="text-align: center">{$value}</td>
                                 <td style="text-align: center">{round(($value / $ukupan_broj) * 100)} </td>
                            </tr>
                        {/foreach}
                        {if !$red}
                              <tr>
                                <td style="text-align: center;" colspan="2">Ne postoji ni jedan kupljeni proizvod u kampanjama!</td>
                            </tr>
                        {/if}
            </tbody>
            </table>
            <h2>Graf</h2>
            <canvas id="platno" width="600" height="400">
            </canvas>
<div style="display: inline; position: relative; float: left; ">
    <p>Legenda</p>
<script>var id = new Array();
for(i=1; i< document.getElementById("tablica").rows.length; i++){ 
id.push(document.getElementById("tablica").rows[i].cells[0].innerHTML);
}</script>    
<div class="square1">id=<script>document.write(id[0]);</script></div>
<div class="square2">id=<script>document.write(id[1]);</script></div>
<div class="square3">id=<script>document.write(id[2]);</script></div>
<div class="square4">id=<script>document.write(id[3]);</script></div>
<div class="square5">id=<script>document.write(id[4]);</script></div>
<div class="square6">id=<script>document.write(id[5]);</script></div>
<div class="square7">id=<script>document.write(id[6]);</script></div>
</div>

<h2>Ispis</h2>
<div style="justify-content: center;
  align-items: center; text-align: center;">
<button onclick="window.print();" style="width: 200px; height: 25px;" >Print</button>
  </div>
</section>
