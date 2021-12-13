<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- ========== default styles and icons ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css"/>

        <!-- ========== styles for view user ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css"/>
        <!-- ========== styles only this page ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/receipt.css"/>
        <title>Recibo de compra</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
    </head>
    <body>
        <!-- ========== receipt ========== -->
        <section class="receipt">
            <div class="receipt__header">
                <span class="receipt__logo logo logo--white">Icis</span>
                <div class="receipt__data">
                    <span class="receipt__date">14 Diciembre de 2021</span>
                    <span class="receipt__number">N°0${receipt}</span>
                </div>
            </div>
            <div class="receipt__body">
                <ul class="receipt__details shadow__separator">
                    <h3 class="receipt__subtitle">Detalle</h3>
                    <li class="receipt__item">
                        <span class="receipt__key">Cliente</span>
                        <span class="receipt__value">${client.getName()}</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">DNI</span>
                        <span class="receipt__value">${client.getDocIdentity()}</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Fecha de entrega</span>
                        <span class="receipt__value">${date}</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Dirección</span>
                        <span class="receipt__value">${address}</span>
                    </li>
                    <li class="receipt__item">
                        <span class="receipt__key">Moneda</span>
                        <span class="receipt__value">Nuevo sol</span>
                    </li>
                    <!--
                    <li class="receipt__item">
                        <span class="receipt__key">Repartidor</span>
                        <span class="receipt__value">John Does</span>
                    </li> -->
                </ul>
                <ul class="receipt__products shadow__separator">
                    <h3 class="receipt__subtitle">Productos</h3>
                    <!-- products of sale -->
                <c:forEach var="itemCard" items="${cardInfo}">
                    <li class="receipt__item receipt__product">
                        <div class="receipt__key">
                            <span class="receipt__product-id">${itemCard.getProduct().getIdProduct()}</span>
                            <span class="receipt__product-name">${itemCard.getProduct().getNameP()}</span>
                            <p><span class="receipt__product-quantity">${itemCard.getQuantity()}</span> unidades</p>
                        </div>
                        <span class="receipt__value">$${itemCard.getProduct().getPrice()}</span>
                    </li>
                    </c:forEach>
                </ul>
                <ul>
                    <li class="receipt__item receipt__subtotal">
                        <span class="receipt__key">Subtotal</span>
                        <span class="receipt__value">${total}</span>
                    </li>
                    <li class="receipt__item receipt__igv">
                        <span class="receipt__key">IGV</span>
                        <span class="receipt__value">$${igv}</span>
                    </li>
                    <li class="receipt__item receipt__total">
                        <span class="receipt__key">Total</span>
                        <span class="receipt__value">$${totalP}</span>
                    </li>
                </ul>
            </div>
            <div class="receipt__footer">
                <img src="${pageContext.request.contextPath}/views/user/assets/img/code-bar.webp" alt="código de barras" class="receipt__code-bar">
                <span class="receipt__serial">${SerialN}</span>
            </div>
        </section>

        <!-- modal of save this receipt -->
        <section class="save__receipt">
            <h3 class="save__message">¡COMPRA EXITOSA!</h3>
            <div class="save__buttons">
                <a href="${pageContext.request.contextPath}/views/user/home.jsp" class="btn btn-gradient">
                    <i class="isax isax-home"></i>Volver
                </a>
                <a onclick="pReceipt()" id="imprimir" class="btn btn-primary save__button">
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
        <script src="${pageContext.request.contextPath}/views/user/js/receipt.js"></script>
    <!-- POSIBLEMEnTE ELIMINAR -->
    </body>
</html>
