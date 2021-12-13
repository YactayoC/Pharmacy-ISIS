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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css"/>

    <!-- ========== styles for view user ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/shop-cart.css"/>
    <title>Bolsa de pago</title>
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
                                type="text"
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
                        <a href="${pageContext.request.contextPath}/views/user/register.jsp" class="nav__link btn btn-white"
                        >Registro</a
                        >
                    </li>
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/views/user/login.jsp" class="nav__link btn btn-white-outline"
                        >Iniciar</a
                        >
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
<div class="shopp__cart">
    <!-- ========== table products ========== -->
    <section class="cart section">
        <div class="cart__title cart__shadow">
            <h2 class="cart__title-text">
                <i class="isax isax-bag-tick-2"></i>
                Mi bolsa
            </h2>
            <c:set var="total" value="${total}"/>
            <h3 class="cart__total">total $<span id="total">${total}</span></h3>
        </div>
        <div class="cart__content cart__shadow">
            <ul class="cart__header grid">
                <li class="cart__header-text">Producto</li>
                <li class="cart__header-text">Precio</li>
                <li class="cart__header-text">Cantidad</li>
                <li class="cart__header-text">Subtotal</li>
                <li class="cart__header-text">Eliminar</li>
            </ul>
            <div class="cart__products">
                <!-- row of a product -->
            <c:forEach var="itemCard" items="${cardInfo}">
                <ul class="cart__product grid">
                    <!-- photo -->
                    <li class="cart__product-item">
                        <img
                                src="${pageContext.request.contextPath}/views/admin/assets/img/${itemCard.getProduct().getUrlPhoto()}"
                                alt="img"
                                class="cart__img"
                        />
                    </li>
                    <!-- name -->
                    <li class="cart__product-item">
                        <p class="cart__name">${itemCard.getProduct().getNameP()}</p>
                        <div class="cart__description"></div>
                    </li>
                    <!-- unit price -->
                    <li class="cart__product-item">
                        S/.<span class="cart__price">${itemCard.getProduct().getPrice()}</span>
                    </li>
                    <!-- quantity -->
                    <li class="cart__product-item cart__quantity">
                               <!-- <span class="cart__quantity-btn cart__up-btn">
                                    <i class="isax isax-arrow-circle-up"></i>
                                </span> -->
                        <span class="cart__quantity current-quantity" data-price='25' data-stock="${itemCard.getProduct().getStock()}">
                                ${itemCard.getQuantity()}
                        </span>
                       <!-- <span class="cart__quantity-btn cart__down-btn">
                                    <i class="isax isax-arrow-circle-down"></i>
                                </span> -->
                    </li>
                    <!-- subtotal -->
                    <li class="cart__product-item">
                        $<span class="cart__price cart__subtotal">${itemCard.getSubtotal()}</span>
                    </li>
                    <!-- remove -->
                    <li class="cart__product-item">
                        <a  onclick="deleteP(${itemCard.getProduct().getIdProduct()})" class="isax isax-close-circle btn-icon"></a>
                        <!-- href="${pageContext.request.contextPath}/SCard?action=delete&id=${itemCard.getProduct().getIdProduct()}" -->
                    </li>
                </ul>
            </c:forEach>
            </div>
            <!-- This is view only in mobile -->
            <a href="#" class="btn btn-primary cart__btn-mbl" id="show-form">
                Formulario de Pago
            </a>
        </div>
    </section>

    <!-- ========== form pay details ========== -->
    <section class="section pay cart__shadow" id="pay-view">
                <span
                        class="isax isax-logout btn-icon form__btn-back"
                        id="close-form"
                ></span>
        <h2 class="form__phrase">Detalles de Pago</h2>
        <div class="pay__delivery">
                    <span class="pay__delivery-text">
                        <i class="isax isax-truck-tick"></i>
                        Delivery
                    </span>
            <input
                    type="checkbox"
                    name="delivery"
                    id="delivery"
                    class="pay__delivery-btn"
            />
            <span class="pay__delivery-text">
                        En persona
                        <i class="isax isax-user-square"></i>
                    </span>
        </div>
        <div class="pay__cards">
            <span class="hidden absolutePath">${pageContext.request.contextPath}</span>
            <img
                    src="${pageContext.request.contextPath}/views/user/assets/img/target-visa.webp"
                    alt="tarjeta visa"
                    class="pay__card-img"
                    id="card-img"
            />
            <ul class="pay__card-icons">
                <li class="pay__card-icon" data-card="visa">
                    <svg
                            width="41"
                            height="32"
                            viewBox="0 0 41 32"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                class="pay__icon--active"
                                fill-rule="evenodd"
                                clip-rule="evenodd"
                                d="M9.3159 4.17796C6.63197 2.69154 3.56978 1.49403 0.144531 0.665281L0.256679 0H14.3359C16.231 0.0684289 17.765 0.674785 18.2934 2.70294L21.3537 17.4209V17.4228L22.2661 21.8611L30.814 0.0190075H40.0614L26.3167 31.9905L17.0788 32L9.3159 4.17796Z"
                                fill="#110604"
                        />
                    </svg>
                </li>
                <li class="pay__card-icon" data-card="apple">
                    <svg
                            width="28"
                            height="32"
                            viewBox="0 0 28 32"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                class="pay__icon"
                                d="M23.0066 16.9109C22.9912 14.2879 24.1796 12.3111 26.5795 10.8534C25.2372 8.93042 23.2066 7.87277 20.5297 7.66893C17.9952 7.46894 15.2223 9.1458 14.2069 9.1458C13.1339 9.1458 10.6801 7.73816 8.74943 7.73816C4.76497 7.7997 0.530518 10.915 0.530518 17.2532C0.530518 19.1262 0.872812 21.0607 1.5574 23.0529C2.47275 25.6759 5.77262 32.1026 9.2148 31.9988C11.0147 31.9564 12.2878 30.7219 14.63 30.7219C16.903 30.7219 18.0798 31.9988 20.0875 31.9988C23.5604 31.9488 26.5449 26.1067 27.4141 23.476C22.7566 21.2799 23.0066 17.0455 23.0066 16.9109V16.9109ZM18.9644 5.18057C20.9143 2.86527 20.7374 0.757663 20.6797 0C18.9567 0.0999961 16.9645 1.17303 15.8299 2.49221C14.58 3.90754 13.8454 5.65747 14.0031 7.63047C15.8645 7.77277 17.5645 6.81512 18.9644 5.18057V5.18057Z"
                                fill="#110604"
                        />
                    </svg>
                </li>
                <li class="pay__card-icon" data-card="master">
                    <svg
                            width="46"
                            height="30"
                            viewBox="0 0 46 30"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                class="pay__icon"
                                opacity="0.5"
                                d="M30.5327 30C27.566 30.0004 24.6658 29.1211 22.1988 27.4733C19.7318 25.8254 17.8089 23.483 16.6732 20.7423C15.5375 18.0016 15.24 14.9856 15.8183 12.0758C16.3967 9.16604 17.8249 6.49308 19.9223 4.39498C22.0198 2.29688 24.6924 0.867873 27.602 0.288663C30.5116 -0.290548 33.5277 0.00605304 36.2687 1.14096C39.0098 2.27587 41.3527 4.19811 43.0013 6.6646C44.6499 9.13109 45.5301 12.0311 45.5305 14.9978V15C45.5264 18.9766 43.945 22.7892 41.1333 25.6013C38.3217 28.4133 34.5093 29.9953 30.5327 30V30Z"
                                fill="#110604"
                        />
                        <path
                                d="M15.9386 30C12.9719 30 10.0718 29.1203 7.60505 27.472C5.13831 25.8238 3.21573 23.4811 2.08041 20.7403C0.945098 17.9994 0.648048 14.9834 1.22683 12.0736C1.8056 9.16393 3.23422 6.49119 5.332 4.3934C7.42979 2.29562 10.1025 0.867005 13.0122 0.288227C15.922 -0.290551 18.938 0.00649968 21.6789 1.14181C24.4197 2.27713 26.7624 4.19971 28.4106 6.66645C30.0589 9.13319 30.9386 12.0333 30.9386 15C30.9345 18.977 29.3528 22.7899 26.5406 25.602C23.7285 28.4142 19.9156 29.9959 15.9386 30Z"
                                fill="#110604"
                        />
                    </svg>
                </li>
                <li class="pay__card-icon" data-card="paypal">
                    <svg
                            width="28"
                            height="32"
                            viewBox="0 0 28 32"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                class="pay__icon"
                                d="M10.3764 17.2036H13.3257C19.7329 17.2036 23.3684 14.3182 24.5257 8.38578C24.5631 8.19022 24.5969 8.00178 24.6253 7.81333C24.6893 7.41156 24.7213 7.05067 24.7355 6.704C24.7462 6.46578 24.7533 6.32533 24.7515 6.19378C24.7497 5.55845 24.6191 4.93008 24.3675 4.34667C24.1382 3.82044 23.7915 3.30311 23.2777 2.71467C21.7613 0.990222 19.1195 0 15.964 0H5.91419C5.57171 0.00041519 5.24059 0.12288 4.98026 0.345413C4.71994 0.567947 4.54744 0.875979 4.49375 1.21422L2.68041 12.896L0.424413 27.4471C0.405167 27.5703 0.412824 27.6962 0.446857 27.8162C0.48089 27.9362 0.540492 28.0474 0.621569 28.1422C0.702646 28.2369 0.803276 28.313 0.916545 28.3652C1.02981 28.4174 1.15304 28.4444 1.27775 28.4444H6.20575L7.71508 19.4791C7.81294 18.8441 8.13532 18.2652 8.62366 17.8477C9.112 17.4301 9.7339 17.2016 10.3764 17.2036ZM26.5595 9.04889C25.1515 15.7529 20.5915 19.3102 13.324 19.3102H10.3764C10.2352 19.3099 10.0987 19.3604 9.99164 19.4525C9.88459 19.5445 9.8142 19.6719 9.7933 19.8116L7.82886 32H12.9969C13.2965 32.0003 13.5864 31.8935 13.8142 31.6989C14.0421 31.5043 14.1929 31.2347 14.2395 30.9387L14.2911 30.672L15.2777 24.4249L15.3417 24.08C15.3884 23.784 15.5392 23.5144 15.767 23.3198C15.9949 23.1252 16.2848 23.0184 16.5844 23.0187H17.3666C22.4333 23.0187 26.3995 20.96 27.5586 15.008C28.0351 12.5547 27.7933 10.5031 26.5595 9.04889V9.04889Z"
                                fill="#110604"
                        />
                    </svg>
                </li>
                <li class="pay__card-icon" data-card="google">
                    <svg
                            width="33"
                            height="32"
                            viewBox="0 0 33 32"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                                class="pay__icon"
                                d="M31.8358 12.9996C32.0357 14.0707 32.1446 15.1906 32.1446 16.3592C32.1446 25.5002 26.0268 32 16.7866 32C14.6853 32.0006 12.6044 31.5872 10.6629 30.7834C8.72143 29.9795 6.95735 28.801 5.47148 27.3151C3.98562 25.8293 2.80709 24.0652 2.00324 22.1237C1.1994 20.1822 0.785981 18.1013 0.786622 16C0.785981 13.8987 1.1994 11.8178 2.00324 9.87631C2.80709 7.93481 3.98562 6.17073 5.47148 4.68486C6.95735 3.199 8.72143 2.02047 10.6629 1.21662C12.6044 0.412775 14.6853 -0.000639938 16.7866 7.43522e-07C21.1068 7.43522e-07 24.7167 1.5896 27.4863 4.17066L22.976 8.68102V8.66965C21.297 7.0703 19.1661 6.24949 16.7866 6.24949C11.5075 6.24949 7.21653 10.7095 7.21653 15.9902C7.21653 21.2694 11.5075 25.7391 16.7866 25.7391C21.5765 25.7391 24.837 23.0004 25.5067 19.2393H16.7866V12.9996H31.8374H31.8358Z"
                                fill="#110604"
                        />
                    </svg>
                </li>
            </ul>
        </div>
        <!------------ Form of card ------------>
        <div class="form__content">
            <h2 class="form__phrase">Detalle de targeta</h2>
            <!------------ simulation card pay ------------>
            <div class="form__container grid form__container-card"> <!-- Possible change for form -->
                <!-- number card -->
                <div class="form__field pay__number-card">
                    <i class="isax isax-card-pos form__icon"></i>
                    <input
                            type="text"
                            name="number-card"
                            id="number-card"
                            maxlength="16"
                            minlength="16"
                            placeholder=" "
                            class="form__input"
                    />
                    <label for="number-card" class="form__label">
                        Número de tarjeta
                    </label>
                </div>
                <!-- date -->
                <div class="form__field pay__card-date">
                    <i class="isax isax-calendar form__icon"></i>
                    <input
                            type="date"
                            name="card-date"
                            id="card-date"
                            class="form__input"
                    />
                    <label for="card-date" class="form__label">Fecha de limite</label>
                </div>
                <!-- cvv -->
                <div class="form__field pay__card-cvv">
                    <i class="isax isax-card-edit form__icon"></i>
                    <input
                            type="text"
                            name="cvv"
                            id="cvv"
                            class="form__input"
                            placeholder=" "
                            maxlength="3"
                            minlength="3"
                    />
                    <label for="cvv" class="form__label">CVV</label>
                </div>
                <!-- target name -->
                <div class="form__field pay__card-name">
                    <i class="isax isax-user form__icon"></i>
                    <input
                            type="text"
                            name="card-name"
                            id="card-name"
                            class="form__input"
                            placeholder=" "
                            maxlength="45"
                    />
                    <label for="card-name" class="form__label">Tú nombre</label>
                </div>
            </div>
        </div>
        <!------------ button alternate ------------>
        <a href="#" class="form__button form__field shopp__btn-alternate hidden" id="btn-alternate">Obtener Recibo</a>

        <!------------ init delivery ------------>
        <div class="form__content form__delivery">
            <!------------ init form address ------------>
            <h2 class="form__phrase">Detalle de delivery</h2>
            <form action="${pageContext.request.contextPath}/SPay" class="form__container form__container-delivery grid" method="post">
                <input type="hidden" name="id-user"/>
                <!-- Department -->
                <div class="form__field">
                    <i class="isax isax-security-safe form__icon"></i>
                    <input
                            type="text"
                            name="department"
                            id="department"
                            class="form__input"
                            placeholder=" "
                            disabled
                            value="Lima"
                    />
                    <label for="department" class="form__label">Departamento</label>
                    <i class="isax isax-information form__icon-alert"></i>
                    <span class="form__text-alert"
                    >Solo estamos disponibles para Lima</span
                    >
                </div>
                <!-- Province -->
                <div class="form__field">
                    <i class="isax isax-security-safe form__icon"></i>
                    <input
                            type="text"
                            name="province"
                            id="province"
                            class="form__input"
                            placeholder=" "
                            disabled
                            value="Lima"
                    />
                    <label for="province" class="form__label">Província</label>
                    <i class="isax isax-information form__icon-alert"></i>
                    <span class="form__text-alert"
                    >Solo estamos disponibles para Lima</span
                    >
                </div>
                <!-- Address -->
                <div class="form__field">
                    <i class="isax isax-global-edit form__icon"></i>
                    <input
                            type="text"
                            name="address"
                            id="address"
                            class="form__input"
                            maxlength="255"
                            placeholder=" "
                    />
                    <label for="address" class="form__label">Dirección</label>
                </div>
                <!-- District -->
                <div class="form__field">
                    <i class="isax isax-location form__icon"></i>
                    <select
                            name="district"
                            id="districts"
                            class="form__input form__select"
                            placeholder=" "
                            required
                    >
                        <option value="0">Selecciona una opción</option> <!-- default -->
                        <option value="1">San juan de Miraflores</option> <!-- sjm -->
                        <option value="2">Villa el Salvador</option> <!-- vs -->
                        <option value="3">Chorrillos</option> <!-- chr -->
                        <option value="4">Villa Maria</option> <!-- vma -->
                        <option value="5">Lurín</option> <!-- lrn -->
                    </select>
                    <label for="districts" class="form__label">Distríto</label>
                </div>
                <!-- buy now btn -->
                <input
                        type="submit"
                        value="Comprar ahora"
                        class="form__button form__field btn-pay"
                />
            </form>
        </div>
    </section>
</div>

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
<script src="${pageContext.request.contextPath}/views/user/js/animations.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/js/form.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/send-datas.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/shop-cart.js"></script>
</body>
</html>
