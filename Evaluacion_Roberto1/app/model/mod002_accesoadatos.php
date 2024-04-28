<?php

require "mod001_kernel.php";

function mod002_executeQuery($strSQL, $arAttributes){

		$link = mod001_conectoBD();


		if ($result = $link->query($strSQL)) {
			if ($result->num_rows !== 0) {
				$arRetorno["status"]["codError"] = "000"; 
				$arRetorno["status"]["numRows"] = $result->num_rows;
				$arRetorno["status"]["strSQL"] = $strSQL;

				$i = 0;
				while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
					foreach ($arAttributes as $element) {
						if (isset ($element[2])) {
							if ($element[2] === "bool") {
								$arRetorno["data"][$i][$element[1]] = (bool) $row[$element[0]];
							} else if ($element[2] === "int") {
								if ($row[$element[0]] !== null) {
									$arRetorno["data"][$i][$element[1]] = intval($row[$element[0]]);
								} else {
									$arRetorno["data"][$i][$element[1]] = null;
								}
							}
						} else {
							$arRetorno["data"][$i][$element[1]] = $row[$element[0]];
						}
					}

					$i++;
				}
			} else {
				$arRetorno["status"]["codError"] = "001"; 
				$arRetorno["status"]["strSQL"] = $strSQL;
			}
		} else {
			$arRetorno["status"]["codError"] = "002"; 
			$arRetorno["status"]["strSQL"] = $strSQL;
		}

		mod001_desconectoBD($link);

		return $arRetorno;
}

function mod002_writeQuery($strSQL, $messagesReturn = null){

		if ($messagesReturn === null) {
			$messagesReturn = [
				"000" => "Inserción/actualización correctamente realizada.",
				"001" => "Inserción/actualización no ha producido cambios.",
				"002" => "Error grave en la inserción/actualización."
			];
		}
		$link = mod001_conectoBD();
		if ($result = $link->query($strSQL)) {
			if ($link->affected_rows > 0) {
				$dataReturn["status"]["codError"] = "000"; 
				$dataReturn["status"]["affected_rows"] = $link->affected_rows;
			} else {
				$dataReturn["status"]["codError"] = "001"; 
				$dataReturn["status"]["strSQL"] = $strSQL; 
			}
		} else {
			$dataReturn["status"]["codError"] = "002"; 
			$dataReturn["status"]["strSQL"] = $strSQL; 
		}

		$dataReturn["status"]["messageError"] = $messagesReturn[$dataReturn["status"]["codError"]];
		mod001_desconectoBD($link);

		return $dataReturn;
}

function mod002_getMarcas(){

		$strSQL = "SELECT m.idmarca, m.nommarca, m.idlogo, l.nomlogo
			FROM marcas m
			INNER JOIN logos l ON m.idlogo = l.idlogo
			ORDER BY m.idmarca ASC;";

		$arAttributes = [
			["idmarca", "idBrand", "int"],
			["nommarca", "nameBrand"],
			["nomlogo", "nomlogo",]
		];


		return mod002_executeQuery($strSQL, $arAttributes);
}

function mod002_getDetailProduct($productoId){

		$strSQL = "SELECT p.idproducto, p.nomproducto, p.descripcion, i.nomimagen AS nombre_imagen
			FROM productos p
			LEFT JOIN imagenes i ON p.idproducto = i.idproducto
			WHERE p.idproducto = $productoId";

		$arAttributes = [
			["idproducto", "idProduct", "int"],
			["nomproducto", "nameProduct"],
			["descripcion", "description"],
			["nombre_imagen", "nameImg"]
		];

		return mod002_executeQuery($strSQL, $arAttributes);
}

function mod002_getDetailBrand($idBrand){

		$strSQL = "SELECT p.idproducto, p.nomproducto, p.precioproducto, p.idMarca, c.nomcategoria
					FROM productos p
					JOIN categorias c ON p.idCategoria = c.idCategoria
					WHERE p.idMarca = $idBrand
					ORDER BY p.idproducto ASC;";

		$arAttributes = [
			["idproducto", "idProduct", "int"],
			["nomproducto", "nameProduct"],
			["precioproducto", "prize"],
			["idMarca", "idBrand", "int"],
			["nomcategoria", "categoryName"]
		];

		return mod002_executeQuery($strSQL, $arAttributes);
}

function mod002_countProductsByBrand() {

		$strSQL = "SELECT idmarca, COUNT(idproducto) AS total_products
				FROM productos
				
				GROUP BY idmarca
				ORDER BY idmarca ASC;";
		
		$arAttributes = [
			["idmarca", "idBrand", "int"],
			["total_products", "totalProducts", "int"]
		];
		
		return mod002_executeQuery($strSQL, $arAttributes);
}

function mod002_getProductsPag($initialRegistry, $numRegistryByPage, $idBrand) {

		$strSQL = "SELECT `idproducto`, `nomproducto`, `precioproducto`, `idmarca`
			FROM `productos`
			WHERE `idmarca` = $idBrand
			LIMIT $numRegistryByPage OFFSET $initialRegistry";
			
		$arAttributes = [     
			["idproducto", "idProduct", "int"],
			["nomproducto", "nameProduct"],
			["precioproducto", "prize"],
			["idmarca", "idBrand", "int"]
		];
		
		return mod002_executeQuery($strSQL, $arAttributes);
}