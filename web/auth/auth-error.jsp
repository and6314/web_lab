<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Product.ProductItem"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Product.ProductList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/login.js"></script>
        <title>authorization</title>
    </head>
    <body>
    <script>
    error();
    </script>
    <div class="container">
        <b><fmt:message key="autherror"/></b>
        <form  action="login" ><button  class="btn-def btn-big"><fmt:message key="entrance"/></button></form>
    </div>
</body>
</html>
