$(document).ready(function () {
    naslov = $(document).find("title").text();

    switch (naslov) {
        case "Registracija":

            var greske = document.getElementById("korimeGreske");
            var specijalni_znakovi = ['=', '*', '/', '%'];

            $("#imeprezime").focusout(function () {
                greskeI = false;
                if ($("#imeprezime").val() === "") {
                    alert("ime i prezime ne smije biti prazno");
                    greskeI = true;
                }
                if (greskeI) {
                    $("#imeprezime").attr("style", "border-color:red");
                } else {
                    $("#imeprezime").attr("style", "border-color:none");
                }
            });

            $("#korime").focusout(function () {
                greskeK = false;
                if ($("#korime").val() === "") {
                    alert("korisničko ime ne smije biti prazno");
                    greskeK = true;
                }
                if ($("#korime").val().length < 5) {
                    alert("korisničko ime sadrži pre malo znakova");
                    greskeK = true;
                }
                if (greskeK) {
                    $("#korime").attr("style", "border-color:red");
                } else {
                    $("#korime").attr("style", "border-color:none");
                }
            });

            $("#email").focusout(function () {
                greskeE = false;
                var trazi = $("#email").val();
                var re = new RegExp(/^([^\W_][a-zA-Z0-9.+_-]{0,62}[^\W_])@([^\W_][a-zA-Z0-9.-]{0,251}[^\W_])\.(com|hr|info)$/);
                var ok = re.test(trazi);
                if (!ok)
                {
                    alert("Email ne poklapa predložak!");
                    greskeE = true;
                }
                if ($("#email").val() === "") {
                    alert("email ne smije biti prazan");
                    greskeE = true;
                }
                if (greskeE) {
                    $("#email").attr("style", "border-color:red");
                } else {
                    $("#email").attr("style", "border-color:none");
                }
            });

            $("#lozinka1").focusout(function () {
                greskeL = false;
                hasBigLetter = false;
                hasSmallLetter = false;
                hasNumber = false;
                if ($("#lozinka1").val().length < 15 || $("#lozinka1").val().length > 25) {
                    alert("lozinka mora imati između 15 i 25 znakova");
                    greskeL = true;
                }
                if ($("#lozinka1").val() === "") {
                    alert("lozinka ne smije biti prazna");
                    greskeL = true;
                }
                if (specijalni_znakovi.some(item => $("#lozinka1").val()[0].includes(item)) === true) {
                    alert("specijalni znak ne moze biti prvi znak lozinke!");
                    greskeL = true;
                }

                if (specijalni_znakovi.some(item => $("#lozinka1").val().endsWith(item)) === true) {
                    alert("specijalni znak ne moze biti zadnji znak lozinke!");
                    greskeL = true;
                }
                if ($("#lozinka1").val().indexOf(' ') !== -1) {
                    alert("lozinka ne smije sadržavati razmak!");
                }

                for (i = 0; i < $("#lozinka1").val().length; i++) {

                    let charCode = $("#lozinka1").val().charCodeAt(i);

                    if (charCode > 47 && charCode < 58) {
                        hasNumber = true;
                    }
                    if (charCode > 64 && charCode < 91) {
                        hasBigLetter = true;
                    }
                    if (charCode > 96 && charCode < 123) {
                        hasSmallLetter = true;
                    }
                }
                if (!hasBigLetter || !hasSmallLetter || !hasNumber) {
                    alert("lozinka nema potrebne znakove!");
                    greskeL = true;
                }
                if (greskeL) {
                    $("#lozinka1").attr("style", "border-color:red");
                } else {
                    $("#lozinka1").attr("style", "border-color:none");
                }
            });

            $("#lozinka2").focusout(function () {
                greskePL = false;
                if ($("#lozinka1").val() !== $("#lozinka2").val()) {
                    alert("lozinka i ponovljena lozinka nisu jednake");
                    greskePL = true;
                }
                if ($("#lozinka2").val() === "") {
                    alert("ponovljena lozinka ne smije biti prazna");
                    greskePL = true;
                }
                if (greskePL) {
                    $("#lozinka2").attr("style", "border-color:red");
                } else {
                    $("#lozinka2").attr("style", "border-color:none");
                }
            });

            $("#formaR").submit(function (event) {
                if ($("#imeprezime").val() === "" || $("#korime").val() === "" || $("#lozinka1").val() === "" || $("#lozinka2").val() === "" || $("#email").val() === "") {
                    event.preventDefault();
                    alert("Morate popuniti sve vrijednosti u obrascu!");
                }
                if (greskePL || greskeL || greskeE || greskeK || greskeI) {
                    event.preventDefault();
                    alert("Postoje greške u obrascu!");
                }
            });
            $("#korime").focusout(function () {
                greske.innerHTML = "";
                $.ajax({
                    url: "../korimena.php",
                    type: "GET",
                    dataType: "json",
                    success: function (json) {
                        for (let i = 0; i < json.length; i++) {
                            if (json[i].includes($("#korime").val()) && $("#korime").val() !== "") {
                                greske.innerHTML += "Korisničko ime zauzeto. Unesite drugo korime!<br>";
                                $("#korime1").attr("style", "color:red");
                                document.cookie = "postoji=1";
                            }
                            var stranica = json.find(e => e.includes(document.getElementById("korime").value));
                            if (stranica === undefined || stranica.length === 0) {
                                $("#korime1").attr("style", "color:green");
                                document.cookie = "postoji=0";
                            }
                        }

                    }
                });

            });

            break;

        case "Proizvodi po kampanji":
            var podaci = new Array();
            for (i = 1; i < document.getElementById("tablica").rows.length; i++) {
                podaci.push(document.getElementById("tablica").rows[i].cells[2].innerHTML);
            }
            var boje = [0.2, 0.5, 0.8, 0.2, 0.7, 0.6, 0.9, 0.8, 0.3, 0.1];
            var platno = document.getElementById("platno");
            var ctx = platno.getContext("2d");
            ctx.fillStyle = "rgb(0, 0, 0)";
            ctx.strokeRect(40, 0, 380, 400);
            for (var i = 0; i < podaci.length; i++) {
                var d = (podaci[i] / 100) * 900;
                var c = boje[i] * 255;
                var z = boje[i + 1] * 255;
                var p = boje[i + 2] * 255;
                var boja = "rgb(" + c + "," + z + "," + p + ")";
                ctx.fillStyle = boja;
                ctx.fillRect(100 + 40 * (i - 1), 400 - d, 38, 400);

            }
            break;
        case "Proizvodi po moderatoru":
            var podaci = new Array();
            for (i = 1; i < document.getElementById("tablica").rows.length; i++) {
                podaci.push(document.getElementById("tablica").rows[i].cells[2].innerHTML);
            }
            var boje = [0.2, 0.5, 0.8, 0.2];
            var platno = document.getElementById("platno");
            var ctx = platno.getContext("2d");
            ctx.fillStyle = "rgb(0, 0, 0)";
            ctx.strokeRect(40, 0, 200, 400);
            for (var i = 0; i < podaci.length; i++) {
                var d = (podaci[i] / 100) * 500;
                var c = boje[i] * 255;
                var z = boje[i + 1] * 255;
                var p = boje[i + 2] * 255;
                var boja = "rgb(" + c + "," + z + "," + p + ")";
                ctx.fillStyle = boja;
                ctx.fillRect(100 + 40 * (i - 1), 400 - d, 38, 400);

            }
            break;

        default:

            break;
    }
});




