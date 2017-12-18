<%-- 
    Document   : login
    Created on : 11.12.2017, 0:52:25
    Author     : Asus-PC
--%>

<%@page contentType="text/html" pageEncoding="windows-1251"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/js1.js"></script>
        <script src="./Scripts/login.js"></script>
        <title>JSP Page</title>
    </head>
    <body onload="ck()">
        <div class="container">
        <jsp:include page="header.jsp"/>
        <h4><fmt:message key="successlogin"/></h4>
        </div>
    </body>
</html>
