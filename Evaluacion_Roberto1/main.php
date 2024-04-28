<?php
	session_start();
	require "app/model/mod004_presentacion.php";


	$listBrand = mod004_getMarcas();

	require "public/vista/vista_main.php";
