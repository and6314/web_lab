<%-- 
    Document   : auth
    Created on : 09.12.2017, 15:38:04
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
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/login.js"></script>
        <title>authorization</title>
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <div class="container">
        <form action="j_security_check" method="post" name="loginForm"> 
            <label><fmt:message key="username"/></label><br> <br> 
            <input type="text" id="n" name="j_username" placeholder="<fmt:message key="username"/>" size="20"/><br> <br> 
            <label><fmt:message key="password"/></label><br> <br> 
            <input type="password"  name="j_password" placeholder="<fmt:message key="password"/>" size="20"/><br> <br> 
            <input type="submit" class="btn-add-in-cart" onclick="enter()" value="<fmt:message key="enter"/>"/> </form>
        </div>    
    </body>   
</html>
