<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="../../styles/normalize.css">
    <link rel="stylesheet" href="../../styles/style-icon.css">
    <link rel="stylesheet" href="../../styles/overall-styles.css">
    <link rel="stylesheet" href="../../styles/form.css">

    <link rel="stylesheet" href="../admin/styles/setting.css">
    <!-- ========== styles for view delivery-man ========== -->
    <link rel="stylesheet" href="styles/styles.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="styles/settings.css">
    <title>Perfil</title>
</head>
<body>
<!-- ========== navbar ========== -->
<header class="container">
    <nav class="nav">
        <a href="orders.jsp" class="nav__logout">
            <i class="isax isax-logout nav__icon"></i>
            <span class="nav__text">Atras</span>
        </a>
        <div class="nav__logo">
            <h1 class="logo logo--gradient">Icis</h1>
        </div>
        <div class="nav__profile">
            <img src="assets/img/photo-user.webp" alt="user" class="nav__img">
        </div>
    </nav>
</header>

<!-- ========== profile ========== -->
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
                            class="profile__input hidden"
                            accept="image/*"
                    />
                    <i class="isax isax-user-octagon profile__icon"></i>
                </div>
            </form>
            <div class="profile__data">
                <div class="profile__name">Anna Smith</div>
                <div class="profile__username">delivery@gmail.com</div>
            </div>
        </div>
        <!-- here init form :d -->
        <form action="" class="form__container grid">
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
<!-- ========== scripts ========== -->
<script src="../../js/form.js"></script>
</body>
</html>
