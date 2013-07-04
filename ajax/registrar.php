<?php
/*********************************************************************************
Copyright (c) TamoDeOlho.

Este arquivo faz parte do parlamento virtual 
"TAMO DE OLHO".

Criado por: Péricles Lopes Machado <pericles.raskolnikoff@gmail.com>.


SCRIPT DE AUTENTICAÇÃO DO SISTEMA


*********************************************************************************/

if (!isset($_SESSION)) {
	session_start();
	setcookie("SID", SID);
}

include_once("../config.php");

$mysqli = new mysqli($bd_url, $bd_usuario, $bd_senha, $bd_nome);

$nome = $_POST['nome'];
$senha = md5($_POST['senha']);

$stmt = $mysqli->prepare(
"SELECT nome, senha FROM usuario WHERE nome = ? AND senha = ?"
);
$stmt->bind_param("ss", $nome, $senha);
$stmt->execute();

$nome_ = $senha_ = "";
$stmt->bind_result($nome_, $senha_);

if ($stmt->fetch()) {
	$stmt->close();

	echo "{status: 0}";
} else {
	$stmt->close();
	$stmt = $mysqli->prepare(
	"INSERT INTO usuario(nome, senha) VALUES(?,?)"
	);
	$stmt->bind_param("ss", $nome, $senha);
	$stmt->execute();

	echo "{status: 1}";
}

$mysqli->close();
?>

