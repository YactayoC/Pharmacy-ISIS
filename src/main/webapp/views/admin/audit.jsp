<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css" />

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/styles.css" />
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/sale.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/audit.css" />
    <title>Auditoria</title>
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
                <a href="summary.jsp" class="nav__link">
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
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/sale.jsp" class="nav__link">
                    <i class="isax isax-money-send nav__icon"></i>
                    <span class="nav__link-text"> Ventas </span>
                </a>
            </li>
            <!-- Clients -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/client.jsp" class="nav__link">
                    <i class="isax isax-people nav__icon"></i>
                    <span class="nav__link-text"> Clientes </span>
                </a>
            </li>
            <!-- Employees -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/employee.jsp" class="nav__link">
                    <i class="isax isax-user-tag nav__icon"></i>
                    <span class="nav__link-text"> Empleados </span>
                </a>
            </li>
            <!-- Products -->
            <li class="nav__item nav__item--active">
                <a href="${pageContext.request.contextPath}/views/admin/products.jsp" class="nav__link">
                    <i class="isax isax-element-4 nav__icon"></i>
                    <span class="nav__link-text"> Productos </span>
                </a>
            </li>
            <!-- Setting -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/admin/setting.jsp" class="nav__link">
                    <i class="isax isax-setting-2 nav__icon"></i>
                    <span class="nav__link-text"> Perfil </span>
                </a>
            </li>
            <!-- logout -->
            <li class="nav__item">
                <a href="${pageContext.request.contextPath}/views/user/login.jsp" class="nav__link">
                    <i class="isax isax-logout nav__icon"></i>
                    <span class="nav__link-text"> Salir </span>
                </a>
            </li>
        </ul>
    </nav>
</header>

