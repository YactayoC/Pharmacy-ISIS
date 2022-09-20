<%@ page import="com.proyect.modelsDTO.OProduct.Product" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/product.css">
    <title>Productos</title>
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
            <!-- sales -->
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
            <li class="nav__item nav__item--active">
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

<!-- ========== Products list ========== -->
<main class="page__products">
    <h1 class="page__title">Productos</h1>
    <section class="section container products">
        <!-- subtitle -->
        <div class="section__header">
            <div class="section__title">
                <span class="section__title-item"></span>
                <h2 class="section__title-text">Lista</h2>
            </div>
            <form class="product__search search">
                <input
                    type="search"
                    name="search-product"
                    id="search-product"
                    class="search__input"
                    placeholder="Buscar producto"
                />
                <button type="submit" class="search__button" name="action" value="search">
                    Buscar
                    <i class="isax isax-search-favorite search__icon"></i>
                </button>
            </form>
        </div>
        <!-- table HEADER of receipts -->
        <div class="product container">
            <div class="product__options options">
                <button class="option option-filter option--active" data-filter="all">Todo
                    <span class="tag-notify tag-notify--primary">8</span>
                </button>
                <button class="option option-filter" data-filter="0">Agotados
                    <span class="tag-notify tag-notify--primary">7</span>
                </button>
                <a href="${pageContext.request.contextPath}/SAAudit?action=list" class="option product__btn">
                    <i class="isax isax-receipt-search product__icon"></i> Auditoria
                </a>
                <button class="option product__btn product__add" id="add-entity">
                    <i class="isax isax-bag-tick product__icon"></i> agregar
                </button>
            </div>

            <!-- table BODY of clients -->
            <div class="product__body">
                <!--------- table all products --------->
                <div class="product__delivery">
                    <!-- header of table -->
                    <ul class="product__header grid">
                        <li class="product__header-text product__name-text">Producto</li>
                        <li class="product__header-text">Stock</li>
                        <li class="product__header-text">Precio</li>
                        <li class="product__header-text product__category">Categoría</li>
                        <li class="product__header-text product__laboratory">Laboratorio</li>
                        <li class="product__header-text product__presentation">Presentación</li>
                        <li class="product__header-text">Editar</li>
                        <li class="product__header-text">Remover</li>
                    </ul>

                    <!-- table init first  -->
                    <c:forEach items="${products}" var="products">
                        <ul class="product__items grid filter-item" data-tag="${products.getStock()}">
                            <!-- image -->
                            <li class="product__item product__img">
                                <img src="${pageContext.request.contextPath}/views/admin/assets/img/${products.getUrlPhoto()}"
                                     alt="#" class="client__img">
                            </li>
                            <!-- name  -->
                            <li class="product__item">
                                <p class="product__text">${products.getNameP()}</p>
                            </li>
                            <!-- stock -->
                            <li class="product__item">
                                <span class="product__text">${products.getStock()}</span>
                            </li>
                            <!-- price -->
                            <li class="product__item">
                                S/<span class="product__text">${products.getPrice()}</span>
                            </li>
                            <!-- Category -->
                            <li class="product__item product__category">
                                <p class="product__text">${products.getCategory().getNameC()}</p>
                            </li>
                            <!-- Laboratory -->
                            <li class="product__item product__laboratory">
                                <p class="product__text">${products.getLaboratory().getNameL()}</p>
                            </li>
                            <!-- presentation -->
                            <li class="product__item product__presentation">
                                <p class="product__text">${products.getPresentation().getNamePr()}</p>
                            </li>
                            <!-- edit -->
                            <li class="product__item product__edit edit-entity"
                                data-id="${products.getIdProduct()}"
                                data-image="${products.getUrlPhoto()}"
                                data-name="${products.getNameP()}"
                                data-stock="${products.getStock()}"
                                data-price="${products.getPrice()}"
                                data-precaution="${products.getDetail()}"
                                data-category="${products.getCategory().getIdCategory()}"
                                data-laboratory="${products.getLaboratory().getIdLaboratory()}"
                                data-presentation="${products.getPresentation().getIdPresentation()}"
                            >
                                <i class="isax isax-edit product__icon"></i>
                            </li>
                            <!-- remove -->
                            <li class="product__item product__remove remove-entity"
                                data-remove="${products.getIdProduct()}"
                                data-name="${products.getNameP()}"
                                data-image="${products.getUrlPhoto()}">
                                <i class="isax isax-trash product__icon"></i>
                            </li>

                        </ul>
                    </c:forEach>
                    <!-- table init first SOLD OUT
                    <ul class="product__items grid filter-item" data-tag="sold-out">-->
                    <!-- image
                        <li class="product__item product__img">
                            <img src="${pageContext.request.contextPath}/views/admin/assets/img/photo-user.webp" alt="#" class="client__img">
                        </li>-->
                    <!-- name
                    <li class="product__item">
                        <p class="product__text">Name</p>
                    </li>-->
                    <!-- stock
                    <li class="product__item">
                        <span class="product__text">14</span>
                    </li>-->
                    <!-- precio
                    <li class="product__item">
                        S/<span class="product__text">5.00</span>
                    </li>-->
                    <!-- Category x
                    <li class="product__item product__category">
                        <p class="product__text">syrup</p>
                    </li>-->
                    <!-- Laboratory
                    <li class="product__item product__laboratory">
                        <p class="product__text">Pfizer</p>
                    </li>-->
                    <!-- presentation
                    <li class="product__item product__presentation">
                        <p class="product__text">Units</p>
                    </li>-->
                    <!-- edit
                    <li class="product__item product__edit edit-entity">
                        <i class="isax isax-edit product__icon"></i>
                    </li>-->
                    <!-- remove
                    <li class="product__item product__remove remove-entity">
                        <i class="isax isax-trash product__icon"></i>
                    </li>-->
                    <!--</ul>-->

                </div>

            </div>

        </div>
    </section>
