<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/swiper-bundle.min.css">

    <!-- ========== styles for view user ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/style.css">
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/user/styles/home.css">
    <title>Principal</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<!-- ========== navbar ========== -->
<header class="header">
    <nav class="nav container">
        <a href="#" class="nav__logo logo logo--white">Icis</a>
        <div class="nav__menu" id="nav__menu">
            <ul class="nav__list grid">
                <!-- items nav -->
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCHome?action=list" class="nav__link"><i
                            class="isax isax-home nav__icon"></i>Principal</a>
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCProducts?action=list" class="nav__link">
                        <i class="isax isax-shop nav__icon"></i>Productos</a>
                </li>
                <li class="nav__item">
                    <a href="${pageContext.request.contextPath}/SCard?action=listCart" class="nav__link nav__bag">
                        Mi bolsa
                        <div class="nav__bag-content">
                            <i class="isax isax-bag"></i>
                            <!-- Items of shopping cart
                            <span class="nav__bag-item">1</span>-->
                        </div>
                    </a>
                </li>
                <!-- searching -->
                <li class="nav__item nav__search">
                    <form class="search">
                        <label class="hidden" for="search"></label>
                        <input type="search"
                               name="search"
                               id="search"
                               class="search__input"
                               placeholder="Buscar">
                        <button type="submit" class="search__button" name="action" value="search">
                            <i class="isax isax-search-favorite search__icon"></i>
                        </button>
                    </form>
                </li>
                <!-- ======== first view of users buttons of login ======== -->
                <c:set var="validats" value="${validats}"/>
                <c:if test="${!validats}">
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/views/user/register.jsp"
                           class="nav__link btn btn-white">Registro</a>
                    </li>
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/views/user/login.jsp"
                           class="nav__link btn btn-white-outline">Iniciar</a>
                    </li>
                </c:if>
                <!-- ======== this view,when the user starts a session ========-->
                <c:if test="${validats}">

                    <!-- Get id Mongo -->
                    <c:set var="idMongo" value="${idMongo}"/>
                    <span id="user-data" class="hidden absolute-path" data-idUser="${idMongo}">
                            ${pageContext.request.contextPath}
                    </span>
                    <li class="nav__item">
                        <a href="${pageContext.request.contextPath}/SCHome?action=getProfile&idClient=${idClientHome}"
                           class="nav__link btn btn-white"> <!--serlvet -->
                            <i class="isax isax-profile-circle nav__profile-icon"></i>

                            <!--This username is from login -->
                            <c:if test="${!actualizateHome}">
                                ${usernameLog}
                            </c:if>

                            <!-- This tag is paintend when the user update their data-->
                            <c:if test="${actualizateHome}">
                                ${usernameHome}
                            </c:if>
                        </a>
                    </li>
                </c:if>
            </ul>
            <i class="isax isax-close-circle nav__close" id="nav__close"></i>
        </div>
        <div class="nav__btn">
            <div class="nav__toggle" id="nav__toggle">
                <i class="isax isax-arrow-circle-up"></i>
            </div>
        </div>
    </nav>
</header>