<!-- ========== content sales ========== -->
<main class="page__sales">
    <h1 class="page__title">Auditoria</h1>
    <section class="section container sales">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Lista</h2>
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
        <div class="sale container">
            <div class="sale__options options">
                <!-- update -->
                <button class="option option-filter option--active" data-filter="update">Actualizado
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <!-- create -->
                <button class="option option-filter" data-filter="insert">Creado
                    <span class="tag-notify tag-notify--primary">8</span>
                </button>
                <!-- delete -->
                <button class="option option-filter" data-filter="delete">Eliminado
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <a href="${pageContext.request.contextPath}/SAProducts?action=list" class="option sale__btn">
                    <i class="isax isax-logout"></i> volver atras
                </a>
            </div>

            <!-- table BODY of clients -->
            <div class="sale__body">
                <!--------- table update --------->

                <div class="sale__delivery filter-item " data-tag="update">

                    <!-- header of table -->
                    <ul class="sale__header grid audit__header">
                        <li class="sale__header-text">Imagen</li>
                        <li class="sale__header-text">Fecha</li>
                        <li class="sale__header-text">Hora</li>
                        <li class="sale__header-text">N Nombre</li>
                        <li class="sale__header-text">N Precio</li>
                        <li class="sale__header-text">N Categ...</li>
                        <li class="sale__header-text">N Prese...</li>
                        <li class="sale__header-text">N Lab...</li>
                        <li class="sale__header-text">Autor</li>
                    </ul>

                    <!-- init first  -->
                    <c:forEach items="${audit}" var="audit">
                        <c:if test="${audit.getAction().getIdAction() == 1}">
                        <ul class="sale__items audit__items grid table__update">
                            <!-- Photo -->
                            <li class="sale__item audit__info">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getOldPhoto()}" alt="old image" class="client__img audit__img-product sale__label-icon">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getNewPhoto()}" alt="#" class="client__img audit__img-product">
                            </li>
                            <!-- date -->
                            <li class="sale__item">
                                <p class="sale__text">${audit.getRegistD()}</p>
                            </li>
                            <!-- time -->
                            <li class="sale__item">
                                <span class="sale__text">${audit.getHour()}</span>
                            </li>
                            <!-- Name - product -->
                            <li class="sale__item audit__info">
                                <span class="sale__label-icon">${audit.getOldPname()}</span>
                                <p class="sale__text">${audit.getNewPname()}</p>
                            </li>
                            <!-- price -->
                            <li class="sale__item audit__info">
                                <span class="sale__label-icon">${audit.getOldPprice()}</span>
                                <p class="sale__text">S/. <span class="sale__text">${audit.getNewPprice()}</span></p>
                            </li>
                            <!-- category -->
                            <li class="sale__item audit__info">
                                <p class="sale__text">${audit.getNewPcateg().getNameC()}</p>
                            </li>
                            <!-- presentation -->
                            <li class="sale__item audit__info">
                                <p class="sale__text">${audit.getNewPpresent().getNamePr()}</p>
                            </li>
                            <!-- laboratory -->
                            <li class="sale__item audit__info">

                                <p class="sale__text">${audit.getNewPlab().getNameL()}</p>
                            </li>
                            <!-- author -->
                            <li class="sale__item audit__info">
                                <span class="sale__label-icon">Trabajador</span>
                                <div class="sale__text audit__img-profile">
                                    <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getAvatarE()}" alt="#" class="client__img">
                                        Trabajador

                                </div>
                            </li>
                        </ul>
                        </c:if>
                    </c:forEach>
                </div>

                <!--------- table create --------->
                <div class="sale__pick-up filter-item hidden"  data-tag="insert"> <!-- SE PONE DATA-TAG -->
                    <!-- header of table -->
                    <ul class="sale__header audit__header-create grid">
                        <li class="sale__header-text sale__total-text">Producto</li>
                        <li class="sale__header-text">Fecha</li>
                        <li class="sale__header-text">Hora</li>
                        <li class="sale__header-text">Precio</li>
                        <li class="sale__header-text">Categoría</li>
                        <li class="sale__header-text">Presentación</li>
                        <li class="sale__header-text">Laboratório</li>
                        <li class="sale__header-text">Autor</li>
                    </ul>
                    <!-- init first  -->
                    <c:forEach items="${audit}" var="audit">
                        <c:if test="${audit.getAction().getIdAction() == 2}">
                    <ul class="sale__items audit__items-create grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getNewPhoto()}" alt="#" class="client__img audit__img-product">
                        </li>
                        <!-- name product -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getNewPname()}</p>
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getRegistD()}</p>
                        </li>
                        <!-- time -->
                        <li class="sale__item">
                            <span class="sale__text">${audit.getHour()}</span>
                        </li>
                        <!-- price -->
                        <li class="sale__item">
                            S/.<span class="sale__text">${audit.getNewPprice()}</span>
                        </li>
                        <!-- category -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getNewPcateg().getNameC()}</p>
                        </li>
                        <!-- presentation -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getNewPpresent().getNamePr()}</p>
                        </li>
                        <!-- laboratory -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getNewPlab().getNameL()}</p>
                        </li>
                        <!-- author -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">Trabajador</span>
                            <div class="sale__text audit__img-profile">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getAvatarE()}" alt="#" class="client__img">
                                Trabajador
                            </div>
                        </li>
                    </ul>
                        </c:if>
                    </c:forEach>
                </div>

                <!--------- table delete --------->
                <div class="sale__offline filter-item hidden" data-tag="delete">
                    <!-- header of table -->
                    <ul class="sale__header grid">
                        <li class="sale__header-text sale__total-text">Producto</li>
                        <li class="sale__header-text">Fecha</li>
                        <li class="sale__header-text">Hora</li>
                        <li class="sale__header-text">Categoría</li>
                        <li class="sale__header-text">Presentación</li>
                        <li class="sale__header-text">Laboratorio</li>
                        <li class="sale__header-text">Autor</li>
                    </ul>
                    <!-- init first  -->
                    <c:forEach items="${audit}" var="audit">
                        <c:if test="${audit.getAction().getIdAction() == 3}">
                    <ul class="sale__items grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getOldPhoto()}" alt="#" class="client__img audit__img-product">
                        </li>
                        <!-- name product -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getOldPname()}</p>
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getRegistD()}</p>
                        </li>
                        <!-- time -->
                        <li class="sale__item">
                            <span class="sale__text">${audit.getHour()}</span>
                        </li>
                        <!-- category -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getOldPcateg().getNameC()}</p>
                        </li>
                        <!-- presentation -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getOldPpresent().getNamePr()}</p>
                        </li>
                        <!-- laboratory -->
                        <li class="sale__item">
                            <p class="sale__text">${audit.getOldPlab().getNameL()}</p>
                        </li>
                        <!-- author -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">Trabajador</span>
                            <div class="sale__text audit__img-profile">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${audit.getAvatarE()}" alt="#" class="client__img">
                                Trabajador
                            </div>
                        </li>
                    </ul>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

        </div>
    </section>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>

</body>
</html>