<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- ========== default styles and icons ========== -->
        <link rel="stylesheet" href="../../styles/normalize.css">
        <link rel="stylesheet" href="../../styles/overall-styles.css">
        <link rel="stylesheet" href="../../styles/style-icon.css">

        <!-- ========== styles for view user ========== -->
        <link rel="stylesheet" href="views/user/styles/style.css">
        <!-- ========== styles only this page ========== -->
        <link rel="stylesheet" href="views/user/styles/receipt.css">
        <title>Principal</title>
    </head>
    <body>
        <!-- ========== receipt ========== -->
        <section class="receipt">
            <div class="receipt__header">
                <span class="receipt__logo logo logo--white">Icis</span>
                <div class="receipt__data">
                    <span class="receipt__date">20 Mar de 2020</span>
                    <span class="receipt__number">N°01</span>
                </div>
            </div>
            <div class="receipt__body">
                <ul class="receipt__details shadow__separator">
                    <h3 class="receipt__subtitle">Detalle</h3>
                    <li class="receipt__item">
                        <span class="receipt__key">Cliente</span>
                        <span class="receipt__value">Anna Smith</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">DNI</span>
                        <span class="receipt__value">87654321</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Fecha de entrega</span>
                        <span class="receipt__value">21 Mar de 2020</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Dirección</span>
                        <span class="receipt__value">Av ejem 123</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Moneda</span>
                        <span class="receipt__value">Nuevo sol</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Repartidor</span>
                        <span class="receipt__value">John Does</span>
                    </li>
                </ul>
                <ul class="receipt__products shadow__separator">
                    <h3 class="receipt__subtitle">Productos</h3>
                    <!-- products of sale -->
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">1</span>
                            <span class="receipt__product-name">Paracetamol</span>
                            <p><span class="receipt__product-quantity">1</span> unidades</p>
                        </div>
                        <span class="receipt__value">$13:00</span>
                    </li>
                    <!-- products of sale -->
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">1</span>
                            <span class="receipt__product-name">Paracetamol</span>
                            <p><span class="receipt__product-quantity">1</span> unidades</p>
                        </div>
                        <span class="receipt__value">$13:00</span>
                    </li>
                    <!-- products of sale -->
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">1</span>
                            <span class="receipt__product-name">Paracetamol</span>
                            <p><span class="receipt__product-quantity">1</span> unidades</p>
                        </div>
                        <span class="receipt__value">$13:00</span>
                    </li>
                    <!-- products of sale -->
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">1</span>
                            <span class="receipt__product-name">Paracetamol</span>
                            <p><span class="receipt__product-quantity">1</span> unidades</p>
                        </div>
                        <span class="receipt__value">$13:00</span>
                    </li>
                    <!-- products of sale -->
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">1</span>
                            <span class="receipt__product-name">Paracetamol</span>
                            <p><span class="receipt__product-quantity">1</span> unidades</p>
                        </div>
                        <span class="receipt__value">$13:00</span>
                    </li>
                </ul>
                <ul class="receipt__summary">
                    <li class="receipt__item receipt__igv">
                        <span class="receipt__key">IGV</span>
                        <span class="receipt__value">$13:00</span>
                    </li>
                    <li class="receipt__item receipt__total">
                        <span class="receipt__key">Total</span>
                        <span class="receipt__value">$83:00</span>
                    </li>
                </ul>
            </div>
            <div class="receipt__footer">
                <img src="assets/img/code-bar.webp" alt="código de barras" class="receipt__code-bar">
                <span class="receipt__serial">0000004</span>
            </div>
        </section>

        <!-- modal of save this receipt -->
        <section class="save__receipt">
            <h3 class="save__message">Compra exitosa</h3>
            <div class="save__buttons">
                <a href="home.jsp" id="download" class="btn btn-gradient">
                    <i class="isax isax-home"></i>Volver
                </a>
                <a href="#" class="btn btn-primary save__button">
                    <i class="isax isax-arrow-down"></i>Guardar
                </a>
            </div>
        </section>
        <script>
            const receipt = document.querySelector('.receipt'),
                    modalSave = document.querySelector('.save__receipt');
            receipt.addEventListener('click', (e) => {
                modalSave.classList.toggle('is__visible');
            })
            modalSave.addEventListener('click', (e) => {
                modalSave.classList.remove('is__visible');
            });
        </script>
    </body>
</html>
