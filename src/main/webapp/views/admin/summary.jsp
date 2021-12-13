<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/summary.css"/>
    <title>Summary</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header container nav__zipped" id="header">
      <span class="nav__toggle">
        <i
                class="isax isax-row-vertical btn-icon nav__menu-active"
                id="unzipped-nav"
        ></i>
        <i class="isax isax-close-circle btn-icon" id="zipped-nav"></i>
      </span>
    <nav class="nav">
        <h1 class="nav__logo logo logo--gradient">Icis</h1>
        <div class="nav__profile">
            <img
                    src="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}"
                    alt="Name of admin"
                    class="nav__img nav__zipped-img"
                    id="user-image"
            />
            <p class="nav__user nav__zipped-user" id="user-name">${surnameE}</p>
        </div>
        <ul class="nav__list grid">
            <!-- summary -->
            <li class="nav__item nav__item--active">
                <a href="${pageContext.request.contextPath}/SASummary?action=list" class="nav__link">
                    <i class="isax isax-chart-square nav__icon"></i>
                    <span class="nav__link-text"> Resumen </span>
                </a>
            </li>
            <!-- Messages -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/ServletChat" class="nav__link">
                    <i class="isax isax-message-favorite nav__icon"></i>
                    <span class="nav__link-text"> Mensajes </span>
                </a>
            </li>
            <!-- Sales -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/sale.jsp" class="nav__link">
                    <i class="isax isax-money-send nav__icon"></i>
                    <span class="nav__link-text"> Ventas </span>
                </a>
            </li>
            <!-- Clients -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SAClients?action=list" class="nav__link">
                    <i class="isax isax-people nav__icon"></i>
                    <span class="nav__link-text"> Clientes </span>
                </a>
            </li>
            <!-- Employees -->
            <c:if test="${role == 1}">
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SAEmployees?action=list" class="nav__link">
                        <i class="isax isax-user-tag nav__icon"></i>
                        <span class="nav__link-text"> Empleados </span>
                    </a>
                </li>
            </c:if>
            <!-- Products -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SAProducts?action=list" class="nav__link">
                    <i class="isax isax-element-4 nav__icon"></i>
                    <span class="nav__link-text"> Productos </span>
                </a>
            </li>
            <!-- Setting -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SASetting?action=getSetting&idEmployee=${idEmployee}"
                   class="nav__link">
                    <i class="isax isax-setting-2 nav__icon"></i>
                    <span class="nav__link-text"> Perfil </span>
                </a>
            </li>

            <!-- logout -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SGLogin?action=exit" class="nav__link">
                    <i class="isax isax-logout nav__icon"></i>
                    <span class="nav__link-text"> Salir </span>
                </a>
            </li>
        </ul>
    </nav>
</header>

<!-- ========== content ========== -->
<main class="page">
    <h1 class="page__title">Resumen</h1>
    <div class="content grid">
        <!-- ========== cards summary ========== -->
        <div class="card__content card__clients">
            <div class="card__picture">
                <i class="isax isax-profile-2user card__icon"></i>
            </div>
            <p class="card__title">N° Clientes</p>
            <h2 class="card__quantity">${clientsAll}</h2>
        </div>
        <div class="card__content card__income">
            <div class="card__picture">
                <i class="isax isax-coin card__icon"></i>
            </div>
            <p class="card__title">Ingresos</p>
            <h2 class="card__quantity">S/.<span id="total-income">${incomes}</span></h2>
        </div>
        <div class="card__content card__sales">
            <div class="card__picture">
                <i class="isax isax-card-send card__icon"></i>
            </div>
            <p class="card__title">N° Ventas</p>
            <h2 class="card__quantity">${sales}</h2>
        </div>

        <!-- ========== Sales of week  ========== -->
        <section class="container section sales">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">venta semanal</h2>
            </div>
            <!-- table BODY of clients -->
            <div class="sales__chart">
                <canvas height="580" width="340">
                <!--------- table all resumen --------->
                <div class="sales__chart">
                    <!-- header of table -->
                    <ul class="sales__chart">
                        <li class="sales__chart">SerialN</li>
                        <li class="sales__chart">Date</li>
                        <li class="sales__chart">Quantity</li>
                        <li class="sales__chart">Total</li>
                    </ul>

                    <!-- table init first  -->
                    <c:forEach items="${products}" var="products">
                        <ul class="product__items grid filter-item" data-tag="${products.getStock()}">
                            <!-- image -->
                            <li class="product__item product__img">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${products.getUrlPhoto()}"
                                     alt="#" class="client__img">
                            </li>
                            <!-- name  -->
                            <li class="product__item">
                                <p class="product__text">${products.getNameP()}</p>
                            </li>
                            <!-- stock -->
                            <li class="product__item">
                                <span class="product__text">${products.getStock()}</span>
                            </li>
                            <!-- price -->
                            <li class="product__item">
                                S/<span class="product__text">${products.getPrice()}</span>
                            </li>
                            <!-- Category -->
                            <li class="product__item product__category">
                                <p class="product__text">${products.getCategory().getNameC()}</p>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
                </canvas>
            </div>
        </section>

        <!-- ==========  resents clients  ========== -->
        <section class="container section client">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Nuevos clientes</h2>
            </div>
            <ul class="client__list">
                <!-- init a list clients -->
                <c:forEach items="${clientsSummary}" var="clients">
                    <li class="client__item">
                        <div class="client__data">
                            <img src="${pageContext.request.contextPath}/views/user/assets/avatar/${clients.getUser().getAvatar()}"
                                 alt="client imagen" class="client__img">
                            <div class="client__info">
                                <p class="client__name">${clients.getUsername()}</p>
                                <span class="client__email">${clients.getUser().getEmail()}</span>
                            </div>
                        </div>
                        <span class="client__time">12:00pm</span>
                    </li>
                </c:forEach>
                <!-- init a list clients
                <li class="client__item">
                    <div class="client__data">
                        <img src="${pageContext.request.contextPath}/views/admin/assets/img/photo-user.webp"
                             alt="client imagen" class="client__img">
                        <div class="client__info">
                            <p class="client__name">Anna 2020</p>
                            <span class="client__email">anna@gmail.com</span>
                        </div>
                    </div>
                    <span class="client__time">12:00pm</span>
                </li>-->
                <!-- init a list clients
                <li class="client__item">
                    <div class="client__data">
                        <img src="${pageContext.request.contextPath}/views/admin/assets/img/photo-user.webp"
                             alt="client imagen" class="client__img">
                        <div class="client__info">
                            <p class="client__name">Anna 2020</p>
                            <span class="client__email">anna@gmail.com</span>
                        </div>
                    </div>
                    <span class="client__time">12:00pm</span>
                </li>-->
            </ul>
        </section>
    </div>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
</body>
</html>
