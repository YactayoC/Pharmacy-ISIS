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
    <title>Tienda</title>
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
                    <a href="#" class="nav__link">
                        <i class="isax isax-shop nav__icon"></i>Productos</a
                    >
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/views/user/shopp-cart.jsp" class="nav__link nav__bag">
                        Mi bolsa
                        <div class="nav__bag-content">
                            <i class="isax isax-bag"></i>
                            <!-- Items of shopping cart -->
                            <span class="nav__bag-item">1</span>
                        </div>
                    </a>
                </li>
                <!-- searching -->
                <li class="nav__item nav__search">
                    <div class="search">
                        <!-- <label class="search__label" for="search">Buscar</label> -->
                        <input
                                type="text"
                                name="search"
                                id="search"
                                class="search__input"
                                placeholder="Buscar"
                        />
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
                        <a href="#" class="nav__link btn btn-white">
                            <i class="isax isax-profile-circle nav__profile-icon"></i>
                                ${username}
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
        <c:forEach items="${products}" var="products">
            <div class="category__container swiper-slide">
                <div class="category__data">
                    <h3 class="category__title">${products.getCategory().getNameC()}</h3>
                    <p class="category__description">
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                    </p>
                    <a href="#" class="category__link">
                        <i class="isax isax-shopping-cart"></i>
                            ${products.getStock()}
                    </a>
                </div>
                <div class="category__picture">
                    <img
                            src="${pageContext.request.contextPath}/views/user/assets/img/img-category.webp"
                            alt="categoría covid-19"
                            class="category__img"
                    />
                    <a href="${pageContext.request.contextPath}/SCProducts?action=listProduct&idCategory=${products.getCategory().getIdCategory()}"
                       class="category__btn btn btn-primary">
                        Ver productos <i class="isax isax-arrow-right"></i>
                    </a>
                </div>
            </div>
        </c:forEach>
        <!-- category 2
        <div class="category__container swiper-slide">
            <div class="category__data">
                <h3 class="category__title">Covid - 19</h3>
                <p class="category__description">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                </p>
                <a href="#" class="category__link">
                    <i class="isax isax-shopping-cart"></i>
                    25 productos
                </a>
            </div>
            <div class="category__picture">
                <img
                        src="assets/img/img-category.webp"
                        alt="categoría covid-19"
                        class="category__img"
                />
                <a href="#" class="category__btn btn btn-primary">
                    Ver productos <i class="isax isax-arrow-right"></i>
                </a>
            </div>
        </div>-->
        <!-- category 3
        <div class="category__container swiper-slide">
            <div class="category__data">
                <h3 class="category__title">Covid</h3>
                <p class="category__description">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                </p>
                <a href="#" class="category__link">
                    <i class="isax isax-shopping-cart"></i>
                    25 productos
                </a>
            </div>
            <div class="category__picture">
                <img
                        src="assets/img/img-category.webp"
                        alt="categoría covid-19"
                        class="category__img"
                />
                <a href="#" class="category__btn btn btn-primary">
                    Ver productos <i class="isax isax-arrow-right"></i>
                </a>
            </div>
        </div>-->
        <!-- category 4
        <div class="category__container swiper-slide">
            <div class="category__data">
                <h3 class="category__title">Covid--</h3>
                <p class="category__description">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                </p>
                <a href="#" class="category__link">
                    <i class="isax isax-shopping-cart"></i>
                    25 productos
                </a>
            </div>
            <div class="category__picture">
                <img
                        src="assets/img/img-category.webp"
                        alt="categoría covid-19"
                        class="category__img"
                />
                <a href="#" class="category__btn btn btn-primary">
                    Ver productos <i class="isax isax-arrow-right"></i>
                </a>
            </div>
        </div>-->
        <!-- category 5
        <div class="category__container swiper-slide">
            <div class="category__data">
                <h3 class="category__title">Covid15</h3>
                <p class="category__description">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                </p>
                <a href="#" class="category__link">
                    <i class="isax isax-shopping-cart"></i>
                    25 productos
                </a>
            </div>
            <div class="category__picture">
                <img
                        src="assets/img/img-category.webp"
                        alt="categoría covid-19"
                        class="category__img"
                />
                <a href="#" class="category__btn btn btn-primary">
                    Ver productos <i class="isax isax-arrow-right"></i>
                </a>
            </div>
        </div>-->
    </div>
    <!-- navigation of swiper -->
    <div class="swiper-pagination"></div>
</section>

