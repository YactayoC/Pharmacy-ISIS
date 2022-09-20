<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- ========== default styles and icons ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/overall-styles.css"/>
    <!-- ========== styles only this page ========== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/receitpP.css"/>
    <title>Recibo</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/fonts/icsis_logo.webp">
</head>
<body>
<a class="fondo" href="${pageContext.request.contextPath}/SAOffline?action=SafeReceipt">
    <img class="fondo2" src="${pageContext.request.contextPath}/views/admin/assets/img/Fondo1.png">
</a>
<section id="Impri">
    <div class="edge">
        <!--RUC-->
        <div class="div2">
            <table class="table2">
                <tr>
                    <th>R.U.C. 10904136472</th>
                </tr>
                <tr>
                    <th>BOLETA DE VENTA</th>
                </tr>
                <tr>
                    <th>${SerialN}</th>
                </tr>
            </table>
        </div>
        <!--LOGO-->
        <div class="div1">
            <img class="Logo" src="${pageContext.request.contextPath}/views/admin/assets/img/Logo.png">
        </div>
        <!--DATOS-->
        <div class="div3-1">
            <table class="table3">
                <tr>
                    <form>
                        <th><p id="dia"></p></th>
                        <th><p id="mes"></p></th>
                        <th><p id="año"></p></th>
                    </form>
                </tr>
            </table>
        </div>
        <div class="div3-2">
            <p>Fecha:</p>
        </div>
        <!--TABLA-->
        <div class="div4">
            <table class="table1">
                <thead>
                <tr>
                    <th>CANT.</th>
                    <th>DESCRIPCIÓN</th>
                    <th>P.UNIT.</th>
                    <th>IMPORTE</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="car" items="${car}">
                    <tr>
                        <td>${car.getCant()}</td>
                        <td>${car.getNamePP()}</td>
                        <td>${car.getPrices()}</td>
                        <td>${car.getSubTotal()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!--SUBTOTAL-->
        <div class="div7">
            <table class="table1">
                <tr>
                    <th>${finalPayment}</th>
                </tr>
            </table>
        </div>
        <!--TOTAL-->
        <div class="div6">
            <n>TOTAL S/.</n>
        </div>
        <!--DATOSF-->
        <div class="div5">
            <p class="">Imprenta "Icis" E.I.R.L RUC: 20486521483</p>
            <p class="">F.I:20.06.2021 N° de Autorización: 015624</p>
            <p class="">Serie 006 del 1000 al 3000</p>
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/views/admin/js/receitpP.js"></script>
</body>
<footer>
    <div>
        <a class="button" onclick="window.print()">Imprimir</a>
    </div>
</footer>
</html>
