<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/employee.css">
    <title>Empleados</title>
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
            <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/${avatarE}" alt="Name of admin"
                 class="nav__img nav__zipped-img" id="user-image">
            <p class="nav__user nav__zipped-user" id="user-name">${surnameE}</p>
        </div>
        <ul class="nav__list grid">
            <!-- summary -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/summary.jsp" class="nav__link">
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
            <li class="nav__item nav__item--active">
                <a href="${pageContext.request.contextPath}/SAEmployees?action=list" class="nav__link">
                    <i class="isax isax-user-tag nav__icon"></i>
                    <span class="nav__link-text">
              Empleados
            </span>
                </a>
            </li>
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
            <li class="nav__item">
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

<!-- ========== content employees ========== -->
<main class="main">
    <h1 class="page__title">Empleados</h1>
    <section class="section container employees">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Empleados</h2>
            </div>
            <form class="employee__search search">
                <input
                        type="search"
                        name="search-employee"
                        id="search-employee"
                        class="search__input"
                        placeholder="Buscar Empleado"
                />
                <button type="submit" class="search__button" name="action" value="search">
                    Buscar
                    <i class="isax isax-search-favorite search__icon"></i>
                </button>
            </form>
        </div>
        <!-- table HEADER of receipts -->
        <div class="employee container">
            <div class="employee__options options">
                <button class="option option-filter option--active" data-filter="all">Todo
                    <span class="tag-notify tag-notify--primary">8</span>
                </button>
                <button class="option option-filter" data-filter="Vendedor">Vendedor
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <button class="option option-filter" data-filter="Repartidor">Repartidor
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <button class="option employee__btn" id="add-entity">
                    <i class="isax isax-profile-add employee__icon"></i> Agregar Empleados
                </button>
            </div>

            <!-- table BODY of clients -->
            <div class="employee__body">
                <!--------- table all products employees --------->
                <div class="employee__delivery">
                    <!-- header of table -->
                    <ul class="employee__header grid">
                        <li class="employee__header-text employee__name">Nombre</li>
                        <li class="employee__header-text tablet__hidden">DNI</li>
                        <li class="employee__header-text">Email</li>
                        <li class="employee__header-text mobil-hidden">Password</li>
                        <li class="employee__header-text  tablet__hidden">Tel</li>
                        <li class="employee__header-text">Rol</li>
                        <li class="product__header-text">Editar</li>
                        <li class="product__header-text">Remover</li>
                    </ul>

                    <!-- row table delivery  -->
                    <c:forEach var="employees" items="${employees}">
                        <ul class="employee__items grid filter-item" data-tag="${employees.getRole().getNameR()}">
                            <!-- Photo -->
                            <li class="employee__item">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/${employees.getUser().getAvatar()}"
                                     alt="#" class="client__img">
                            </li>
                            <!-- name -->
                            <li class="employee__item">
                                <p class="employee__text">${employees.getName()} ${employees.getSurname()}</p>
                            </li>
                            <!-- DNI -->
                            <li class="employee__item tablet__hidden">
                                <span class="employee__text">${employees.getDocIdentity()}</span>
                            </li>
                            <!-- email -->
                            <li class="employee__item">
                                <p class="employee__text">${employees.getUser().getEmail()}</p>
                            </li>
                            <!-- password -->
                            <li class="employee__item mobil-hidden">
                                <span class="employee__text"> ${employees.getUser().getPassword()} </span>
                            </li>
                            <!-- phone -->
                            <li class="employee__item tablet__hidden">
                                <span class="employee__text">${employees.getPhone()}</span>
                            </li>
                            <!-- Role -->
                            <c:if test="${employees.getRole().getIdRole() == 3}">
                                <li class="employee__item employee__role">
                                    <span class="employee__label-icon"> Repartidor </span>
                                    <i class="isax isax-truck-tick employee__icon"></i>
                                </li>
                            </c:if>
                            <c:if test="${employees.getRole().getIdRole() == 2}">
                                <li class="employee__item employee__role">
                                    <span class="employee__label-icon"> Vendedor </span>
                                    <i class="isax isax-user-tag employee__icon"></i>
                                </li>
                            </c:if>
                            <!-- edit -->
                            <li class="employee__item employee__details employee__edit edit-entity"
                                data-id="${employees.getIdEmployee()}"
                                data-name="${employees.getName()}"
                                data-lastname="${employees.getSurname()}"
                                data-dni="${employees.getDocIdentity()}"
                                data-email="${employees.getUser().getEmail()}"
                                data-password="${employees.getUser().getPassword()}"
                                data-phone="${employees.getPhone()}"
                                data-role="${employees.getRole().getIdRole()}"
                            >
                                <i class="isax isax-eye employee__icon"></i>
                            </li>
                            <!-- remove -->
                            <li class="employee__item employee__details remove-entity"
                                data-remove="${employees.getIdEmployee()}"
                                data-name="${employees.getName()} ${employee.getSurname()}"
                                data-avatar="${employees.getUser().getAvatar()}">
                                <i class="isax isax-close-circle employee__icon"></i>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>

        </div>
    </section>