<!-- ========== products or category ========== -->
<section class="product section">
    <h2 class="subtitle">Productos</h2>
    <div class="product__content grid">
        <!-- init card -->
        <c:forEach var="p" items="${productsC}">
            <div class="product__card">
                <div class="product__stock">${p.getStock()} Units</div>
                <div class="product__box">
                    <img
                            src="${pageContext.request.contextPath}/views/admin/assets/img/${p.getUrlPhoto()}"
                            alt="Pastillas de paracetamol"
                            class="product__img"
                    />
                    <div class="product__actions">
                        <a href="#" class="product__action">
                            <span class="product__action-text">A la bolsa</span>
                            <i class="isax isax-bag btn-icon"></i>
                        </a>
                        <a href="shopp-cart.jsp" class="product__action">
                            <span class="product__action-text">Comprar</span>
                            <i class="isax isax-wallet btn-icon"></i>
                        </a>
                        <a href="detail-product.jsp" class="product__action">
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
        <!-- init card
        <div class="product__card">
            <div class="product__stock">10 Units</div>
            <div class="product__box">
                <img
                        src="${pageContext.request.contextPath}/views/user/assets/img/cup-pills.webp"
                        alt="Pastillas de paracetamol"
                        class="product__img"
                />
                <div class="product__actions">
                    <a href="#" class="product__action">
                        <span class="product__action-text">A la bolsa</span>
                        <i class="isax isax-bag btn-icon"></i>
                    </a>
                    <a href="shopp-cart.jsp" class="product__action">
                        <span class="product__action-text">Comprar</span>
                        <i class="isax isax-wallet btn-icon"></i>
                    </a>
                    <a href="detail-product.jsp" class="product__action">
                        <span class="product__action-text">Ver detalle</span>
                        <i class="isax isax-gallery-favorite btn-icon"></i>
                    </a>
                </div>
            </div>
            <div class="product__data">
                <div class="product__info">
                    <span class="product__name">Paracetamol</span>
                    <span class="product__price">$25.00</span>
                </div>
                <p class="product__presentation">15 Pills</p>
            </div>
        </div>-->
        <!-- init card
        <div class="product__card">
            <div class="product__stock">10 Units</div>
            <div class="product__box">
                <img
                        src="${pageContext.request.contextPath}/views/user/assets/img/cup-pills.webp"
                        alt="Pastillas de paracetamol"
                        class="product__img"
                />
                <div class="product__actions">
                    <a href="#" class="product__action">
                        <span class="product__action-text">A la bolsa</span>
                        <i class="isax isax-bag btn-icon"></i>
                    </a>
                    <a href="shopp-cart.jsp" class="product__action">
                        <span class="product__action-text">Comprar</span>
                        <i class="isax isax-wallet btn-icon"></i>
                    </a>
                    <a href="detail-product.jsp" class="product__action">
                        <span class="product__action-text">Ver detalle</span>
                        <i class="isax isax-gallery-favorite btn-icon"></i>
                    </a>
                </div>
            </div>
            <div class="product__data">
                <div class="product__info">
                    <span class="product__name">Paracetamol</span>
                    <span class="product__price">$25.00</span>
                </div>
                <p class="product__presentation">15 Pills</p>
            </div>
        </div>-->
        <!-- init card
        <div class="product__card">
            <div class="product__stock">10 Units</div>
            <div class="product__box">
                <img
                        src="${pageContext.request.contextPath}/views/user/assets/img/cup-pills.webp"
                        alt="Pastillas de paracetamol"
                        class="product__img"
                />
                <div class="product__actions">
                    <a href="#" class="product__action">
                        <span class="product__action-text">A la bolsa</span>
                        <i class="isax isax-bag btn-icon"></i>
                    </a>
                    <a href="shopp-cart.jsp" class="product__action">
                        <span class="product__action-text">Comprar</span>
                        <i class="isax isax-wallet btn-icon"></i>
                    </a>
                    <a href="detail-product.jsp" class="product__action">
                        <span class="product__action-text">Ver detalle</span>
                        <i class="isax isax-gallery-favorite btn-icon"></i>
                    </a>
                </div>
            </div>
            <div class="product__data">
                <div class="product__info">
                    <span class="product__name">Paracetamol</span>
                    <span class="product__price">$25.00</span>
                </div>
                <p class="product__presentation">15 Pills</p>
            </div>
        </div>-->
        <!-- init card
        <div class="product__card">
            <div class="product__stock">10 Units</div>
            <div class="product__box">
                <img
                        src="${pageContext.request.contextPath}/views/user/assets/img/cup-pills.webp"
                        alt="Pastillas de paracetamol"
                        class="product__img"
                />
                <div class="product__actions">
                    <a href="#" class="product__action">
                        <span class="product__action-text">A la bolsa</span>
                        <i class="isax isax-bag btn-icon"></i>
                    </a>
                    <a href="shopp-cart.jsp" class="product__action">
                        <span class="product__action-text">Comprar</span>
                        <i class="isax isax-wallet btn-icon"></i>
                    </a>
                    <a href="detail-product.jsp" class="product__action">
                        <span class="product__action-text">Ver detalle</span>
                        <i class="isax isax-gallery-favorite btn-icon"></i>
                    </a>
                </div>
            </div>
            <div class="product__data">
                <div class="product__info">
                    <span class="product__name">Paracetamol</span>
                    <span class="product__price">$25.00</span>
                </div>
                <p class="product__presentation">15 Pills</p>
            </div>
        </div>-->
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
</body>
</html>