<%-- ===== content of this page ===== --%>
<main class="main">
    <!-- ========== hero ========== -->
    <section class="hero section">
        <div class="hero__info">
            <div class="hero__logo logo logo--white">Isis</div>
            <div class="hero__about">
                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Praesentium reprehenderit, qui veniam,
                    repellat consectetur ut quod nemo quasi facilis maiores vel eum mollitia porro excepturi aperiam
                    magni libero? Nihil, atque.</p>
            </div>
        </div>
        <div class="hero__content">
            <div class="hero__img">
                <img src="${pageContext.request.contextPath}/views/user/assets/img/mbl-hero-img-1.webp"
                     alt="Mujer con mascarilla">
                <img src="${pageContext.request.contextPath}/views/user/assets/img/dkt-doctor-woman 1.png"
                     alt="Doctora">
                <img src="${pageContext.request.contextPath}/views/user/assets/img/dkt-doctor-man 1.png" alt="Doctor">
            </div>
            <a href="${pageContext.request.contextPath}/SCProducts?action=list" class="hero__btn btn btn-secondary">Ver
                productos</a>
        </div>
    </section>

    <!-- ========== recent products ========== -->
    <section class="offer grid section swiper-container carousel">
        <div class="swiper-wrapper">
            <!-- card  1 -->
            <c:forEach var="products" items="${productsHome}">
                <div class="offer__content swiper-slide">
                    <!-- data -->
                    <div class="offer__data">
                        <h2 class="offer__product">${products.getNameP()}</h2>
                        <p class="offer__description">${products.getDetail()}</p>
                        <span class="offer__quantity">${products.getStock()} unidades</span>
                        <span class="offer__price">$${products.getPrice()}</span>
                        <a onclick="btnAdd(${products.getIdProduct()})" class="offer__btn btn btn-primary">Agregar a carro<i
                                class="isax isax-arrow-right offer__icon"></i></a>
                    </div>
                    <!-- image -->
                    <div class="offer__img">
                        <img src="${pageContext.request.contextPath}/views/admin/assets/img/${products.getUrlPhoto()}"
                             alt="img">
                        <span class="offer__tag btn-white">new</span>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- navigation of swiper  -->
        <div class="swiper-pagination offer__pagination"></div>
    </section>
    <!-- ========== our services ========== -->
    <section class="service section">
        <h2 class="subtitle">Nuestro servicios</h2>
        <div class="service__content">
            <div class="service__item">
                <img class="service__img service__delivery"
                     src="${pageContext.request.contextPath}/views/user/assets/img/mbl-service-1.webp"
                     alt="Servicio de delivery">
                <div class="service__name">Delivery</div>
            </div>
            <div class="service__item">
                <img class="service__img service__medicine"
                     src="${pageContext.request.contextPath}/views/user/assets/img/mbl-service-2.webp"
                     alt="Producto medicos">
                <div class="service__name">Medicina</div>
            </div>
            <div class="service__item">
                <img class="service__img service__chat"
                     src="${pageContext.request.contextPath}/views/user/assets/img/mbl-service-3.webp"
                     alt="Soporte al cliente">
                <div class="service__name">Chat 24/7</div>
            </div>
        </div>
    </section>
    <!-- ========== cards accepted ========== -->
    <section class="cards section">
        <h2 class="subtitle">Tarjetas Aceptadas</h2>
        <div class="cards__content grid">
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#D8E3F3"/>
                        <path d="M137.7 33.4501H129.318C126.784 33.4501 124.835 34.2298 123.665 36.7639L107.681 73.2162H118.987C118.987 73.2162 120.936 68.3429 121.326 67.1733C122.495 67.1733 133.607 67.1733 135.166 67.1733C135.556 68.5378 136.531 73.0212 136.531 73.0212H146.667L137.7 33.4501ZM124.445 58.9861C125.419 56.647 128.733 47.875 128.733 47.875C128.733 48.07 129.708 45.5358 130.098 44.1713L130.878 47.6801C130.878 47.6801 133.022 57.2318 133.412 59.1811H124.445V58.9861Z"
                              fill="#3362AB"/>
                        <path d="M108.46 60.1558C108.46 68.3429 101.053 73.801 89.5516 73.801C84.6783 73.801 79.9999 72.8264 77.4658 71.6568L79.0253 62.6899L80.3898 63.2747C83.8986 64.8342 86.2377 65.419 90.5262 65.419C93.6451 65.419 96.959 64.2494 96.959 61.5203C96.959 59.7659 95.5945 58.5963 91.306 56.647C87.2124 54.6977 81.7543 51.5788 81.7543 45.9258C81.7543 38.1285 89.3567 32.8654 100.078 32.8654C104.171 32.8654 107.68 33.6451 109.824 34.6197L108.265 43.1967L107.485 42.417C105.536 41.6373 103.002 40.8576 99.2982 40.8576C95.2046 41.0525 93.2553 42.8069 93.2553 44.3663C93.2553 46.1207 95.5945 47.4852 99.2982 49.2396C105.536 52.1636 108.46 55.4774 108.46 60.1558Z"
                              fill="#3362AB"/>
                        <path d="M13.3335 33.84L13.5284 33.0603H30.2926C32.6317 33.0603 34.3861 33.84 34.9709 36.3741L38.6746 53.918C34.9709 44.5613 26.3939 36.9589 13.3335 33.84Z"
                              fill="#F9B50B"/>
                        <path d="M62.2613 33.4501L45.3022 73.0212H33.8013L24.0547 39.8828C31.0722 44.3662 36.9202 51.3838 39.0644 56.2571L40.234 60.3506L50.7603 33.2551H62.2613V33.4501Z"
                              fill="#3362AB"/>
                        <path d="M66.7445 33.2551H77.4657L70.6431 73.0212H59.9219L66.7445 33.2551Z" fill="#3362AB"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#CCDEFF"/>
                        <path d="M35.9027 38.3914C34.2314 37.2425 32.0506 36.6666 29.3603 36.6666H18.9446C18.1198 36.6666 17.6642 37.0791 17.5776 37.9033L13.3465 64.4628C13.3026 64.7236 13.3678 64.9622 13.5417 65.1791C13.7146 65.3963 13.9321 65.5044 14.1926 65.5044H19.14C20.0077 65.5044 20.4847 65.0929 20.5722 64.2678L21.7438 57.1074C21.7866 56.7603 21.9392 56.4782 22.1997 56.2609C22.4599 56.044 22.7854 55.9022 23.176 55.8373C23.5666 55.7728 23.9349 55.7402 24.2828 55.7402C24.6296 55.7402 25.0417 55.7623 25.5198 55.8055C25.9967 55.8486 26.3008 55.8699 26.4311 55.8699C30.1631 55.8699 33.0925 54.8183 35.2194 52.7127C37.3452 50.6084 38.4094 47.6902 38.4094 43.957C38.4094 41.3965 37.5731 39.5414 35.9027 38.3908V38.3914ZM30.5324 46.3664C30.3148 47.8856 29.7513 48.8832 28.8399 49.3608C27.9284 49.8389 26.6265 50.0769 24.9342 50.0769L22.7858 50.1418L23.8928 43.1762C23.9791 42.6992 24.2611 42.4604 24.7388 42.4604H25.9761C27.7111 42.4604 28.9705 42.7106 29.7517 43.2088C30.5324 43.7082 30.7929 44.761 30.5324 46.3664V46.3664Z"
                              fill="#003087"/>
                        <path d="M145.819 36.6666H141.003C140.524 36.6666 140.242 36.9054 140.156 37.3831L135.925 64.464L135.859 64.5941C135.859 64.8122 135.946 65.0173 136.12 65.2127C136.293 65.4077 136.511 65.5054 136.771 65.5054H141.068C141.891 65.5054 142.347 65.0939 142.435 64.2688L146.666 37.6436V37.5789C146.666 36.9711 146.383 36.6674 145.819 36.6674V36.6666Z"
                              fill="#009CDE"/>
                        <path d="M87.6227 47.1483C87.6227 46.9318 87.5355 46.7252 87.363 46.5304C87.1889 46.3352 86.9935 46.2369 86.777 46.2369H81.7645C81.2862 46.2369 80.8956 46.455 80.5923 46.8878L73.6921 57.0434L70.8278 47.2788C70.6098 46.585 70.133 46.2369 69.3958 46.2369H64.5127C64.2952 46.2369 64.1 46.3348 63.9275 46.5304C63.7534 46.7252 63.667 46.9322 63.667 47.1483C63.667 47.2356 64.0902 48.5154 64.9363 50.9891C65.7823 53.4636 66.6937 56.1327 67.6703 58.9971C68.6468 61.861 69.1564 63.3808 69.2 63.5529C65.6411 68.4143 63.8624 71.0182 63.8624 71.3648C63.8624 71.9295 64.1439 72.2112 64.7086 72.2112H69.7211C70.1983 72.2112 70.5887 71.9947 70.8931 71.5606L87.4933 47.6037C87.5795 47.5178 87.6227 47.3665 87.6227 47.1481V47.1483Z"
                              fill="#003087"/>
                        <path d="M134.299 46.2373H129.352C128.743 46.2373 128.376 46.9536 128.245 48.386C127.116 46.6506 125.056 45.7816 122.06 45.7816C118.936 45.7816 116.277 46.9536 114.086 49.2972C111.894 51.6407 110.799 54.3974 110.799 57.5651C110.799 60.1261 111.548 62.1657 113.045 63.6841C114.542 65.2041 116.549 65.9626 119.067 65.9626C120.325 65.9626 121.605 65.7017 122.907 65.1814C124.209 64.6607 125.228 63.9666 125.967 63.0983C125.967 63.1419 125.923 63.3365 125.837 63.6835C125.749 64.0313 125.707 64.2926 125.707 64.4647C125.707 65.1599 125.988 65.5061 126.553 65.5061H131.045C131.869 65.5061 132.347 65.0946 132.476 64.2695L135.146 47.2787C135.188 47.0181 135.124 46.7799 134.95 46.5626C134.776 46.3461 134.559 46.2373 134.299 46.2373V46.2373ZM125.804 59.0622C124.697 60.1472 123.363 60.6895 121.8 60.6895C120.541 60.6895 119.522 60.3428 118.741 59.648C117.959 58.9552 117.569 58.0003 117.569 56.7837C117.569 55.1792 118.111 53.8217 119.197 52.7152C120.28 51.6085 121.627 51.0553 123.232 51.0553C124.447 51.0553 125.456 51.4133 126.259 52.129C127.062 52.8453 127.464 53.8327 127.464 55.0916C127.464 56.6538 126.911 57.9778 125.804 59.0622Z"
                              fill="#009CDE"/>
                        <path d="M60.3464 46.2373H55.3989C54.7904 46.2373 54.4223 46.9536 54.292 48.386C53.1202 46.6506 51.0586 45.7816 48.1076 45.7816C44.9828 45.7816 42.3243 46.9536 40.133 49.2972C37.9411 51.6407 36.8457 54.3974 36.8457 57.5651C36.8457 60.1261 37.5945 62.1657 39.0918 63.6841C40.589 65.2041 42.5957 65.9626 45.1132 65.9626C46.3277 65.9626 47.5871 65.7017 48.8888 65.1814C50.1907 64.6607 51.2323 63.9666 52.0135 63.0983C51.8394 63.6186 51.753 64.0745 51.753 64.4647C51.753 65.1599 52.035 65.5061 52.5993 65.5061H57.091C57.9149 65.5061 58.3929 65.0946 58.5232 64.2695L61.1921 47.2787C61.2349 47.0181 61.17 46.7799 60.9969 46.5626C60.8232 46.3461 60.6065 46.2373 60.3464 46.2373V46.2373ZM51.8511 59.0944C50.7442 60.159 49.3874 60.6895 47.7826 60.6895C46.5233 60.6895 45.5143 60.3428 44.7554 59.648C43.9955 58.9552 43.6161 58.0003 43.6161 56.7837C43.6161 55.1792 44.1583 53.8217 45.2437 52.7152C46.3279 51.6085 47.6734 51.0551 49.2797 51.0551C50.4943 51.0551 51.5033 51.4133 52.307 52.129C53.1092 52.8453 53.5112 53.8327 53.5112 55.0916C53.511 56.6974 52.9578 58.0323 51.8511 59.0944V59.0944Z"
                              fill="#003087"/>
                        <path d="M109.855 38.3914C108.184 37.2425 106.003 36.6666 103.312 36.6666H92.9617C92.0935 36.6666 91.6158 37.0791 91.5296 37.9033L87.2982 64.4628C87.2542 64.7236 87.3195 64.9622 87.4936 65.1791C87.6657 65.3963 87.8838 65.5044 88.1442 65.5044H93.482C94.0027 65.5044 94.3497 65.2226 94.5238 64.6583L95.6956 57.1074C95.7388 56.7603 95.8906 56.4782 96.1515 56.2609C96.4119 56.044 96.7371 55.9022 97.1281 55.8373C97.5183 55.7728 97.8866 55.7402 98.2346 55.7402C98.5816 55.7402 98.9935 55.7623 99.4712 55.8055C99.9484 55.8486 100.253 55.8699 100.383 55.8699C104.115 55.8699 107.044 54.8183 109.171 52.7127C111.298 50.6084 112.361 47.6902 112.361 43.957C112.361 41.3965 111.525 39.5412 109.855 38.3908V38.3914ZM103.182 49.1001C102.227 49.751 100.795 50.0763 98.886 50.0763L96.8025 50.1416L97.9092 43.1758C97.9952 42.699 98.2774 42.4598 98.7553 42.4598H99.9267C100.882 42.4598 101.641 42.5034 102.206 42.59C102.769 42.6771 103.312 42.9479 103.833 43.4034C104.354 43.8593 104.614 44.5215 104.614 45.389C104.614 47.2124 104.136 48.4487 103.182 49.1001Z"
                              fill="#009CDE"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>
            </div>
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#FDEACE"/>
                        <path d="M96.6928 21.7578L62.2627 21.8762L63.306 84.909L97.7361 84.7906L96.6928 21.7578Z"
                              fill="#FF5F00"/>
                        <path d="M64.5288 53.5198C64.3158 40.6995 70.0589 29.3081 79.0544 21.9191C72.2644 16.5909 63.752 13.3869 54.5244 13.4185C32.6636 13.4934 15.2756 31.5025 15.6442 53.6873C16.0129 75.872 33.9975 93.76 55.8583 93.6851C65.0859 93.6535 73.4909 90.3916 80.103 85.0175C70.8647 77.8025 64.7419 66.3402 64.5288 53.5198Z"
                              fill="#EB001B"/>
                        <path d="M144.354 52.9799C144.723 75.1647 127.335 93.1737 105.474 93.2486C96.2465 93.2802 87.7341 90.0763 80.9442 84.7481C90.0495 77.3587 95.6828 65.9677 95.4697 53.1473C95.2567 40.3269 89.1357 28.9762 79.8956 21.6496C86.5077 16.2756 94.9127 13.0136 104.14 12.982C126.001 12.9072 143.988 30.9066 144.354 52.9799Z"
                              fill="#F79E1B"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>
            </div>
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#E4E5E7"/>
                        <path d="M76.3909 56.917V72.3296H71.4673V34.2673H84.5255C86.0842 34.235 87.6339 34.5095 89.0852 35.0751C90.5365 35.6406 91.8606 36.486 92.9812 37.5624C94.1131 38.5735 95.0139 39.8135 95.6232 41.199C96.2324 42.5845 96.5359 44.0835 96.5133 45.5952C96.5457 47.115 96.2469 48.6238 95.6372 50.0181C95.0276 51.4125 94.1215 52.6594 92.9812 53.6735C90.6978 55.8358 87.8792 56.916 84.5255 56.914H76.3909V56.917ZM76.3909 38.9534V52.2401H84.6478C85.553 52.2667 86.4539 52.1054 87.2927 51.7666C88.1316 51.4277 88.89 50.9187 89.5194 50.2721C90.1456 49.6676 90.6433 48.9445 90.9831 48.1456C91.323 47.3467 91.4981 46.4883 91.4981 45.621C91.4981 44.7538 91.323 43.8953 90.9831 43.0964C90.6433 42.2975 90.1456 41.5744 89.5194 40.9699C88.8979 40.3097 88.1421 39.7882 87.3022 39.44C86.4624 39.0919 85.5576 38.9249 84.6478 38.9503H76.3909V38.9534Z"
                              fill="#5F6368"/>
                        <path d="M107.86 45.437C111.499 45.437 114.372 46.4028 116.478 48.3343C118.584 50.2658 119.636 52.914 119.634 56.279V72.3293H114.924V68.7153H114.71C112.671 71.6915 109.96 73.1797 106.575 73.1797C103.686 73.1797 101.27 72.3293 99.3246 70.6286C98.3912 69.848 97.6449 68.8705 97.1402 67.7672C96.6355 66.6639 96.385 65.4626 96.4071 64.251C96.4071 61.5562 97.4326 59.4131 99.4836 57.8217C101.535 56.2304 104.273 55.4327 107.698 55.4286C110.621 55.4286 113.029 55.9601 114.921 57.023V55.9054C114.927 55.0794 114.747 54.2625 114.395 53.514C114.043 52.7655 113.528 52.1041 112.887 51.5777C111.585 50.4112 109.888 49.7747 108.135 49.7951C105.385 49.7951 103.208 50.9471 101.606 53.2511L97.2695 50.5391C99.6548 47.1377 103.185 45.437 107.86 45.437ZM101.49 64.3573C101.486 64.9796 101.633 65.5936 101.917 66.1483C102.201 66.703 102.614 67.1822 103.123 67.5461C104.212 68.3967 105.563 68.8474 106.948 68.8216C109.026 68.8182 111.018 67.9969 112.487 66.5378C114.118 65.0133 114.933 63.2245 114.933 61.1715C113.398 59.9567 111.257 59.3493 108.511 59.3493C106.511 59.3493 104.843 59.8282 103.508 60.7858C102.159 61.7576 101.49 62.939 101.49 64.3573V64.3573Z"
                              fill="#5F6368"/>
                        <path d="M146.667 46.2875L130.226 83.8091H125.144L131.245 70.6803L120.434 46.2875H125.786L133.599 64.9952H133.706L141.306 46.2875H146.667Z"
                              fill="#5F6368"/>
                        <path d="M56.4949 53.5945C56.4968 52.1045 56.3699 50.617 56.1157 49.1484H35.3511V57.5699H47.2441C47.0007 58.915 46.4856 60.1971 45.7299 61.3391C44.9741 62.4812 43.9933 63.4594 42.8465 64.2148V69.6813H49.9444C54.1004 65.876 56.4949 60.2485 56.4949 53.5945Z"
                              fill="#4285F4"/>
                        <path d="M35.3511 74.9627C41.2931 74.9627 46.2962 73.0251 49.9445 69.6844L42.8466 64.2179C40.8711 65.5481 38.3267 66.3073 35.3511 66.3073C29.608 66.3073 24.7333 62.4625 22.9902 57.2815H15.6782V62.9151C17.5109 66.5366 20.321 69.581 23.7949 71.7084C27.2688 73.8358 31.2698 74.9625 35.3511 74.9627V74.9627Z"
                              fill="#34A853"/>
                        <path d="M22.9901 57.2815C22.0685 54.5666 22.0685 51.6266 22.9901 48.9116V43.2781H15.6781C14.1364 46.3246 13.3335 49.687 13.3335 53.0966C13.3335 56.5062 14.1364 59.8685 15.6781 62.9151L22.9901 57.2815Z"
                              fill="#FBBC04"/>
                        <path d="M35.3511 39.8857C38.4912 39.8347 41.5253 41.0129 43.7977 43.1656L50.0821 36.9246C46.0971 33.2076 40.8179 31.1669 35.3511 31.2303C31.2698 31.2305 27.2688 32.3572 23.7949 34.4846C20.321 36.612 17.5109 39.6564 15.6782 43.2779L22.9902 48.9115C24.7333 43.7305 29.608 39.8857 35.3511 39.8857Z"
                              fill="#EA4335"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#FDE8CE"/>
                        <path d="M120 53.3503C119.992 75.4427 102.073 93.3439 79.9831 93.3334C57.8927 93.3249 39.9915 75.4089 40 53.3164C40.0085 31.2325 57.9118 13.3355 79.9958 13.3334C102.088 13.3313 119.998 31.2409 120 53.3334V53.3503Z"
                              fill="#F7931A"/>
                        <path d="M87.292 45.5741C87.292 50.6857 79.267 50.0891 76.7134 50.0891V41.0549C79.267 41.0507 87.2814 40.2382 87.2814 45.5699L87.292 45.5741ZM89.395 59.6268C89.395 65.2441 79.779 64.6051 76.7112 64.6072V54.6464C79.779 54.6442 89.3972 53.762 89.3972 59.6226L89.395 59.6268ZM95.7253 43.5472C95.2112 38.1881 90.5841 36.3918 84.7447 35.8798V28.4473H80.2212V35.6852C79.0322 35.6852 77.8156 35.7085 76.6076 35.7338V28.4494H72.0862V35.8798C71.1067 35.8989 70.144 35.9179 69.2067 35.9179V35.8946H62.9653V40.7333C62.9653 40.7333 66.3061 40.6698 66.2511 40.7333C67.5142 40.5704 68.6757 41.4548 68.8534 42.7158V51.1787C69.0121 51.1787 69.1729 51.1893 69.3316 51.2104H68.8534V63.0733C68.8005 63.9556 68.0452 64.6263 67.1651 64.5734H67.1608C67.218 64.6242 63.873 64.5734 63.873 64.5734L62.9738 69.977H68.8619C69.9578 69.977 71.0347 69.996 72.0926 70.0045V77.5217H76.6118V70.0827C77.8516 70.1081 79.0533 70.1187 80.2255 70.1187V77.5238H84.7425V70.0193C92.3592 69.5834 97.6739 67.6666 98.334 60.5239C98.8672 54.7712 96.1611 52.2048 91.8451 51.1681C94.7203 49.8056 96.3135 46.6743 95.7253 43.5472Z"
                              fill="white"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
            <div class="cards__svg">
                <svg width="160" height="107" viewBox="0 0 160 107" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                        <path d="M0 13.3333C0 5.96954 5.96954 0 13.3333 0H146.667C154.03 0 160 5.96954 160 13.3333V93.3333C160 100.697 154.03 106.667 146.667 106.667H13.3333C5.96953 106.667 0 100.697 0 93.3333V13.3333Z"
                              fill="#E6E6E6"/>
                        <path d="M124.035 83.762C130.18 83.762 133.072 81.4172 135.599 74.3097L146.667 43.2663H140.258L132.836 67.2835H132.706L125.284 43.2989H118.695L129.372 72.8459L128.8 74.6431C128.396 77.2156 126.087 79.0508 123.487 78.861C122.991 78.861 122.029 78.8095 121.638 78.758V83.6373C122.433 83.7458 123.235 83.7973 124.035 83.7945V83.762ZM102.679 68.2159C99.3182 68.2159 97.1848 66.5895 97.1848 64.1282C97.1848 61.5774 99.2423 60.0919 103.176 59.856L110.18 59.4142V61.7075C110.026 65.4862 106.835 68.4274 103.056 68.2729C102.929 68.2675 102.804 68.2566 102.679 68.2458V68.2159ZM100.988 73.0329C104.802 73.1359 108.369 71.149 110.286 67.85H110.416V72.7293H116.249V52.5208C116.249 46.6602 111.563 42.8841 104.347 42.8841C97.6538 42.8841 92.704 46.7117 92.5223 51.9732H98.2013C98.879 49.2977 101.422 47.533 104.165 47.8312C108.02 47.8312 110.18 49.6284 110.18 52.9355V55.1746L102.319 55.6436C95 56.0854 91.0423 59.0808 91.0423 64.2908C91.0369 69.574 95.1247 73.0627 100.985 73.0627L100.988 73.0329ZM67.1824 37.4328H74.4472C79.9174 37.4328 83.0429 40.3496 83.0429 45.481C83.0429 50.6124 79.9174 53.5536 74.4228 53.5536H67.1824V37.4328ZM60.8799 32.1198V72.7212H67.1824V58.8802H75.9082C83.0158 59.2624 89.0851 53.8111 89.4674 46.7036C89.489 46.2997 89.4918 45.8985 89.4755 45.4946C89.8116 38.4656 84.3874 32.4966 77.3585 32.1577C76.9437 32.1388 76.5317 32.1415 76.117 32.1605L60.8799 32.1198ZM39.9612 39.6963C36.3396 39.4876 33.2413 41.7537 31.5227 41.7537C29.8041 41.7537 27.1475 39.802 24.2823 39.8562C20.4872 39.9538 17.0283 42.0546 15.1932 45.378C11.287 52.0979 14.1767 62.0463 17.9527 67.5139C19.8014 70.2246 22.0188 73.1929 24.9329 73.0871C27.6924 72.9841 28.7875 71.2899 32.1217 71.2899C35.4559 71.2899 36.4454 73.0871 39.3621 73.0329C42.3819 72.9814 44.2848 70.3222 46.1389 67.6115C47.4455 65.6923 48.462 63.5914 49.1587 61.3768C45.5995 59.8208 43.2927 56.3158 43.2737 52.4313C43.3279 49.005 45.1224 45.8443 48.0392 44.047C46.1796 41.4068 43.1951 39.7858 39.9666 39.6719L39.9612 39.6963ZM37.7004 36.11C36.1146 38.1078 33.6885 39.2545 31.1377 39.2084C30.9751 36.7199 31.8208 34.2721 33.4825 32.4126C35.1361 30.4934 37.4673 29.2898 39.9883 29.054C40.1672 31.6129 39.3458 34.1393 37.695 36.1019"
                              fill="black"/>
                    </g>
                    <defs>
                        <clipPath id="clip0">
                            <rect width="160" height="106.667" fill="white"/>
                        </clipPath>
                    </defs>
                </svg>

            </div>
        </div>
    </section>
    <!-- ========== btn register ========== -->
    <div class="register-btn">
        <a class="btn btn-gradient">Empezar gratis</a>
    </div>
