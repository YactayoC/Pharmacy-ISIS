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
    <link rel="stylesheet" href="${pageContext.request.contextPath}styles/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css"/>

    <!-- ========== styles for view user ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/profile.css"/>
    <title>Mi Perfil</title>
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header">
    <nav class="nav container">
        <a href="home.jsp" class="nav__logo logo logo--white">Icis</a>
        <div class="nav__menu" id="nav__menu">
            <ul class="nav__list grid">
                <!-- items nav -->
                <li class="nav__item">
                    <a href="home.jsp" class="nav__link"
                    ><i class="isax isax-home nav__icon"></i>Principal</a
                    >
                </li>
                <li class="nav__item">
                    <a href="#" class="nav__link">
                        <i class="isax isax-shop nav__icon"></i>Productos</a
                    >
                </li>
                <li class="nav__item">
                    <a href="#" class="nav__link nav__bag">
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
                        <a href="register.jsp" class="nav__link btn btn-white"
                        >Registro</a
                        >
                    </li>
                    <li class="nav__item">
                        <a href="login.jsp" class="nav__link btn btn-white-outline"
                        >Iniciar</a
                        >
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
<!--  ========== profile ==========  -->
<section class="section form profile">
    <!-- form -->
    <div class="form__content">
        <div class="profile__info">
            <form class="profile__picture" enctype="multipart/form-data">
                <div class="profile__overlay" id="profile-overlay">
                    <input
                            type="file"
                            name="photo"
                            id="photo"
                            class="profile__input"
                            accept="image/*"
                    />
                    <i class="isax isax-user-octagon profile__icon"></i>
                </div>
            </form>
            <div class="profile__data">
                <div class="profile__name">${name}</div>
                <div class="profile__username">${surname}</div>
            </div>
        </div>
        <!-- here init form :d -->
        <form action="" class="form__container grid" method="post">
            <!-- name -->
            <div class="form__field">
                <i class="isax isax-user form__icon"></i>
                <input
                        type="text"
                        name="name"
                        id="name"
                        value="${name}"
                        class="form__input"
                        placeholder=" "
                        maxlength="45"
                        required
                />
                <label for="name" class="form__label">Nombres</label>
                <!-- <i class="isax isax-information form__icon-alert"></i>
                <span class="form__text-alert">change</span> -->
            </div>
            <!-- last name -->
            <div class="form__field">
                <i class="isax isax-user form__icon"></i>
                <input
                        type="text"
                        name="surname"
                        id="surname"
                        value="${surname}"
                        class="form__input"
                        placeholder=" "
                        maxlength="45"
                        required
                />
                <label for="surname" class="form__label">Apellidos</label>
            </div>
            <!-- user name -->
            <div class="form__field">
                <i class="isax isax-profile-2user form__icon"></i>
                <input
                        type="text"
                        name="username"
                        id="username"
                        value="${username}"
                        class="form__input"
                        placeholder=" "
                        maxlength="20"
                        required
                />
                <label for="username" class="form__label">Username</label>
            </div>
            <!-- Phone number -->
            <div class="form__field">
                <i class="isax isax-call form__icon"></i>
                <input
                        type="tel"
                        name="phone"
                        id="phone"
                        value="${phone}"
                        class="form__input"
                        placeholder=" "
                        maxlength="20"
                        required
                />
                <label for="phone" class="form__label">N° Teléfono</label>
            </div>
            <!-- DNI -->
            <div class="form__field">
                <i class="isax isax-document form__icon"></i>
                <input
                        type="text"
                        name="dni"
                        id="dni"
                        value="${docIdentity}"
                        class="form__input"
                        placeholder=" "
                        maxlength="15"
                        minlength="8"
                        required
                />
                <label for="dni" class="form__label">DNI</label>
            </div>
            <!--  Email -->
            <div class="form__field">
                <i class="isax isax-sms-edit form__icon"></i>
                <input
                        type="email"
                        name="email"
                        id="email"
                        value="${email}"
                        class="form__input"
                        placeholder=" "
                        required
                />
                <label for="email" class="form__label">Email</label>
            </div>
            <!-- password -->
            <div class="form__field">
                <i class="isax isax-lock form__icon"></i>
                <input
                        type="password"
                        name="password"
                        id="password"
                        value="${password}"
                        class="form__input"
                        placeholder=" "
                        minlength="8"
                        required
                />
                <label for="password" class="form__label">Contraseña</label>
            </div>
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
                <span class="form__text-alert">Solo estamos disponibles para Lima</span>
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
                <span class="form__text-alert">Solo estamos disponibles para Lima</span>
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
                        id="district"
                        class="form__input form__select"
                        placeholder=" "
                        required
                >
                    <option value="default">Selecciona una opción</option>
                    <option value="sjm">San juan de Miraflores</option>
                    <option value="vs">Villa el Salvador</option>
                    <option value="chr">Chorrillos</option>
                    <option value="vma">Villa Maria</option>
                    <option value="lrn">Lurín</option>
                </select>
                <label for="district" class="form__label">Distríto</label>
            </div>
            <!-- button save data  and logout-->
            <!-- Logout -->
            <a href="../../SLogin?action=exit" class="profile__logout">
                <i class="isax isax-logout btn-icon"></i>
                <span>Logout</span>
            </a>
            <!-- save -->
            <input
                    type="submit"
                    value="Actualizar"
                    class="form__button form__field"
            />
        </form>
    </div>
</section>

<!-- ========== Import scripts for animations ========== -->
<script src="${pageContext.request.contextPath}/views/user/js/animations.js"></script>
<script src="${pageContext.request.contextPath}/js/form.js"></script>
</body>
</html>
