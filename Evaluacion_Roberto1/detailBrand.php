<?php

require "app/model/mod004_presentacion.php";

$idBrand = isset($_GET['idbrand']) ? $_GET['idbrand'] : null;
$numRegistryByPage = isset($_GET['numRecords']) ? intval($_GET['numRecords']) : 1;

if (isset($_GET['numRecords'])) {
        $numRegistryByPage = intval($_GET['numRecords']);
            setcookie('numRecords', $numRegistryByPage, time() + (86400 * 30), '/'); 
    } elseif (isset($_COOKIE['numRecords'])) {
        $numRegistryByPage = intval($_COOKIE['numRecords']);
    } else {
        $numRegistryByPage = 1; 
}

$totalPages = mod003_countProductsByBrand($numRegistryByPage, $idBrand);

if (isset($_GET["currentPage"])) {
        $currentPage = intval($_GET["currentPage"]);
    if (!is_numeric($currentPage) || $currentPage <= 0 || $currentPage > $totalPages) {
        $currentPage = 1;
    }
    } else {
        $currentPage = 1;
}

$baseURL = "main.php?idbrand=" . urlencode($idBrand) . "&";

$listProducts = mod004_getProductsPag($currentPage, $numRegistryByPage, $idBrand);

$layerPaginationProduct = mod004_setLayerPagination($currentPage, $numRegistryByPage, $totalPages, $idBrand);

include "public/vista/vista_detailBrand.php";
