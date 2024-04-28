<?php

require "mod003_logica.php";

function mod004_getMarcas(){

		$arDataMarcas = mod003_getMarcas();

		if ($arDataMarcas["status"]["codError"] === "000") {
					$listBrand = "<table><thead><tr><th>Nombre Marca</th><th>Logo</th></tr></thead><tbody>";
				foreach ($arDataMarcas["data"]["tbody"] as $key => $value) {
					$listBrand .= "<tr>";
					$listBrand .= "<td><a href='detailBrand.php?idbrand={$value["idBrand"]}'>{$value["nameBrand"]}</a></td>";
					$listBrand .= "<td><a href='detailBrand.php?idbrand={$value["idBrand"]}'><img src='public/media/images/logos/{$value["nomlogo"]}' alt='{$value["nomlogo"]} Logo' class='logo'></a></td>";
					$listBrand .= "</tr>";
				}
					$listBrand .= "</tbody>";
					$listBrand .= "<tfoot>";
					$listBrand .= "<tr>";
					$listBrand .= "</td>";
					$listBrand .= "</tfoot>";
					$listBrand .= "</table>";
			} else {
					$listBrand = "<p>No dispongo de datos en este momento. Por favor paciencia.</p>";
			}

		return $listBrand;
}

function mod004_getDetailBrand($idBrand){

		$arDetailProducts = mod002_getDetailBrand($idBrand);

		if ($arDetailProducts["status"]["codError"] === "000") {
					$listBrand = "<table border='1'><thead><tr><th>IdProducto</th><th>Nombre Producto</th><th>Precio</th><th>Categoria</th></tr></thead><tbody>";
				foreach ($arDetailProducts["data"] as $product) {
					$listBrand .= "<tr>";
					$listBrand .= "<td>{$product["idProduct"]}</td>";
					$listBrand .= "<td>{$product["nameProduct"]}</td>";
					$listBrand .= "<td>{$product["prize"]}</td>";
					$listBrand .= "<td>{$product["categoryName"]}</td>";
					$listBrand .= "</tr>";
				}
					$listBrand .= "</tbody></table>";
			} else {
					$listBrand = "<p>No hay productos asociados a esta marca en este momento.</p>";
			}

		return $listBrand;
}

function mod004_getProductsPag($currentPage, $numRegistryByPage, $idBrand){
	
		$arDetailProducts = mod002_getDetailBrand($idBrand);
		$startIndex = ($currentPage - 1) * $numRegistryByPage;
		$listProducts = ""; 

		if ($arDetailProducts["status"]["codError"] === "000") {
					$listProducts .= "<table class='product-table' border='1'><thead><tr><th>Nombre Producto</th><th>Precio</th><th>Categoria</th></tr></thead><tbody>";
				foreach (array_slice($arDetailProducts["data"], $startIndex, $numRegistryByPage) as $product) {
					$listProducts .= "<tr>";
					$listProducts .= "<td class='product'><a data-idproduct={$product["idProduct"]}>{$product["nameProduct"]}</a></td>";
					$listProducts .= "<td class='product'>{$product["prize"]}€</td>";
					$listProducts .= "<td class='product'>{$product["categoryName"]}</td>";
					$listProducts .= "</tr>";
				}
					$listProducts .= "</tbody></table>";
			} else {
			$listProducts = "<p>No hay productos asociados a esta marca en este momento.</p>";
			}

		return $listProducts;
}

function mod004_setLayerPagination($currentPage, $numRegistryByPage, $totalPages, $idBrand){

		$layerPag = "";
		$maxVisiblePages = 3; 

		$startPage = max(1, min($currentPage - floor($maxVisiblePages / 2), $totalPages - $maxVisiblePages + 1));
		$endPage = min($startPage + $maxVisiblePages - 1, $totalPages);


					$layerPag .= "<div class='pagination'>";

		if ($currentPage > 1) {
					$layerPag .= "<a href='detailBrand.php?idbrand={$idBrand}&currentPage=1' title='Ir a la primera página' class='pagination-link'>&lt;&lt;</a>";
			} else {
					$layerPag .= "<a href='javascript:void(0)' title='Ir a la primera página' class='pagination-link hidden-button'>&lt;&lt;</a>";
		}

		if ($currentPage > 1) {
					$prevPage = $currentPage - 1;
					$layerPag .= "<a href='detailBrand.php?idbrand={$idBrand}&currentPage={$prevPage}' title='Ir a la anterior página' class='pagination-link'>&lt;</a>";
			} else {
					$layerPag .= "<a href='javascript:void(0)' title='Ir a la anterior página' class='pagination-link hidden-button'>&lt;</a>";
		}

		if ($startPage > 1) {
					$layerPag .= "<span class='pagination-ellipsis visible-ellipsis'>...</span>";
			} else {
					$layerPag .= "<span class='pagination-ellipsis hidden-ellipsis'>...</span>";
		}

		for ($i = $startPage; $i <= $endPage; $i++) {
				$class = ($currentPage == $i) ? 'active' : '';
				if ($currentPage == $i) {
					$layerPag .= "<span class='pagination-link {$class}'>{$i}</span>";
			} else {
					$layerPag .= "<a href='detailBrand.php?idbrand={$idBrand}&currentPage={$i}' class='pagination-link {$class}'>{$i}</a>";
			}
		}

		if ($endPage < $totalPages) {
					$layerPag .= "<span class='pagination-ellipsis visible-ellipsis'>...</span>";
			} else {
					$layerPag .= "<span class='pagination-ellipsis hidden-ellipsis'>...</span>";
		}

		if ($currentPage < $totalPages) {
				$nextPage = $currentPage + 1;
					$layerPag .= "<a href='detailBrand.php?idbrand={$idBrand}&currentPage={$nextPage}' title='Ir a la siguiente página' class='pagination-link'>&gt;</a>";
			} else {
					$layerPag .= "<a href='javascript:void(0)' title='Ir a la siguiente página' class='pagination-link hidden-button'>&gt;</a>";
		}

		if ($currentPage < $totalPages) {
					$layerPag .= "<a href='detailBrand.php?idbrand={$idBrand}&currentPage={$totalPages}' title='Ir a la última página' class='pagination-link'>&gt;&gt;</a>";
			} else {
					$layerPag .= "<a href='javascript:void(0)' title='Ir a la última página' class='pagination-link hidden-button'>&gt;&gt;</a>";
		}

					$layerPag .= mod004_getGoHome();
					$layerPag .= "</div>";

		return $layerPag;
}

function mod004_getGoHome(){

	return "<p class='go-home'><a href='main.php'>Home</a></p>";
}

function var_dump_pre($array){

	echo "<pre>";
	var_dump($array);
	echo "</pre>";
}
