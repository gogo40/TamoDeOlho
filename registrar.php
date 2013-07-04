<?php
/*********************************************************************************
Copyright (c) TamoDeOlho.

Este arquivo faz parte do parlamento virtual 
"TAMO DE OLHO".

Criado por: Péricles Lopes Machado <pericles.raskolnikoff@gmail.com>.


Tela de registro de usuário

*********************************************************************************/

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html">
	<meta charset="utf-8">

	<link href = "css/style.css" rel="stylesheet" type="text/css" />

	<script src="js/jquery-1.9.0.min.js"></script>

	<script>
		function registrar() {
			var nome = $("#login").val();
			var senha = $("#senha").val();

			jQuery
				.ajax(
					{
						type: "POST",
						data: 
						{ 
							nome: nome,
							senha: senha
						},
						url: "ajax/registrar.php"
					 }
				).done(
					function (msg) 
					{
						console.log(msg);
					}
				);
		}
	</script>

	<title>Tamo de Olho</title>
</head>

<body class="bg_home">
	
	<center>
		<div id="titulo" title="O parlamento ao seu alcance">Tamo de Olho</div>

		<div id="login">
			<h1>Registrar usuário</h1>			
			<input id="nome" type="text" placeholder="Login"/>
			<input id="senha" type="password" placeholder="Senha"/>
			<div id="autenticar"><button class="btn" onclick="registrar()">Registrar</button></div>
		</div>

	</center>
</body>

</html>
