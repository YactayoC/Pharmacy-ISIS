<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <!-- ========== default styles and icons ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>

  <!-- ========== styles for view admin ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css"/>
  <!-- ========== styles only this page ========== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/message.css"/>
  <title>Mensajes</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
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
  <%--profile--%>
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

      <span id="id-admin" data-id="6137c06a21ede37efd5c916b" class="hidden absolute-path">
        ${pageContext.request.contextPath}
      </span>
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
      <li class="nav__item nav__item--active">
        <a href="${pageContext.request.contextPath}/views/admin/message.jsp" class="nav__link">
          <i class="isax isax-message-favorite nav__icon"></i>
          <span class="nav__link-text"> Mensajes </span>
        </a>
      </li>
      <!-- Sales -->
      <li class="nav__item">
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
      <c:if test="${role == 1}">
        <li class="nav__item">
          <a href="${pageContext.request.contextPath}/SAEmployees?action=list" class="nav__link">
            <i class="isax isax-user-tag nav__icon"></i>
            <span class="nav__link-text"> Empleados </span>
          </a>
        </li>
      </c:if>
      <!-- Products -->
      <li class="nav__item">
        <a href="${pageContext.request.contextPath}/SAProducts?action=list" class="nav__link">
          <i class="isax isax-element-4 nav__icon"></i>
          <span class="nav__link-text"> Productos </span>
        </a>
      </li>
      <!-- Setting -->
      <li class="nav__item">
        <a href="${pageContext.request.contextPath}/SASetting?action=getSetting&idEmployee=${idEmployee}" class="nav__link">
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

<main class="page__message">
  <h1 class="page__title">Messages</h1>
  <section class="container section support">
    <!-- subtitle -->
    <div class="section__header">
      <div class="section__title">
        <span class="section__title-item"></span>
        <h2 class="section__title-text">Ayuda a clientes</h2>
      </div>
      <form class="support__search search">
        <label for="search-client" class="hidden"></label>
        <input
                type="search"
                name="search-client"
                id="search-client"
                class="search__input"
                placeholder="Buscar cliente"
        />
        <button type="submit" class="search__button">
          Buscar
          <i class="isax isax-search-favorite search__icon"></i>
        </button>
      </form>
    </div>
    <!-- body -->
    <div class="support__body grid ">
      <!-- notify of messages -->
      <div class="support__data container">
        <div class="support__options options">
          <p class="option option-filter option--active" id="all" data-filter="all">
            Todo <span class="tag-notify tag-notify--primary">8</span>
          </p>
          <span class="option option-filter" id="medic" data-filter="MEDIC">Médica</span>
          <span class="option option-filter" id="tech" data-filter="TECHNICAL">Técnica</span>
        </div>
        <!-- list of user -->
        <ul class="client__list">
          <!-- init a list clients MEDIC -->

<%--          <li class="client__item filter-item" data-userId="6147a791449dbf10e945714f" data-tag="medic">--%>
<%--            <div class="client__data">--%>
<%--              <img--%>
<%--                  src="${pageContext.request.contextPath}/views/user/assets/avatar/${notify.getEmitter().getPhoto()}"--%>
<%--                  alt="client image"--%>
<%--                  class="client__img client__img-item"--%>
<%--              />--%>
<%--              <div class="client__info">--%>
<%--                <p class="client__name">Angeles</p>--%>
<%--                <span class="client__email">angeles@gmail.com</span>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div class="client__time">--%>
<%--              12:00pm--%>
<%--              <span class="tag-notify tag-notify--primary">5</span>--%>
<%--            </div>--%>
<%--          </li>--%>

          <!-- init a list clients-->
          <c:forEach var="notify" items="${notifies}">
            <li class="client__item filter-item" data-userId="${notify.getEmitter().getId().toString()}" data-tag="${notify.getRelevance()}">
              <div class="client__data">
                <img
                    src="${pageContext.request.contextPath}/views/user/assets/avatar/${notify.getEmitter().getPhoto()}"
                    alt="avatar de ${notify.getEmitter().getName()}"
                    class="client__img client__img-item"
                />
                <div class="client__info">
                  <p class="client__name">${notify.getEmitter().getName()}</p>
                  <span class="client__email">${notify.getEmitter().getEmail()}</span>
                </div>
              </div>
              <div class="client__time">
                ${notify.getDate()}
                <span class="tag-notify tag-notify--green">${notify.getUnReadMessages()}</span>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>

      <!-- whiter a message chat -->
      <div class="support__message container">
        <div class="support__message-overlay"></div>
        <!-- status user -->
        <div class="support__options options">
          <p class="option option--active" id="client">
            Anna Smith
          </p>
          <span class="option" id="status">activo</span>
        </div>
        <!-- chat -->
        <div class="chat__body">
          <ul class="chat__messages" id="chat-box">
            <%-- message response --%>
            <li class="chat__box chat__message--response" id="message-response">
              <!-- user response img + time -->
              <div class="client__info client-profile-message">
                <c:forEach var="notify" items="${notifies}">
                <img src="${pageContext.request.contextPath}/views/user/assets/avatar/${notify.getEmitter().getPhoto()}" alt="" class="client__img client__img-chat">
<%--                <span class="client__time">${notify.getDate()}</span>--%>
                </c:forEach>
              </div>
              <!-- message -->
              <span class="chat__message">Hi...</span>
            </li>

            <%-- message request --%>
            <li class="chat__box chat__message--request" id="message-request">
              <!-- message -->
              <span class="chat__message">Hi...</span>
              <!-- user response img + time -->
              <div class="client__info admin-profile-message">
                <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}" alt="" class="client__img">
<%--                <span class="client__time">${notify.getDate()}</span>--%>
              </div>
            </li>
          </ul>
        </div>
        <!-- send message -->
        <form class="chat__footer" id="chat__form">
          <label for="chat-writer" class="hidden"></label>
          <input type="text" id="chat-writer" class="chat__writer" placeholder="Escribe aquí">
          <button class="chat__send btn-primary" id="send-message-admin">
            <i class="isax isax-send-2"></i>Enviar
          </button>
        </form>
      </div>
    </div>
  </section>
</main>
<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/message.js" type="module"></script>
<script src="${pageContext.request.contextPath}/js/MessageService.js" type="module"></script>
</body>
</html>