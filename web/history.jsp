<%-- 
    Document   : history
    Created on : 16.12.2017, 3:55:20
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <title>Cabinet</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">   
        <h1><fmt:message key="history"/> ${sessionScope.username}</h1>
        <jsp:useBean id="data" class="db.DBhelper" scope="request" />
        <c:forEach var="order" items="${requestScope.data.getOrders_by_user(sessionScope.username)}">
            <h3>  ${order.getOrderdate()} : <fmt:message key="order"/> ${order.getId()}</h3>
            <c:forEach var="purch" items="${requestScope.data.getPurchases_by_order_id(order.getId())}">
                <p>
                    ${sessionScope.modList.get_by_id(purch.getModelId()).getName()}
                </p>
            </c:forEach>
        </c:forEach> 
        </div>    
</body>
</html>
       