<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- ========== default styles and icons ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/form.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/setting.css">
  <!-- ========== styles for view delivery-man ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/delivery-man/styles/styles.css">
  <!-- ========== styles only this page ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/delivery-man/styles/settings.css">
  <title>Perfil</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="container">
  <nav class="nav">
    <a href="${pageContext.request.contextPath}/SAClients?action=listReceV" class="nav__logout">
      <i class="isax isax-logout nav__icon"></i>
      <span class="nav__text">Atras</span>
    </a>
    <div class="nav__logo">
      <h1 class="logo logo--gradient">Icis</h1>
    </div>
    <div class="nav__profile">
      <img src="${pageContext.request.contextPath}/views/delivery-man/assets/img/photo-user.webp" alt="user" class="nav__img">
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
                  data-idUser="1" <%-- here id of user --%>
                  data-path="${pageContext.request.contextPath}"
                  data-urlProfile="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}" <%-- here is URL of profile --%>
                  class="profile__input hidden"
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
                name="dni"
                id="dni"
                value="${employeeS.getDocIdentity()}"
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
                value="${employeeS.getUser().getEmail()}"
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
<!-- ========== scripts ========== -->
<script src="${pageContext.request.contextPath}/js/form.js"></script>
</body>
</html>
