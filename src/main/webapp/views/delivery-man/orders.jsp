<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="../../styles/normalize.css">
    <link rel="stylesheet" href="../../styles/style-icon.css">
    <link rel="stylesheet" href="../../styles/overall-styles.css">

    <!-- ========== styles for view delivery-man ========== -->
    <link rel="stylesheet" href="styles/styles.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="styles/orders.css">
    <title>Pedidos</title>
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header">
    <nav class="nav">
        <a href="../speaker/login.jsp" class="nav__logout">
            <i class="isax isax-logout nav__icon"></i>
            <span class="nav__text">logout</span>
        </a>
        <div class="nav__logo">
            <h1 class="logo logo--gradient">Icis</h1>
        </div>
        <a href="settings.jsp" class="nav__profile">
            <img src="assets/img/photo-speaker.webp" alt="speaker" class="nav__img">
        </a>
    </nav>
</header>

<!-- ========== content ========== -->
<section class="container options">
    <div class="option option--active option-filter" data-filter="all">
        todo<span class="tag-notify">8</span>
    </div>
    <div class="option option-filter" data-filter="earring">
        Pendientes <span class="tag-notify">8</span>
    </div>
    <div class="option option-filter" data-filter="delivered">entregados</div>
</section>

<section class="container cards grid" id="drop-items">
    <!-- one card earring -->
    <div class="container card__delivery filter-item" data-tag="earring">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--earring">
                <i class="isax isax-close-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient">
            Entregado
        </div>
    </div>
    <!-- one card delivered -->
    <div class="container card__delivery filter-item" data-tag="delivered">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--delivered">
                <i class="isax isax-tick-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient disabled">
            Entregado
        </div>
    </div>
    <!-- one card earring -->
    <div class="container card__delivery filter-item" data-tag="earring">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--earring">
                <i class="isax isax-close-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient">
            Entregado
        </div>
    </div>
    <!-- one card delivered -->
    <div class="container card__delivery filter-item" data-tag="delivered">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--delivered">
                <i class="isax isax-tick-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient disabled">
            Entregado
        </div>
    </div>    <!-- one card earring -->
    <div class="container card__delivery filter-item" data-tag="earring">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--earring">
                <i class="isax isax-close-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient">
            Entregado
        </div>
    </div>
    <!-- one card delivered -->
    <div class="container card__delivery filter-item" data-tag="delivered">
        <div class="card__row card__date">
            <div class="card__info">
                <h6 class="card__normal-data">20/06/20</h6>
                <span class="card__small-data">Fecha de entrega</span>
            </div>
            <div class="card__icon--delivered">
                <i class="isax isax-tick-circle"></i>
            </div>
        </div>
        <div class="card__row card__client">
            <div class="card__info">
                <h6 class="card__normal-data">Anna Smith</h6>
                <span class="card__small-data">12345678</span>
            </div>
            <a class="btn btn-primary card__icon">
                <i class="isax isax-call"></i>
            </a>
        </div>
        <div class="card__row card__address">
            <div class="card__info">
                <h6 class="card__normal-data">Av example</h6>
                <span class="card__small-data">San juan de miraflores</span>
            </div>
            <div class="btn btn-primary card__icon">
                <i class="isax isax-location"></i>
            </div>
        </div>
        <div class="card__button btn btn-gradient disabled">
            Entregado
        </div>
    </div>
</section>

<!-- ========== Scripts ========== -->
<script src="../admin/js/filter.js"></script>
<script src="js/Sortable.min.js"></script>
<script src="js/drag-drop.js"></script>
</body>
</html>