</main>


<!-- ========== Modal - form ========== -->
<section class="modal sale__modal-detail hidden" id="modal-form">
    <div class="modal__content container">
        <div class="modal__header">
            <h2 class="modal__title">Agregar Empleado</h2>
        </div>
        <!-- body -->
        <div class="modal__body">
            <section class="product__form-content">
                <!-- init form employee -->
                <form action="${pageContext.request.contextPath}/SAEmployees?action="
                      class="form__container grid" method="post" id="form">
                    <%--id--%>
                    <input type="hidden" id="id-employee" name="id-employee" class="hidden">
                    <!-- name-employee -->
                    <div class="form__field">
                        <i class="isax isax-user form__icon"></i>
                        <input
                            type="text"
                            name="name-employee"
                            id="name-employee"
                            class="form__input"
                            placeholder=" "
                            required
                        >
                        <label for="name-employee" class="form__label">Nombre</label>
                    </div>
                    <!-- role -->
                    <div class="form__field">
                        <i class="isax isax-user-edit form__icon"></i>
                        <select
                                name="role"
                                id="role"
                                class="form__input form__select"
                                required
                                placeholder="">
                            <option value="2">Vendedor</option>
                            <option value="3">Repartidor</option>
                        </select>
                        <label for="role" class="form__label">Rol</label>
                    </div>
                    <!-- last name -->
                    <div class="form__field employee__last-name">
                        <i class="isax isax-user form__icon"></i>
                        <input
                            type="text"
                            name="last-name"
                            id="last-name"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="last-name" class="form__label">Apellido</label>
                    </div>
                    <!-- DNI -->
                    <div class="form__field">
                        <i class="isax isax-card-pos form__icon"></i>
                        <input
                            type="text"
                            name="dni"
                            id="dni"
                            class="form__input"
                            required
                            placeholder=" "
                        />
                        <label for="dni" class="form__label">DNI</label>
                    </div>
                    <!-- email -->
                    <div class="form__field product__email">
                        <i class="isax isax-sms-notification form__icon"></i>
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
                    <!-- Password -->
                    <div class="form__field ">
                        <i class="isax isax-shield form__icon"></i>
                        <input
                            type="password"
                            name="password"
                            id="password"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="password" class="form__label">Contraseña</label>
                    </div>
                    <!-- Phone -->
                    <div class="form__field">
                        <i class="isax isax-call form__icon"></i>
                        <input
                            type="tel"
                            name="phone"
                            id="phone"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="phone" class="form__label">Teléfono</label>
                    </div>

                    <!-- cancel -->
                    <div class="form__field btn btn-alert cancel-modal">
                        <i class="isax isax-information form__icon"></i>
                        <span class="btn-text">Cancelar</span>
                    </div>
                    <!-- confirm -->
                    <button type="submit" class="form__field btn btn-success">
                        <i class="isax isax-verify form__icon"></i>
                        <span class="btn-text">Confirmar</span>
                    </button>
                </form>
            </section>
        </div>
    </div>
</section>

<!-- ========== Modal - confirm ========== -->
<section class="modal hidden" id="modal-confirm">
    <div class="modal__content modal__content--confirm container">
        <!-- header modal -->
        <div class="modal__header">
            <h2 class="modal__title modal__title--confirm">¿Está seguro de eliminar este Empleado?</h2>
        </div>
        <!-- body -->
        <div class="modal__body--confirm">
            <p class="modal__text" id="modalName"></p>
            <img src="${pageContext.request.contextPath}/views/admin/assets/avatar/" alt="mx-pwer"
                 class="modal__img--confirm" id="modalImage">
        </div>
        <!-- footer btn -->
        <div class="modal__footer">
            <button class="btn btn-success cancel-modal">Cancelar</button>
            <a href="${pageContext.request.contextPath}/SAEmployees?action=delete&idEmployee="
               class="btn btn-alert" id="btn-delete">Eliminar</a>
        </div>
    </div>
</section>
<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/js/form.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>
<%--script for show and hide modal--%>
<script src="${pageContext.request.contextPath}/views/admin/js/modal.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/js/dynamic-modal.js"></script>

<%--script for modal cancel--%>
<script>
    const btnRemove = document.querySelectorAll(".remove-entity"),
        modalbtn = document.querySelector("#btn-delete"),
        modalImage = document.querySelector("#modalImage"),
        modalName = document.querySelector("#modalName");
    btnRemove.forEach(i => {
        const idDelete = i.getAttribute("data-remove"),
            urlmodal = modalbtn.getAttribute("href"),
            nameEmployee = i.getAttribute("data-name"),
            imageEmployee = i.getAttribute("data-avatar"),
            urlAvatar = modalImage.getAttribute("src");
        i.addEventListener("click", () => {
            modalbtn.href = urlmodal + idDelete
            modalImage.src = urlAvatar + imageEmployee
            modalName.textContent = nameEmployee
        })
    })
</script>
</body>
</html>
