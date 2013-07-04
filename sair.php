<?php
/*********************************************************************************
Copyright (c) FATOR Z.

Este arquivo faz parte do sistema definitivo de simulações empresárias 
"MANAGER NATION".

Criado por: Péricles Lopes Machado <pericles.raskolnikoff@gmail.com>.


AÇÃO SAIR SEÇÃO
FUNÇÃO: Este script a ação sair seção.

*********************************************************************************/
if (!isset($_SESSION)) {
	session_start();
}

setcookie("SID", SID);

foreach ($_COOKIE as $key => $value) {
    setcookie($key, '', -10000);
}
session_destroy();

include_once("index.php");
?>
