<?php
/*********************************************************************************
Copyright (c) TamoDeOlho.

Este arquivo faz parte do parlamento virtual 
"TAMO DE OLHO".

Criado por: Péricles Lopes Machado <pericles.raskolnikoff@gmail.com>.


Tela inicial

*********************************************************************************/
if (!isset($_SESSION)) {
	session_start();
	setcookie("SID", SID);
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html">
	<meta charset="utf-8">

	<link href = "css/style.css" rel="stylesheet" type="text/css" />

	<script src="js/jquery-1.9.0.min.js"></script>

	<script>
		function login() {
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
						url: "ajax/autenticar.php"
					 }
				).done(
					function (msg) 
					{
						console.log(msg);
						var res = eval("("+msg+")");
						if (res.status) {
							$(".bg_home").load("inicial.php");
						} else {
							alert("Falha na autenticação!");
						}
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
			<h1>Autenticar</h1>	
			<input id="nome" type="text" placeholder="Login"/>
			<input id="senha" type="password" placeholder="Senha"/>
			<div id="autenticar">
				<a href="registrar.php" style="font-size: 12px;">Registrar usuário</a> 
				<button class="btn" onclick="login()">Autenticar</button>
			</div>
		</div>

	</center>
</body>

<?php
if (array_key_exists("nome", $_SESSION)) {
	echo "<script>";
	echo "$(\".bg_home\").load(\"inicial.php\");";
	echo "</script>";
}

?>

</html>

