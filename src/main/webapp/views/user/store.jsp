<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/swiper-bundle.min.css"/>
    <!-- ========== styles for view user ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/store.css"/>
    <link const totalProducts = document.querySelectorAll('product__card')>
    <title>Tienda</title>
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
                    <a href="${pageContext.request.contextPath}/SCHome?action=list" class="nav__link"
                    ><i class="isax isax-home nav__icon"></i>Principal</a
                    >
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCProducts?action=list" class="nav__link">
                        <i class="isax isax-shop nav__icon"></i>Productos</a
                    >
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
                    <form class="search">
                        <!-- <label class="search__label" for="search">Buscar</label> -->
                        <input
                                type="search"
                                name="search"
                                id="search"
                                class="search__input"
                                placeholder="Buscar"
                        />
                        <button type="submit" class="search__button" name="action" value="search">
                            <i class="isax isax-search-favorite search__icon"></i>
                        </button>
                    </form>
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
                        <a href="${pageContext.request.contextPath}/SCHome?action=getProfile&idClient=${idClientHome}"
                           class="nav__link btn btn-white">
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
<!-- ========== category <========== -->
<section class="category section swiper-container carousel">
    <h2 class="subtitle">Nuestras categorías</h2>
    <div class="swiper-wrapper">
        <!-- init products -->
        <c:forEach items="${categories}" var="categories">
            <div class="category__container swiper-slide">
                <div class="category__data">
                    <h3 class="category__title">${categories.getNameC()}</h3>
                    <p class="category__description">
                            ${categories.getDescription()}
                    </p>
                    <a href="#" class="category__link">
                        <!--  <i class="isax isax-shopping-cart"></i>-->
                    </a>
                </div>
                <div class="category__picture">
                    <img
                            src="${pageContext.request.contextPath}/views/admin/assets/img/${categories.getUrlCateg()}"
                            alt="categoría covid-19"
                            class="category__img"
                    />
                    <a href="${pageContext.request.contextPath}/SCProducts?action=listProduct&idCategory=${categories.getIdCategory()}"
                       class="category__btn btn btn-primary">
                        Ver productos <i class="isax isax-arrow-right"></i>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- navigation of swiper -->
    <div class="swiper-pagination"></div>
</section>

<!-- ========== products or category ========== -->
<section class="product section">
    <h2 class="subtitle">Productos</h2>
    <div class="product__content grid">
        <!-- init card -->
        <c:if test="${idCategory != null}">
            <c:forEach var="p" items="${productsC}">
                <span class="hidden">${p.getIdProduct()}</span>
                <div class="product__card">
                    <div class="product__stock">${p.getStock()} Units</div>
                    <div class="product__box">
                        <img
                                src="${pageContext.request.contextPath}/views/admin/assets/img/${p.getUrlPhoto()}"
                                alt="Pastillas de paracetamol"
                                class="product__img"
                        />
                        <div class="product__actions">
                            <a class="product__action add-to-cart" >
                                <span class="product__action-text">A la bolsa</span>
                                <i class="isax isax-bag btn-icon"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/SCProducts?action=detail&idProduct=${p.getIdProduct()}"
                               class="product__action">
                                <span class="product__action-text">Ver detalle</span>
                                <i class="isax isax-gallery-favorite btn-icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product__data">
                        <div class="product__info">
                            <span class="product__name">${p.getNameP()}</span>
                            <span class="product__price">$${p.getPrice()}0</span>
                        </div>
                        <p class="product__presentation">15 Pills</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!-- init card -->
        <c:if test="${idCategory == null}">
            <c:forEach var="p" items="${products}">

                <div class="product__card">

                    <span class="hidden">${p.getIdProduct()}</span>
                    <div class="product__stock">${p.getStock()} Units</div>
                    <div class="product__box">
                        <img
                                src="${pageContext.request.contextPath}/views/admin/assets/img/${p.getUrlPhoto()}"
                                alt="Pastillas de paracetamol"
                                class="product__img"
                        />
                        <div class="product__actions">

                            <button class="product__action add-to-cart">
                                <span class="product__action-text">A la bolsa</span>
                                <i class="isax isax-bag btn-icon"></i>
                            </button>
                            <a href="${pageContext.request.contextPath}/SCProducts?action=detail&idProduct=${p.getIdProduct()}"
                               class="product__action">
                                <span class="product__action-text">Ver detalle</span>
                                <i class="isax isax-gallery-favorite btn-icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="product__data">
                        <div class="product__info">
                            <span class="product__name">${p.getNameP()}</span>
                            <span class="product__price">$${p.getPrice()}0</span>
                        </div>
                        <p class="product__presentation">15 Pills</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</section>

<!-- ========== Chat ========== -->
<div class="btn__show-chat" id="chat__show">
    <i class="isax isax-message btn-icon"></i>
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
        <input
                type="text"
                id="chat-writer"
                class="chat__writer"
                placeholder="Escribe aquí"
        />
        <button class="chat__send btn btn-primary" id="send-message">
            <i class="isax isax-send-2"></i>Enviar
        </button>
    </form>
</section>
<!-- ========== Import scripts for animations ========== -->
<script src="${pageContext.request.contextPath}/js/swiper-bundle.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/animations.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/details.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/send-datas.js"></script>
</body>
</html>