</main>

<!-- ========== Modal - form ========== -->
<section class="modal sale__modal-detail hidden" id="modal-form">
    <div class="modal__content container">
        <div class="modal__header">
            <h2 class="modal__title">Agregar Producto</h2>
        </div>
        <!-- body -->
        <div class="modal__body">
            <section class="product__form-content">
                <!-- init form product -->
                <form action="${pageContext.request.contextPath}/SAProducts?action="
                      class="form__container grid"
                      method="post"
                      enctype="multipart/form-data"
                      id="form"
                >
                  <input type="hidden" name="id-product" id="id-product" class="hidden">
                    <!-- name-prodcut -->
                    <div class="form__field">
                        <i class="isax isax-receipt form__icon"></i>
                        <input
                            type="text"
                            name="nameProduct"
                            id="name-product"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="name-product" class="form__label">Nombre</label>
                    </div>
                    <!-- stock -->
                    <div class="form__field product__stock">
                        <i class="isax isax-box-2 form__icon"></i>
                        <input
                            type="number"
                            name="stock"
                            id="stock"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="stock" class="form__label">Stock</label>
                    </div>
                    <!-- price -->
                    <div class="form__field product__price">
                        <i class="isax isax-moneys form__icon"></i>
                        <input
                            type="number"
                            name="price"
                            id="price"
                            class="form__input"
                            placeholder=" "
                            required
                        />
                        <label for="price" class="form__label">Price</label>
                    </div>
                    <!-- category -->
                    <div class="form__field">
                        <i class="isax isax-tag form__icon"></i>
                        <select
                            name="category"
                            id="category"
                            class="form__input form__select"
                            required
                            placeholder=""
                        >
                            <c:forEach var="categories" items="${categories}">
                                <option value="${categories.getIdCategory()}">${categories.getNameC()}</option>
                            </c:forEach>
                        </select>
                        <label for="category" class="form__label">Categoría</label>
                    </div>
                    <!-- laboratory -->
                    <div class="form__field">
                        <i class="isax isax-tag form__icon"></i>
                        <select
                            name="laboratory"
                            id="laboratory"
                            class="form__input form__select"
                            required
                            placeholder=""
                        >
                            <c:forEach var="laboratories" items="${laboratories}">
                                <option value="${laboratories.getIdLaboratory()}">${laboratories.getNameL()}</option>
                            </c:forEach>
                        </select>
                        <label for="laboratory" class="form__label">Laboratorio</label>
                    </div>
                    <!-- Presentation -->
                    <div class="form__field">
                        <i class="isax isax-tag form__icon"></i>
                        <select
                            name="presentation"
                            id="presentation"
                            class="form__input form__select"
                            required
                            placeholder=""
                        >
                            <c:forEach var="presentations" items="${presentations}">
                                <option value="${presentations.getIdPresentation()}">${presentations.getNamePr()}</option>
                            </c:forEach>
                        </select>
                        <label for="presentation" class="form__label">Presentación</label>
                    </div>
                    <!-- image -->
                    <div class="btn-primary form__field">
                        <i class="isax isax-gallery-favorite form__icon"></i>
                        <input
                            type="file"
                            name="image"
                            id="image"
                            class="product__image-input hidden"
                            placeholder=" "

                        />
                        <label for="image" class="form__label">Imagen</label>
                    </div>
                    <!-- precaution -->
                    <div class="form__field product__precaution">
                        <i class="isax isax-danger form__icon"></i>
                        <input
                                type="text"
                                name="precaution"
                                id="precaution"
                                class="form__input"
                                placeholder=" "
                                required
                        />
                        <label for="precaution" class="form__label">Precaución</label>
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
            <h2 class="modal__title modal__title--confirm">¿Está seguro de eliminar este producto?</h2>
        </div>
        <!-- body -->
        <div class="modal__body--confirm">
            <p class="modal__text" id="modalName"></p>
            <img src="${pageContext.request.contextPath}/views/admin/assets/img/" alt="product"
                 class="modal__img--confirm" id="modalImage">
        </div>
        <!-- footer btn -->
        <div class="modal__footer">
            <button class="btn btn-success cancel-modal">Cancelar</button>
            <a href="${pageContext.request.contextPath}/SAProducts?action=delete&idProduct=" class="btn btn-alert"
               id="btn-delete">Eliminar</a>
        </div>
    </div>
</section>

<!-- ========== zipped unzipped nav ========== -->
<script src="${pageContext.request.contextPath}/views/admin/js/nav.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/filter.js"></script>
<script src="${pageContext.request.contextPath}/js/form.js"></script>

<%--This js is for show and hiddden the modals--%>
<script src="${pageContext.request.contextPath}/views/admin/js/modal.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/js/dynamic-modal.js"></script>

<%--this JS is for confirm modal--%>
<script>
    const btnRemove = document.querySelectorAll(".remove-entity"),
        modalbtn = document.querySelector("#btn-delete"),
        modalImage = document.querySelector("#modalImage"),
        modalName = document.querySelector("#modalName");
    btnRemove.forEach(i => {
        const idDelete = i.getAttribute("data-remove"),
            urlmodal = modalbtn.getAttribute("href"),
            nameProduct = i.getAttribute("data-name"),
            imageProduct = i.getAttribute("data-image"),
            urlImage = modalImage.getAttribute("src");
        i.addEventListener("click", () => {
           modalbtn.href = urlmodal + idDelete
           modalImage.src = urlImage + imageProduct
           modalName.textContent = nameProduct
        })
    })
</script>
</body>
</html>
