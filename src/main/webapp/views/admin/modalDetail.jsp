<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/sale.css"/>
    <title>Ventas</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== Modal detail ========== -->
<section class="modal sale__modal-detail">
    <div class="modal__content container">
        <div class="modal__header">
            <h2 class="modal__title">Detalle de venta</h2>
            <a style="color: #C01C28" href="${pageContext.request.contextPath}/SAOffline?action=listRece" class=""><i class="isax isax-close-circle"></i></a>
        </div>
        <div class="modal__body">
            <!-- header of table -->
            <ul class="modal__table grid">
                <li class="sale__header-text sale__total-text">producto</li>
                <li class="sale__header-text">Código</li>
                <li class="sale__header-text">Precio</li>
                <li class="sale__header-text">Cantidad</li>
                <li class="sale__header-text">Subtotal</li>
            </ul>
            <!-- init first  -->
            <c:forEach var="receRD" items="${receRD}">
                <ul class="modal__table modal__table-item grid">
                    <!-- image -->
                    <li class="sale__item">
                        <img src="${pageContext.request.contextPath}/views/admin/assets/img/${receRD.getProduct().getUrlPhoto()}" alt="#" class="modal__img">
                    </li>
                    <!-- product -->
                    <li class="sale__item">
                        <p class="sale__text">${receRD.getProduct().getNameP()}</p>
                    </li>
                    <!-- code -->
                    <li class="sale__item">
                        <p class="sale__text">${receRD.getProduct().getIdProduct()}</p>
                    </li>
                    <!-- price -->
                    <li class="sale__item">
                        S/<span class="sale__text">${receRD.getProduct().getPrice()}</span>
                    </li>
                    <!-- quantity -->
                    <li class="sale__item">
                        <span class="sale__text">${receRD.getQuantity()}</span>
                    </li>
                    <!-- subtotal -->
                    <li class="sale__item">
                        S/<span class="sale__text">${receRD.getProduct().getPrice()*receRD.getQuantity()}</span>
                    </li>
                </ul>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/sale-modal.js"></script>
</body>
</html>