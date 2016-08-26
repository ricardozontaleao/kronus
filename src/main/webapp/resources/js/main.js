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
					$.each(data.empresas, function(index, value) {
						trHTML += '<tr><td>' + value.cnpj + '</td><td>'
								+ value.razaoSocial + '</td></tr>';
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

			$('#formCadastroEmpresaButton').click(function() {
				var empresa = {};
				empresa["cnpj"] = $("#cnpj").val();
				empresa["razaoSocial"] = $("#razaoSocial").val();
				
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "http://localhost:8080/kronus/salvar",
					empresa: JSON.stringify(empresa),
					async : false,
					dataType : "json",
					success : function(empresa) {
						alert(empresa);
						console.log(empresa);
						$("#formCadastroEmpresa").submit();
					},
					error : function(e) {
						console.log("ERROR: ", e);
					}

				});
			});
		});
