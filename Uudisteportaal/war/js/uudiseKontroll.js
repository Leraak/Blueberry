$(document).ready(function() {
	$('#lisa').attr('disabled', true);
});

function kontrolliUudist() {
	var veateade = "Viga: \n";
	
	var pealkiri = $("#Pealkiri").val();
	var sisu = $("#Sisu").val();
	var pildi_url = $("#Pildi_url").val();
	
	if(pealkiri==""){
		veateade = veateade + "Pealkiri puudub \n"
		$('#lisa').attr('disabled', true);
	}
	
	if(sisu==""){
		veateade = veateade + "Sisu puudub \n"
		$('#lisa').attr('disabled', true);
	}

	if(pildi_url==""){
		veateade = veateade + "Pildi URL puudub \n";
		$('#lisa').attr('disabled', true);
		alert(veateade);
	}
	else if(pildi_url!=""){
		try{
			//pildi suuruse kontroll
			var lubatudLaius = 390;
			var lubatudPikkus = 250;
			var img = new Image();
			try{
				img.onload = function() {
					 	var pikkus = this.height,
						laius = this.width;
					 	//kui on liiga suur
						if(laius > lubatudLaius || pikkus > lubatudPikkus){
							veateade = veateade + "Pilt on liiga suur: \n" + "   Lubatud x= " + lubatudLaius + " (Praegu=" + laius + ")\n" 
							+ "   Lubatud y= " + lubatudPikkus + " (Praegu=" + pikkus + ")\n";
						}
						
						if(veateade!="Viga: \n"){
							alert(veateade);
							$('#lisa').attr('disabled', true);
						}
						else if (veateade=="Viga: \n"){
							$('#lisa').attr('disabled', false);
						}
				}
			}
			catch(error){
				veateade = veateade + "Error: " + error + "\n\n" + "Ilmselt pole tegemist pildiga.\n";
			}
			img.src = pildi_url;
		} catch(error) {
			veateade = veateade + "Error: " + error + "\n\n" + "Ilmselt pole tegemist pildiga.\n";
		}
	}
	
}