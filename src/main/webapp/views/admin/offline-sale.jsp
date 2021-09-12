<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/swiper-bundle.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css">

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/sale-offline.css"/>
    <title>Venta offline</title>
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
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SAEmployees?action=list" class="nav__link">
                    <i class="isax isax-user-tag nav__icon"></i>
                    <span class="nav__link-text"> Empleados </span>
                </a>
            </li>
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

<!-- ========== content sale offline ========== -->
<main class="page__sale-offline">
    <h1 class="page__title">Venta Presencial</h1>
    <section class="section container offline swiper-container carousel">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Productos</h2>
            </div>

            <form class="sale__search search">
                <input
                        type="search"
                        name="searchOffline"
                        id="search-client"
                        class="search__input"
                        placeholder="Buscar producto"
                />
                <button type="submit" class="search__button" name="action" value="search">
                    Buscar
                    <i class="isax isax-search-favorite search__icon"></i>
                </button>
            </form>

        </div>
        <!-- products -->
        <div class="swiper-wrapper">
            <!-- init a product -->
            <c:forEach var="products" items="${productsOffline}">
                <div class="product__container swiper-slide">
                    <div class="offline__img">
                        <img src="${pageContext.request.contextPath}/views/admin/assets/img/${products.getUrlPhoto()}"
                             alt="" class="product__img">
                    </div>
                    <div class="offline-product__info">
                        <p class="product__name">${products.getNameP()}</p>
                        <p>$<span class="product__price">${products.getPrice()}</span></p>
                    </div>
                    <div class="offline__btn">
                        <a href="#" class="btn offline__btn-sale btn-gradient">Comprar</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="swiper-button-next offline__navigation"></div>
        <div class="swiper-button-prev offline__navigation"></div>

    </section>
    <!-- shopping cart -->
    <section class="section container offline-cart">
        <div class="cart__table">
            <ul class="cart__header grid">
                <li class="cart__header-text">Producto</li>
                <li class="cart__header-text">Precio</li>
                <li class="cart__header-text">Cantidad</li>
                <li class="cart__header-text">Subtotal</li>
                <li class="cart__header-text">Eliminar</li>
            </ul>
            <div class="cart__products">
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
                <!-- row of a product -->
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="assets/img/bg-product.webp"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">Name</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        $<span class="cart__price">25.00</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                <span class="cart__quantity-btn cart__up-btn">
                  <i class="isax isax-arrow-circle-up"></i>
                </span>
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="5">1</span>
                        <span class="cart__quantity-btn cart__down-btn">
                  <i class="isax isax-arrow-circle-down"></i>
                </span>
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">25.00</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a href="#" class="isax isax-close-circle btn cart__icon"></a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- ========== form sale ========== -->
        <div class="cart__form container">
            <div class="card__form-header cart__total">
                total <span class="" id="total">25</span>
            </div>
            <form action="" class="form__container grid">
                <div class="form__field">
                    <input
                            type="text"
                            name="name"
                            id="name" class="form__input"
                            placeholder=" "
                    />
                    <label for="name" class="form__label">Nombre</label>
                </div>
                <!-- <div class="form__field">
                  <input
                    type="text"
                    name="name"
                    id="name"class="form__input"
                  />
                  <label for="name" class="form__label">Nombre</label>
                </div> -->
                <input type="submit" value="Pagar ahora" class="form__field btn btn-gradient">
            </form>
        </div>
    </section>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/js/swiper-bundle.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/offline-sale.js"></script>
</body>
</html>
