<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="../../styles/normalize.css" />
    <link rel="stylesheet" href="../../styles/style-icon.css" />
    <link rel="stylesheet" href="../../styles/overall-styles.css" />

    <!-- ========== styles for view admin ========== -->
    <link rel="stylesheet" href="styles/styles.css" />
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="styles/sale.css" />
    <link rel="stylesheet" href="styles/audit.css" />
    <title>Auditoria</title>
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
            <img
                    src="assets/img/photo-admin.webp"
                    alt="Name of admin"
                    class="nav__img nav__zipped-img"
                    id="speaker-image"
            />
            <p class="nav__user nav__zipped-speaker" id="speaker-name">Jhon Doe</p>
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
                <a href="message.jsp" class="nav__link">
                    <i class="isax isax-message-favorite nav__icon"></i>
                    <span class="nav__link-text"> Mensajes </span>
                </a>
            </li>
            <!-- Sales -->
            <li class="nav__item">
                <a href="sale.jsp" class="nav__link">
                    <i class="isax isax-money-send nav__icon"></i>
                    <span class="nav__link-text"> Ventas </span>
                </a>
            </li>
            <!-- Clients -->
            <li class="nav__item">
                <a href="client.jsp" class="nav__link">
                    <i class="isax isax-people nav__icon"></i>
                    <span class="nav__link-text"> Clientes </span>
                </a>
            </li>
            <!-- Employees -->
            <li class="nav__item">
                <a href="employee.jsp" class="nav__link">
                    <i class="isax isax-speaker-tag nav__icon"></i>
                    <span class="nav__link-text"> Empleados </span>
                </a>
            </li>
            <!-- Products -->
            <li class="nav__item nav__item--active">
                <a href="products.jsp" class="nav__link">
                    <i class="isax isax-element-4 nav__icon"></i>
                    <span class="nav__link-text"> Productos </span>
                </a>
            </li>
            <!-- Setting -->
            <li class="nav__item">
                <a href="setting.jsp" class="nav__link">
                    <i class="isax isax-setting-2 nav__icon"></i>
                    <span class="nav__link-text"> Perfil </span>
                </a>
            </li>
            <!-- logout -->
            <li class="nav__item">
                <a href="../speaker/login.jsp" class="nav__link">
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
            <div class="sale__search search">
                <input
                        type="search"
                        name="search-client"
                        id="search-client"
                        class="search__input"
                        placeholder="Buscar venta"
                />
                <i class="isax isax-search-favorite search__icon"></i>
            </div>
        </div>
        <!-- table HEADER of receipts -->
        <div class="sale container">
            <div class="sale__options options">
                <!-- update -->
                <button class="option option-filter option--active" data-filter="update">Actualizado
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <!-- create -->
                <button class="option option-filter" data-filter="create">Creado
                    <span class="tag-notify tag-notify--primary">8</span>
                </button>
                <!-- delete -->
                <button class="option option-filter" data-filter="delete">Eliminado
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <a href="products.jsp" class="option sale__btn">
                    <i class="isax isax-logout"></i> volver atras
                </a>
            </div>

            <!-- table BODY of clients -->
            <div class="sale__body">
                <!--------- table update --------->
                <div class="sale__delivery filter-item " data-tag="update">
                    <!-- header of table -->
                    <ul class="sale__header grid audit__header">
                        <li class="sale__header-text product__audit">Producto</li>
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
                    <ul class="sale__items audit__items grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="assets/img/bg-product.webp" alt="#" class="client__img audit__img-product">
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">2020/20/08</p>
                        </li>
                        <!-- time -->
                        <li class="sale__item">
                            <span class="sale__text">18:32</span>
                        </li>
                        <!-- Name - product -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">old name</span>
                            <p class="sale__text">name</p>
                        </li>
                        <!-- price -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">old price</span>
                            <p class="sale__text">$ <span class="sale__text">25.00</span></p>
                        </li>
                        <!-- category -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">old cat</span>
                            <p class="sale__text">category</p>
                        </li>
                        <!-- presentation -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">old pres</span>
                            <p class="sale__text">presentation</p>
                        </li>
                        <!-- laboratory -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">old lab</span>
                            <p class="sale__text">laboratory</p>
                        </li>
                        <!-- author -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">admin ...</span>
                            <div class="sale__text audit__img-profile">
                                <img src="assets/img/photo-speaker.webp" alt="#" class="client__img">
                                Anna Doe
                            </div>
                        </li>

                    </ul>
                </div>

                <!--------- table create --------->
                <div class="sale__pick-up filter-item hidden" data-tag="create">
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
                    <ul class="sale__items audit__items-create grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="assets/img/bg-product.webp" alt="#" class="client__img audit__img-product">
                        </li>
                        <!-- name product -->
                        <li class="sale__item">
                            <p class="sale__text">Name</p>
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">2020/20/08</p>
                        </li>
                        <!-- time -->
                        <li class="sale__item">
                            <span class="sale__text">18:32</span>
                        </li>
                        <!-- price -->
                        <li class="sale__item">
                            $<span class="sale__text">5.00</span>
                        </li>
                        <!-- category -->
                        <li class="sale__item">
                            <p class="sale__text">category</p>
                        </li>
                        <!-- presentation -->
                        <li class="sale__item">
                            <p class="sale__text">presentation</p>
                        </li>
                        <!-- laboratory -->
                        <li class="sale__item">
                            <p class="sale__text">laboratory</p>
                        </li>
                        <!-- author -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">admin ...</span>
                            <div class="sale__text audit__img-profile">
                                <img src="assets/img/photo-speaker.webp" alt="#" class="client__img">
                                Anna Doe
                            </div>
                        </li>
                    </ul>
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
                        <li class="sale__header-text">Laboratório</li>
                        <li class="sale__header-text">Autor</li>
                    </ul>
                    <!-- init first  -->
                    <ul class="sale__items grid">
                        <!-- Photo -->
                        <li class="sale__item">
                            <img src="assets/img/bg-product.webp" alt="#" class="client__img audit__img-product">
                        </li>
                        <!-- name product -->
                        <li class="sale__item">
                            <p class="sale__text">Name</p>
                        </li>
                        <!-- date -->
                        <li class="sale__item">
                            <p class="sale__text">2020/20/08</p>
                        </li>
                        <!-- time -->
                        <li class="sale__item">
                            <span class="sale__text">18:32</span>
                        </li>
                        <!-- category -->
                        <li class="sale__item">
                            <p class="sale__text">category</p>
                        </li>
                        <!-- presentation -->
                        <li class="sale__item">
                            <p class="sale__text">presentation</p>
                        </li>
                        <!-- laboratory -->
                        <li class="sale__item">
                            <p class="sale__text">laboratory</p>
                        </li>
                        <!-- author -->
                        <li class="sale__item audit__info">
                            <span class="sale__label-icon">admin ...</span>
                            <div class="sale__text audit__img-profile">
                                <img src="assets/img/photo-speaker.webp" alt="#" class="client__img">
                                Anna Doe
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </section>
</main>

<!-- ========== zipped unzipped nav ========== -->
<script src="js/nav.js"></script>
<script src="js/filter.js"></script>
</body>
</html>
