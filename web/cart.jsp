<%-- 
    Document   : Cart
    Created on : 03.12.2017, 21:00:03
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
<!DOCTYPE html>

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


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/cartjs.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="page" value="Cart" />
        </jsp:include>
        <div class ="container">
            <br>
            <fmt:message key="goodsincart"/> : ${sessionScope.count}
            <br>
            <fmt:message key="totalprice"/> : ${sessionScope.ProductList.getTotalPrice()}
            <br>
            <c:if test="${empty sessionScope.ProductList.getProductItems()}">
                <p><fmt:message key="empty_cart"/></p>
            </c:if>
            <c:if test="${not empty sessionScope.ProductList.getProductItems()}">
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
            </c:if>
        </div>        
    </body>
</html>
