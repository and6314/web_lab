<%-- 
    Document   : order
    Created on : 14.12.2017, 8:04:42
    Author     : Asus-PC
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Product.ProductItem"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Product.ProductList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>

<c:if test="${empty sessionScope.locale}">
    <fmt:setLocale value="RU"/>
</c:if>

<c:if test="${sessionScope.locale eq 'RU'}">
    <fmt:setLocale value="RU"/>
</c:if>

<c:if test="${sessionScope.locale eq 'EN'}">
    <fmt:setLocale value="EN"/>
</c:if>

<c:if test="${sessionScope.locale eq 'DE'}">
    <fmt:setLocale value="DE"/>
</c:if>
<fmt:setBundle basename="/lang/res"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/order.js"></script>
        <title>Order</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <h2>Заказ на имя ${sessionScope.username}</h2>
            <fmt:message key="goodsincart"/> : ${sessionScope.count}
            <br>
            <fmt:message key="totalprice"/> : ${sessionScope.ProductList.getTotalPrice()}
            <br>
            <form action="MakeOrder" method="GET">
                <label>Delivery point</label>
                <select name="shopvar" >
                    <option value="1" selected>магаз1</option>
                    <option value="2">магаз2</option>
                    <option value="3">магаз3</option>
                    <option value="4">магаз4</option>
                </select> 
                <br> <br>
                <button type="submit" class="btn-buy" >Оформить заказ</button><br>
            </form>
            <c:forEach var="p" items="${sessionScope.ProductList.getProductItems()}">
                    <div class="row">
                    <div class="column400">
                        <a href="ProductPageServlet"><h3> ${p.getName()} </h3></a> 
                        <fmt:message key="incart"/> : ${p.getNum()} <br>
                        <fmt:message key="totalprice"/> : ${p.getNum()*p.getPrice()}
                        
                        <p> ${p.getCharacteristics()} </p>
                    </div>
                    <div class="column150"> <img src="${p.getImgurl()}" width="130" height="130" alt=\"\" /> </div>
                    </div>    
                </c:forEach>
            <br>
        </div>
    </body>
</html>
