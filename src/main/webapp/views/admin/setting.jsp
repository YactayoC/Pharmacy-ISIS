<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css">
    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/setting.css">
    <title>Configuración</title>
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
            <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}" alt="Name of admin" class="nav__img nav__zipped-img" id="user-image">
            <p class="nav__user nav__zipped-user" id="user-name">${surnameE}</p>
        </div>
        <ul class="nav__list grid">
            <!-- summary -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/SASummary?action=list" class="nav__link">
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
            <li class="nav__item">
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
            <li class="nav__item nav__item--active">
                <a href="${pageContext.request.contextPath}/SASetting?action=getSetting&idEmployee=${idEmployee}" class="nav__link">
                    <i class="isax isax-setting-2 nav__icon"></i>
                    <span class="nav__link-text">
              Perfil
            </span>
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

<!-- ========== content ========== -->
<main class="page__setting">
    <h1 class="page__title">Configuración</h1>
    <section class="section container setting">
        <!-- form -->
        <div class="setting__form">
            <div class="profile__info">
                <!-- form for profile -->
                <form class="profile__picture" enctype="multipart/form-data">
                    <div class="profile__overlay" id="profile-overlay">
                        <input
                            type="file"
                            name="photo"
                            id="photo"
                            data-idUser="${employeeS.getUser().getIdUser()}" <%-- here id of user --%>
                            data-path="${pageContext.request.contextPath}"
                            data-urlProfile="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}"
                            class="profile__input"
                            accept="image/*"
                        />
                        <i class="isax isax-user-octagon profile__icon"></i>
                    </div>
                </form>
                <div class="profile__data">
                    <div class="profile__name">${surnameE}</div>
                    <div class="profile__username">${email}</div>
                </div>
            </div>
            <!-- here init form :d -->
            <form action="${pageContext.request.contextPath}/SASetting?action=editSetting&idEmployee=${employeeS.getIdEmployee()}" class="form__container grid"
            method="post">
                <!-- name -->
                <div class="form__field">
                    <i class="isax isax-user form__icon"></i>
                    <input
                            type="text"
                            name="name"
                            id="name"
                            value="${employeeS.getName()}"
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
                            value="${employeeS.getSurname()}"
                            class="form__input"
                            placeholder=" "
                            maxlength="45"
                            required
                    />
                    <label for="surname" class="form__label">Apellidos</label>
                </div>
                <!-- Phone number -->
                <div class="form__field">
                    <i class="isax isax-call form__icon"></i>
                    <input
                            type="tel"
                            name="phone"
                            id="phone"
                            value="${employeeS.getPhone()}"
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
                            name="docIdentity"
                            id="docIdentity"
                            value="${employeeS.getDocIdentity()}"
                            class="form__input"
                            placeholder=" "
                            maxlength="15"
                            minlength="8"
                            required readonly
                    />
                    <label for="docIdentity" class="form__label">DNI</label>
                </div>
                <!--  Email -->
                <div class="form__field">
                    <i class="isax isax-sms-edit form__icon"></i>
                    <input
                            type="email"
                            name="email"
                            id="email"
                            value="${employeeS.getUser().getEmail()}"
                            class="form__input"
                            placeholder=" "
                            required readonly
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
                            value="${employeeS.getUser().getPassword()}"
                            class="form__input"
                            placeholder=" "
                            minlength="8"
                            required
                    />
                    <label for="password" class="form__label">Contraseña</label>
                </div>
                <!-- button save data -->
                <!-- save -->
                <input
                        type="submit"
                        value="Actualizar"
                        class="form__button btn form__field"
                />
            </form>
        </div>
    </section>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/js/form.js"></script>
</body>
</html>
