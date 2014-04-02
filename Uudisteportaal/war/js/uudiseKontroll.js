function kontrolliUudist() {
	var veateade = "Viga: \n";
	
	var pealkiri = document.getElementById("#Pealkiri").value;
	var sisu = document.getElementById("#Sisu").value;
	var pildi_url = document.getElementById("#Pildi_url").value;
	var tags = document.getElementById("#Tags").value;
	var latitude = document.getElementById("#latitude").value;
	var longitude = document.getElementById("#longitude").value;
	
	if(pealkiri==""){
		veateade = veateade + "Pealkiri puudub \n"
		$("#Pealkiri").addClass("has-error");
	}
	if(sisu==""){
		veateade = veateade + "Sisu puudub \n"
		$("#Sisu").addClass("has-error");
	}
	if(pildi_url=""){
		veateade = veateade + "Pildi aadress puudub \n"
		$("#Pildi_url").addClass("has-error");
	}
	else{
		try{
			//pildi suuruse kontroll
			var img = new Image();
			var pikkus;
			var laius;
			img.onload = function() {
				pikkus = this.height;
				laius = this.width;
			}
			img.src = pildi_url;
			//kui on liiga suur
			if(laius > lubatudLaius || pikkus > lubatudPikkus){
				veateade = veateade + "Pilt on liiga suur: \n" + "   Lubatud x= " + lubatudLaius + " (Praegu=" + laius + ")\n" 
				+ "   Lubatud y= " + lubatudPikkus + " (Praegu=" + pikkus + ")\n";
			}
		} catch(error) {
			veateade = veateade + "Error: " + error + "\n\n" + "Ilmselt pole tegemist pildiga.\n";
		}
		
	}
	if(latitude=""){
		veateade = veateade + "latitude puudub \n"
		$("#latitude").addClass("has-error");
	}
	if(longitude=""){
		veateade = veateade + "longitude puudub"
		$("#longitude").addClass("has-error");
	}
	
	if(veateade!="Viga: \n"){
		alert(veateade);
	}
	else{
		$.post("lisaUudis", function(){
			alert("Uudis lisatud");
		});
	}
}