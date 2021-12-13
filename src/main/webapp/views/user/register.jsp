<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css"/>
    <title>Registrate en Icis</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<a href="${pageContext.request.contextPath}/views/user/home.jsp" class="isax isax-logout btn-icon form__btn-back"></a>
<!-- Content register -->
<section class="section form">
    <div class="form__img">
        <img src="${pageContext.request.contextPath}/views/user/assets/img/register-bg.webp" alt="Medic and Doctor"/>
        <div class="form__buttons">
            <a href="${pageContext.request.contextPath}/views/user/login.jsp" class="form__btn-action">Login</a>
            <a href="#" class="form__active form__btn-action">Register</a>
        </div>
    </div>
    <!-- form -->
    <div class="form__content">
        <h2 class="form__logo logo logo--gradient">Icis</h2>
        <p class="form__phrase">Crea una Cuenta</p>
        <!-- here init form :d -->
        <form action="${pageContext.request.contextPath}/SCRegister?action=register" class="form__container grid"
              method="post">
            <!-- name -->
            <div class="form__field">
                <i class="isax isax-user form__icon"></i>
                <input
                        type="text"
                        name="name"
                        id="name"
                        class="form__input"
                        placeholder=" "
                        maxlength="45"
                        required
                />
                <label for="name" class="form__label">Nombres</label>
                <!-- <i class="isax isax-information form__icon-alert"></i> -->
                <span class="form__text-alert">change</span>
            </div>
            <!-- last name -->
            <div class="form__field">
                <i class="isax isax-user form__icon"></i>
                <input
                        type="text"
                        name="surname"
                        id="surname"
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
                        class="form__input"
                        placeholder=" "
                        maxlength="15"
                        minlength="8"
                        required
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
                        class="form__input"
                        placeholder=" "
                        required
                />
                <label for="email" class="form__label">Email</label>
                <!-- For case the info is wrong -->
                <c:if test="${errorReg == true}">
                    <i class="isax isax-information form__icon-alert"></i>
                    <div class="input__error form__field">
                    <span class="input__error-message">
                            ${errorRegister}
                    </span>
                    </div>
                </c:if>
            </div>
            <!-- password -->
            <div class="form__field">
                <i class="isax isax-lock form__icon"></i>
                <input
                        type="password"
                        name="password"
                        id="password"
                        class="form__input"
                        placeholder=" "
                        minlength="8"
                        required
                />
                <label for="password" class="form__label">Contraseña</label>
            </div>
            <!-- terms and conditions -->
            <label for="terms" class="form__field form__checkbox">
                <input type="checkbox" id="terms" class="form__checkbox-input" required/>
                Acepto los términos y condiciones
            </label>
            <!-- button -->
            <input
                    type="submit"
                    value="Registrar"
                    class="form__button form__field"
            />
        </form>
        <a href="${pageContext.request.contextPath}/views/user/login.jsp" class="form__login-link">
            ¿ya tienes una cuenta?
            <span class="form__link-span">Inicia aquí</span>
        </a>
    </div>
</section>

<!-- ========== Import scripts for animations ========== -->
<script src="${pageContext.request.contextPath}/js/form.js"></script>
</body>
</html>
