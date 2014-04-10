var loendi;
var uuenda;

function getNewComments(){

	console.log("Võtan uudist");
	var last_id = $('.bscomment').last().attr('id').split('-')[1];
	var uudise_id = $('#uudise_id').val();
	
	$.ajax({
		url: "/uuendakommentaare",
		type: "POST",
		data: {
			'last_id' : last_id,
			'uudise_id': uudise_id
		},
		success: function(data){
			console.log("Õnnestus");
			$('#comments_holder').append(data);
			//scroll
			$('#comments_holder').animate({
		        scrollTop: $("#comments_holder").offset().top
		    }, 2000, "linear");
		}, complete: function(){
			if(loendi==40){
				$('#new_comment_error_box').html('\
						<div class="alert alert-danger alert-dismissable">\
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\
						<strong>Hoiatus!</strong> Chati sessioon aegus, lisa uus kommentaar kui tahad jätkata.\
						</div>\
					')
				clearTimeout(uuenda);
			}
			else{
				uuenda=setTimeout(getNewComments, 4000);
				console.log("Count: " + loendi);
				loendi++;
			}
		}
	});
}

$(document).ready(function(){
	loendi = 0;
	getNewComments();

	$('#new_comment_submit').click(function(){
		loendi = 0;
		var new_comment_name = $('#new_comment_name').val();
		var new_comment_text = $('#new_comment_text').val();
		var uudise_id = $('#uudise_id').val();
		$.ajax({
			url: "/uuskommentaar",
			type: "POST",
			data: {
				'new_comment_name': new_comment_name,
				'new_comment_text': new_comment_text,
				'uudise_id': uudise_id,
			}, beforeSend: function(){
				$('#new_comment_submit').addClass('loading');
				$('#new_comment_submit').attr('disabled', true);
				$('#new_comment_text').attr('disabled', true);
				$('#new_comment_name').attr('disabled', true);
			},success: function(data){
				getNewComments();
				if(data != 1) {
					$('#new_comment_error_box').html('\
						<div class="alert alert-info">\
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\
						<strong>Viga!</strong> Kommentaari ei lisatud!\
						</div>\
					')
				}
			}, complete: function() {
				$('#new_comment_submit').removeClass('loading');
				$('#new_comment_submit').attr('disabled', false);
				$('#new_comment_text').attr('disabled', false).val('');
				$('#new_comment_name').attr('disabled', false).val('');
			}
		});
		return false;
	})
});