<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/swiper-bundle.min.css">

    <!-- ========== styles for view user ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/details.css">
    <title>Descripción del producto</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header">
    <nav class="nav container">
        <a href="${pageContext.request.contextPath}/SCHome?action=list" class="nav__logo logo logo--white">Icis</a>
        <div class="nav__menu" id="nav__menu">
            <ul class="nav__list grid">
                <!-- items nav -->
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCHome?action=list" class="nav__link"><i
                            class="isax isax-home nav__icon"></i>Principal</a>
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCProducts?action=list" class="nav__link">
                        <i class="isax isax-shop nav__icon"></i>Productos</a>
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCard?action=listCart" class="nav__link nav__bag">
                        Mi bolsa
                        <div class="nav__bag-content">
                            <i class="isax isax-bag"></i>
                        </div>
                    </a>
                </li>
                <!-- searching -->
                <li class="nav__item nav__search">
                    <div class="search">
                        <!-- <label class="search__label" for="search">Buscar</label> -->
                        <label for="search" class="hidden"></label>
                        <input type="text" name="search" id="search" class="search__input" placeholder="Buscar">
                        <i class="isax isax-search-favorite search__icon"></i>
                    </div>
                </li>
                <!-- ======== first view of users buttons of login ======== -->
                <c:set var="validats" value="${validats}"/>
                <c:if test="${!validats}">
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/views/user/register.jsp"
                           class="nav__link btn btn-white">Registro</a>
                    </li>
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/views/user/login.jsp"
                           class="nav__link btn btn-white-outline">Iniciar</a>
                    </li>
                </c:if>
                <!-- ======== this view,when the user starts a session ======== -->
                <c:if test="${validats}">
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/SCHome?action=getProfile&idClient=${idClientHome}" class="nav__link btn btn-white">
                            <i class="isax isax-profile-circle nav__profile-icon"></i>
                            <c:if test="${!actualizateHome}"> <!--SGLogin -->
                                ${usernameLog}
                            </c:if>
                            <c:if test="${actualizateHome}"> <!--SCHome -->
                                ${usernameHome}
                            </c:if>
                        </a>
                    </li>
                </c:if>
            </ul>
            <i class="isax isax-close-circle nav__close" id="nav__close"></i>
        </div>
        <div class="nav__btn">
            <div class="nav__toggle" id="nav__toggle">
                <i class="isax isax-arrow-circle-up"></i>
            </div>
        </div>
    </nav>
</header>
<!-- ========== details ========== -->
<section class="detail section">
    <div class="detail__box">
        <img src="${pageContext.request.contextPath}/views/admin/assets/img/${product.getUrlPhoto()}" alt="paracetamol"
             class="detail__img">
    </div>
    <div class="detail__data">
        <h1 class="detail__name">${product.getNameP()}</h1>
        <p class="detail__description">${product.getDetail()}</p>
        <p class="detail__price">$<span id="current-price">${product.getPrice()}</span></p>
        <div class="detail__quantity">
                    <span class="detail__quantity-btn detail__up" id="detail-up">
                        <i class="isax isax-arrow-circle-up"></i>
                    </span>
            <span class="detail__quantity-text" id="current-quantity">1</span>
            <span class="detail__quantity-btn detail__down" id="detail-down">
                        <i class="isax isax-arrow-circle-down"></i>
                    </span>
        </div>
        <a onclick="btnAdd(${product.getIdProduct()})" class="detail__btn btn btn-primary">Agregar a la bolsa</a>
    </div>
</section>

<!-- ========== similar category ========== -->
<div class="detail__products swiper-container carousel">
    <div class="swiper-wrapper">
        <!-- Related products -->
        <c:forEach items="${productsC}" var="pc">
            <a href="${pageContext.request.contextPath}/SCProducts?action=detail&idProduct=${pc.getIdProduct()}" class="detail__product swiper-slide">
                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${pc.getUrlPhoto()}"
                     alt="Categoria" class="detail__product-img">
                <div class="detail__product-data">
                    <span class="detail__product-name">${pc.getNameP()}</span>
                    <span class="detail__product-price">$${pc.getPrice()}</span>
                </div>
            </a>
        </c:forEach>
    </div>
    <!-- navigation of swiper  -->
</div>

<!-- ========== Chat ========== -->
<div class="btn__show-chat" id="chat__show">
    <i class="isax isax-message btn-icon "></i>
</div>
<section class="chat" id="chat">
    <div class="chat__header">
        <h2 class="chat__title">Enviar un mensaje ;D</h2>
        <div class="chat__close" id="chat__close">
            <i class="isax isax-close-square btn-icon"></i>
        </div>
    </div>
    <div class="chat__body">
        <ul class="chat__messages" id="chat-box">
            <li class="chat__box chat__message--response" id="message-response">
                <span class="chat__message">Hi...</span>
            </li>
            <li class="chat__box chat__message--request" id="message-request">
                <span class="chat__message">Hello ;D</span>
            </li>
        </ul>
    </div>
    <form class="chat__footer" id="chat__form">
        <label for="chat-writer" class="hidden"></label>
        <input type="text" id="chat-writer" class="chat__writer" placeholder="Escribe aquí">
        <button class="chat__send btn btn-primary" id="send-message">
            <i class="isax isax-send-2"></i>Enviar
        </button>
    </form>
</section>
<!-- ========== Import scripts for animations ========== -->
<script src="${pageContext.request.contextPath}/js/swiper-bundle.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/animations.js"></script>
<!-- ========== JS only for this file ========== -->
<script src="${pageContext.request.contextPath}/views/user/js/details.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/send-datas.js"></script>
</body>
</html>
