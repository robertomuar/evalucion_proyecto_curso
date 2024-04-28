<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>Listado de Productos</title>
    <link rel="stylesheet" type="text/css" href="public/css/productos.css">
    <link rel="stylesheet" href="public/css/productos.css" />
    <script src="public/js/detailProduct.js"></script>
</head>
<body>
    <header>
    </header>
    <main>
        <div class="container">
            <h1>Listado de Productos</h1>
            <form method="GET" action="detailBrand.php">
                <label for="numRecords">Registros por página:</label>
                <select id="numRecords" name="numRecords">
                    <option value="1" <?php if ($numRegistryByPage == 1) echo 'selected'; ?>>1</option>
                    <option value="2" <?php if ($numRegistryByPage == 2) echo 'selected'; ?>>2</option>
                    <option value="3" <?php if ($numRegistryByPage == 3) echo 'selected'; ?>>3</option>
                    <option value="4" <?php if ($numRegistryByPage == 4) echo 'selected'; ?>>4</option>
                </select>
                <input type="hidden" name="idbrand" value="<?php echo $idBrand; ?>">
                <input type="submit" value="Actualizar">
            </form>

            <div class="product-list">
                <?php echo is_array($listProducts) ? implode("", $listProducts) : $listProducts; ?>
            </div>
            <div class="container" id="container">
            </div>
            <div class="pagination-container">
                <?php echo $layerPaginationProduct; ?>
            </div>
        </div>
    </main>
    <footer>
        <p>Pies de página</p>
    </footer>
</body>

</html>