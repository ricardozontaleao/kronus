$(document).ready(function() {

	var data = {}
	data["query"] = $("#query").val();
	
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "http://localhost:8080/kronus/",
		data : JSON.stringify(data),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			var trHTML = '';
	        $.each(data.empresas, function (index, value) {
	            trHTML += '<tr><td>' + value.cnpj + '</td><td>' + value.razaoSocial + '</td></tr>';
	        });
	        
	        $('#empresas').append(trHTML);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

});
