<?php

	function mod001_conectoBD () {
		$direccion  = "localhost";
		$usuario    = "root";
		$contrasena = "";
		$database   = "proyectoroberto";
		
		$link = mysqli_connect( $direccion, $usuario, $contrasena, $database );
		if ( !$link ) {
			echo "conexion fallida";
		} 
		
		return $link;
	}

	function mod001_desconectoBD ( $link ) {
        mysqli_close( $link );
	}
