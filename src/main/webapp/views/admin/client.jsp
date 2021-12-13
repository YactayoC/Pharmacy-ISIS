<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/client.css">
    <title>clientes</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header container nav__zipped" id="header">
    <span class="nav__toggle">
      <i class="isax isax-row-vertical btn-icon nav__menu-active" id="unzipped-nav"></i>
      <i class="isax isax-close-circle btn-icon " id="zipped-nav"></i>
    </span>
    <nav class="nav">
        <h1 class="nav__logo logo logo--gradient">Icis</h1>
        <div class="nav__profile">
            <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}" alt="Name of admin" class="nav__img nav__zipped-img"
                 id="user-image">
            <p class="nav__user nav__zipped-user" id="user-name">${surnameE}</p>
        </div>
        <ul class="nav__list grid">
            <!-- summary -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/summary.jsp" class="nav__link">
                    <i class="isax isax-chart-square nav__icon"></i>
                    <span class="nav__link-text">
              Resumen
            </span>
                </a>
            </li>
            <!-- Messages -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/message.jsp" class="nav__link">
                    <i class="isax isax-message-favorite nav__icon"></i>
                    <span class="nav__link-text">
              Mensajes
            </span>
                </a>
            </li>
            <!-- Sales -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/sale.jsp" class="nav__link">
                    <i class="isax isax-money-send nav__icon"></i>
                    <span class="nav__link-text">
              Ventas
            </span>
                </a>
            </li>
            <!-- Clients -->
            <li class="nav__item nav__item--active">
                <a href="${pageContext.request.contextPath}/SAClients?action=list" class="nav__link">
                    <i class="isax isax-people nav__icon"></i>
                    <span class="nav__link-text">
              Clientes
            </span>
                </a>
            </li>
            <!-- Employees -->
            <c:if test="${role == 1}">
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SAEmployees?action=list" class="nav__link">
                        <i class="isax isax-user-tag nav__icon"></i>
                        <span class="nav__link-text">
              Empleados
            </span>
                    </a>
                </li>
            </c:if>
            <!-- Products -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SAProducts?action=list" class="nav__link">
                    <i class="isax isax-element-4 nav__icon"></i>
                    <span class="nav__link-text">
              Productos
            </span>
                </a>
            </li>
            <!-- Setting -->
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SASetting?action=getSetting&idEmployee=${idEmployee}" class="nav__link">
                        <i class="isax isax-setting-2 nav__icon"></i>
                        <span class="nav__link-text">Perfil</span>
                    </a>
                </li>
            <!-- logout -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SGLogin?action=exit" class="nav__link">
                    <i class="isax isax-logout nav__icon"></i>
                    <span class="nav__link-text">
              Salir
            </span>
                </a>
            </li>
        </ul>
    </nav>
</header>

<!-- ========== content clients ========== -->
<main class="page__client main">
    <h1 class="page__title">Clientes</h1>
    <section class="section container clients">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Lista</h2>
            </div>
            <form class="client__search search">
                <input
                        type="search"
                        name="search-client"
                        id="search-client"
                        class="search__input"
                        placeholder="Buscar cliente"
                />
                <button type="submit" class="search__button" name="action" value="search">
                    Buscar
                    <i class="isax isax-search-favorite search__icon"></i>
                </button>
            </form>
        </div>
        <!-- table HEADER of receipts -->
        <div class="client container">
            <div class="client__options options">
                <button class="option option-filter option--active" data-filter="delivery">Todos lo clientes
                    <span class="tag-notify tag-notify--primary">8</span>
                </button>
            </div>

            <!-- table BODY of clients -->
            <div class="client__body">
                <!--------- table clients --------->
                <div class="client__delivery">
                    <!-- header of table -->
                    <ul class="client__header grid">
                        <li class="client__header-text client__name-text">Nombre</li>
                        <li class="client__header-text">DNI</li>
                        <li class="client__header-text mobil-hidden">Username</li>
                        <li class="client__header-text">Email</li>
                        <li class="client__header-text mobil-hidden tablet__hidden">Tel</li>
                        <li class="client__header-text">Distrito</li>
                        <li class="client__header-text mobil-hidden">N°Compras</li>
                    </ul>
                    <!-- init first row of clients -->
                    <c:forEach var="client" items="${clients}">
                        <ul class="client__items grid">
                            <!-- Photo -->
                            <li class="client__item">
                                <img src="${pageContext.request.contextPath}/views/user/assets/avatar/${client.getUser().getAvatar()}"
                                     alt="#" class="client__img">
                            </li>
                            <!-- name -->
                            <li class="client__item">
                                <p class="client__text">${client.getName()} ${client.getSurname()}</p>
                            </li>
                            <!-- DNI -->
                            <li class="client__item">
                                <p class="client__text">${client.getDocIdentity()}</p>
                            </li>
                            <!-- username -->
                            <li class="client__item mobil-hidden">
                                <p class="client__text">${client.getUsername()}</p>
                            </li>
                            <!-- Email -->
                            <li class="client__item">
                                <p class="client__text">${client.getUser().getEmail()}</p>
                            </li>
                            <!-- Phone -->
                            <li class="client__item mobil-hidden tablet__hidden">
                                <p class="client__text"> ${client.getPhone()}</p>
                            </li>
                            <!-- district -->
                            <li class="client__item">
                                ${client.getDistrict().getNameD()}
                            </li>
                            <!-- number sales-->
                            <li class="client__item client__item-icon mobil-hidden">
                                <i class="isax isax-bag-2 client__icon"></i>
                                <span class="client__sales">5</span>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>

        </div>
    </section>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
</body>
</html>