</main>

<!-- ========== message notification ========== -->
<%--<div class="notify">
    <p class="notify__message">
        Hey!! you have <span class="notify__info">5</span> messages
    </p>
</div>--%>
<!-- ========== btn show Chat ========== -->
<div class="btn__show-chat" id="chat__show">
    <i class="isax isax-message btn-icon "></i>
</div>
<!-- ========== Chat ========== -->
<section class="chat" id="chat">
    <div class="chat__blocked">
        <i class="isax isax-user-octagon5 chat__blocked-icon"></i>
        <p class="chat__blocked-message">Necesita acceder a su cuenta para usar el chat</p>
    </div>
    <div class="chat__header">
        <h2 class="chat__title">Enviar un mensaje</h2>
        <div class="chat__close" id="chat__close">
            <i class="isax isax-close-square btn-icon"></i>
        </div>
    </div>
    <%--Chat body--%>
    <div class="chat__body">
        <ul class="chat__messages" id="chat-box">
            <%--Response of administrador--%>
            <li class="chat__box chat__message--response" id="message-response">
                <span class="chat__message">Hola seleccione la relevancia de su mensage</span>
            </li>
            <%--Relevance 1 (MEDIC)--%>
            <li class="chat__box chat__message--response message-relevance" data-relevance="MEDIC">
                <span class="chat__message">1: Médica</span>
            </li>
            <%--Relevance 2 (TECHNICAL)--%>
            <li class="chat__box chat__message--response message-relevance" data-relevance="TECHNICAL">
                <span class="chat__message">2: Técnica</span>
            </li>
            <%--Response of user--%>
            <%--        <li class="chat__box chat__message--request" id="message-request">
                      <span class="chat__message">Hello ;D</span>
                    </li>--%>
        </ul>
    </div>
    <%--Chat buttons --%>
    <form class="chat__footer" id="chat__form">
        <label for="chat-writer" class="hidden"></label>
        <input type="text" id="chat-writer" class="chat__writer" placeholder="Escribe aquí">
        <button class="chat__send btn btn-primary" id="send-message">
            <i class="isax isax-send-2"></i>Enviar
        </button>
    </form>
</section>
<!-- ========== Import scripts for animations ========== -->
<script src="${pageContext.request.contextPath}/js/swiper-bundle.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/animations.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js" type="module"></script>
<script src="${pageContext.request.contextPath}/js/MessageService.js" type="module"></script>
<!-- ========== JS only for this file ========== -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="${pageContext.request.contextPath}/views/user/js/send-datas.js"></script>
</body>
</html>