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
	}
	if(sisu==""){
		veateade = veateade + "Sisu puudub \n"
	}
	if(pildi_url=""){
		veateade = veateade + "Pildi aadress puudub \n"
	}
	if(latitude=""){
		veateade = veateade + "latitude puudub \n"
	}
	if(longitude=""){
		veateade = veateade + "longitude puudub"
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