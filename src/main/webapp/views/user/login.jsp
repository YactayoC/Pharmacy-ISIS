<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- ========== default styles and icons ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/swiper-bundle.min.css" />

        <!-- ========== styles for view user ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css" />
        <!-- ========== styles only this page ========== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css"/>
        <title>Ingresar Icis</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/SCHome?action=list" class="isax isax-logout btn-icon form__btn-back"></a>
        <!-- Content register -->
        <section class="section form">
            <div class="form__img">
                <img src="${pageContext.request.contextPath}/views/user/assets/img/register-bg.webp" alt="Medic and Doctor" />
                <div class="form__buttons">
                    <a href="#" class="form__active form__btn-action">Login</a>
                    <a href="${pageContext.request.contextPath}/views/user/register.jsp" class="form__btn-action" >Register</a>
                </div>
            </div>
            <!-- form -->
            <div class="form__content form__content--login">
                <h2 class="form__logo logo logo--gradient">Icis</h2>
                <p class="form__phrase">Entra con tu cuenta </p>
                <!-- here init form :d -->
                <form action="${pageContext.request.contextPath}/SGLogin?action=login" class="form__container form__container--register grid" id="form" method="POST">
                    <!--  Email -->
                    <div class="form__field form__field--login">
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
                    </div>
                    <!-- password -->
                    <div class="form__field form__field--login">
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
                    <!-- button -->
                    <input
                        type="submit"
                        value="Iniciar Sesión"
                        class="form__button form__field"
                        />
                    <c:if test="${errorLog == true}">
                    <p>${errorLogin}</p>
                    </c:if>
                </form>
                <a href="${pageContext.request.contextPath}/views/user/register.jsp" class="form__login-link">
                    ¿Aun no tienes una cuenta?
                    <span class="form__link-span">Inicia aquí</span>
                    <!-- error acc -->
                </a>
            </div>
        </section>

        <!-- ========== Import scripts for animations ========== -->
        <script src="${pageContext.request.contextPath}/js/form.js"></script>
    </body>
</html>
