<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">

    <!-- ========== styles for view delivery-man ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/delivery-man/styles/styles.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/delivery-man/styles/orders.css">
    <title>Pedidos</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header">
    <nav class="nav">
        <a href="${pageContext.request.contextPath}/views/user/login.jsp" class="nav__logout">
            <i class="isax isax-logout nav__icon"></i>
            <span class="nav__text">logout</span>
        </a>
        <div class="nav__logo">
            <h1 class="logo logo--gradient">Icis</h1>
        </div>
        <a href="${pageContext.request.contextPath}/SASetting?action=getSetting2&idEmployee=${idEmployee}" class="nav__profile">
            <img src="${pageContext.request.contextPath}/views/delivery-man/assets/img/photo-user.webp" alt="user" class="nav__img">
        </a>
    </nav>
</header>

<!-- ========== content ========== -->
<section class="container options">
    <div class="option option--active option-filter" data-filter="all">
        todo<span class="tag-notify">8</span>
    </div>
    <div class="option option-filter" data-filter="earring">
        Pendientes <span class="tag-notify">8</span>
    </div>
    <div class="option option-filter" data-filter="delivered">entregados</div>
</section>

<section class="container cards grid" id="drop-items">
    <!-- one card earring -->
    <c:forEach var="clients" items="${clients}">
        <div class="container card__delivery filter-item" data-tag="earring">
            <div class="card__row card__date">
                <div class="card__info">
                    <h6 class="card__normal-data">${clients.getReceipt().getDateP()}</h6>
                    <span class="card__small-data">Fecha de entrega</span>
                </div>
                <div class="card__icon--earring">
                    <i class="isax isax-close-circle"></i>
                </div>
            </div>
            <div class="card__row card__client">
                <div class="card__info">
                    <h6 class="card__normal-data">${clients.getName()} ${clients.getSurname()}</h6>
                    <span class="card__small-data">${clients.getPhone()}</span>
                </div>
                <a href="https://api.whatsapp.com/send?phone=${clients.getPhone()}" target="_blank" class="btn btn-primary card__icon">
                    <i class="isax isax-call"></i>
                </a>
            </div>
            <div class="card__row card__address">
                <div class="card__info">
                    <h6 class="card__normal-data">${clients.getAddress()}</h6>
                    <span class="card__small-data">${clients.getDistrict().getNameD()}</span>
                </div>
                <div class="btn btn-primary card__icon">
                    <i class="isax isax-location"></i>
                </div>
            </div>
            <div class="card__button btn btn-gradient">
                Entregado
            </div>
        </div>
    </c:forEach>
</section>

<!-- ========== Scripts ========== -->
<script src="../admin/js/filter.js"></script>
<script src="js/Sortable.min.js"></script>
<script src="js/drag-drop.js"></script>
</body>
</html>
