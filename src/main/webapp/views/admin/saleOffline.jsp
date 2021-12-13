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
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SASummary?action=list" class="nav__link">
                    <i class="isax isax-chart-square nav__icon"></i>
                    <span class="nav__link-text"> Resumen </span>
                </a>
            </li>
            <!-- Messages -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/message.jsp" class="nav__link">
                    <i class="isax isax-message-favorite nav__icon"></i>
                    <span class="nav__link-text"> Mensajes </span>
                </a>
            </li>
            <!-- Sales -->
            <li class="nav__item nav__item--active">
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
                <a href="${pageContext.request.contextPath}/SASetting?action=getSetting&idEmployee=${idEmployee}" class="nav__link">
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

<!-- ========== content sales ========== -->
<main class="page__sales">
    <h1 class="page__title">Ventas</h1>
    <section class="section container sales">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Recibos</h2>
            </div>
            <form class="sale__search search">
                <input
                        type="search"
                        name="search-client"
                        id="search-client"
                        class="search__input"
                        placeholder="Buscar venta"
                />
                <button type="submit" class="search__button">
                    Buscar
                    <i class="isax isax-search-favorite search__icon"></i>
                </button>
            </form>
        </div>
        <!-- table HEADER of receipts -->
        <div class="sale container">
            <div class="sale__options options">
                <a href="${pageContext.request.contextPath}/views/admin/sale.jsp" class="option option-filter">Delivery
                    <span class="tag-notify tag-notify--primary">8</span>
                </a>
                <a href="${pageContext.request.contextPath}/views/admin/saleRecojo.jsp" class="option option-filter">Recogo
                    <span class="tag-notify tag-notify--primary">7</span>
                </a>
                <a href="${pageContext.request.contextPath}/SAOffline?action=listRece" class="option option-filter option-active">offline
                    <span class="tag-notify tag-notify--primary">7</span>
                </a>
                <a href="${pageContext.request.contextPath}/SAOffline?action=recietp" class="option sale__btn">
                    <i class="isax isax-bag-happy sale__icon"></i> Compra presencial
                </a>
            </div>
            <!--------- table offline --------->
            <div class="">
                <!-- header of table -->
                <ul class="sale__header grid">
                    <li class="sale__header-text sale__total-text">Total productos</li>
                    <li class="sale__header-text">Cliente</li>
                    <li class="sale__header-text">Fecha</li>
                    <li class="sale__header-text">total</li>
                    <li class="sale__header-text">Estado</li>
                    <li class="sale__header-text">detalle</li>
                </ul>
                <!-- init first  -->
                <c:forEach var="receR" items="${receR}">
                    <ul class="sale__items grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="${pageContext.request.contextPath}/views/admin/assets/img/photo-user.webp" alt="#" class="client__img">
                        </li>
                        <!-- total products -->
                        <li class="sale__item">
                            <span class="sale__text">${receR.getReceiptDetail().getQuantity()}</span> Productos
                        </li>
                        <!-- client -->
                        <li class="sale__item">
                            <p class="sale__text">${receR.getEmployee().getName()}</p>
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">${receR.getDateP()}</p>
                        </li>
                        <!-- total -->
                        <li class="sale__item">
                            $<span class="sale__text">${receR.getReceiptDetail().getPrice()}</span>
                        </li>
                        <!-- state -->
                        <li class="sale__item sale__status">
                            <span class="sale__label-icon">Pagado</span>
                            <i class="isax isax-coin sale__icon"></i>
                        </li>
                        <!-- view details-->
                        <li class="sale__item sale__details">
                            <a style="color: #C01C28" href="${pageContext.request.contextPath}/SAOffline?action=listDetailRece&idReceit=${receR.getIdReceipt()}"><i class="isax isax-eye sale__icon"></i></a>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>
    </section>
</main>
<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/sale-modal.js"></script>
</body>
</html>

