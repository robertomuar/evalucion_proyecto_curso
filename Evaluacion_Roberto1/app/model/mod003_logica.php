<?php

require "mod002_accesoadatos.php";

function mod003_getMarcas(){

    $arDataProducts = mod002_getMarcas();
    if ($arDataProducts["status"]["codError"] === "000") {
        foreach ($arDataProducts["data"] as $key => $value) {
        }
        $arDataProducts_tmp["status"] = $arDataProducts["status"];
        $arDataProducts_tmp["data"]["tbody"] = $arDataProducts["data"];
        return $arDataProducts_tmp;
    }

    return $arDataProducts;
}

function mod003_getDetailBrand($idProduct){

    $arDetailProduct = mod002_getDetailBrand($idProduct);

    return $arDetailProduct;
}

function mod003_countProductsByBrand($numRegistryByPage, $idBrand){

    $arDetailProducts = mod002_getDetailBrand($idBrand);
    $numTotalRegistry = count($arDetailProducts["data"]);
    $totalPages = ceil($numTotalRegistry / $numRegistryByPage);

    return $totalPages;
}

function mod003_getProductsPag($currentPage, $numRegistryByPage, $idBrand){

    $initialRegistry = ($currentPage - 1) * $numRegistryByPage;
    $dataProductsPag = mod002_getProductsPag($initialRegistry, $numRegistryByPage, $idBrand);

    return $dataProductsPag;
}

function mod003_getDetailProduct($productoId){
 
    $arDetailPerProduct = mod002_getDetailProduct($productoId);

    return $arDetailPerProduct;
}
