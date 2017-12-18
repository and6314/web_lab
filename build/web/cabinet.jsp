<%-- 
    Document   : cabinet
    Created on : 11.12.2017, 4:09:46
    Author     : Asus-PC
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Product.ProductItem"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Product.ProductList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/js1.js"></script>
        <title>Cabinet</title>
    </head>
    <body>
        <% 
            Locale locale;
            String lang="RU";String s="";
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("lang"))
                        lang = cookie.getValue();
                    if (cookie.getName().equals("deftab"))
                        s = cookie.getValue();
                }
            if (lang.equals("RU")){locale = new Locale("ru","RU");}
            else {if (lang.equals("EN")){locale = Locale.ENGLISH;}
            else {locale = new Locale ("de", "DE");;}}
            ResourceBundle res = ResourceBundle.getBundle("/lang/res", locale);
            HttpSession ss = request.getSession();
            String user = (String)ss.getAttribute("username");
        %>
        <jsp:include page="header.jsp"/>
        <div class ="container">
            <h1><%=user%></h1>
            <form  action="exit" ><button type="submit" class="btn-exit "><%=res.getString("exit")%></button></form> 
            <br>
            <%=res.getString("deftab")%>
        <select id="selectdeftab" onchange="selectdeftab()">
            <option <%if (s.equals("0")){%> <%= "selected" %> <%}%>value="0"><%=res.getString("bsum")%></option>
            <option <%if (s.equals("1")){%> <%= "selected" %> <%}%> value="1"><%=res.getString("drev")%></option>
            <option <%if (s.equals("2")){%> <%= "selected" %> <%}%> value="2"><%=res.getString("respl")%></option>
        </select> 
        <br>
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
        <hr class="hr">
        <br>
        <jsp:include page="commentsPage.jsp"/>   
        </div>
    </body>
</html>
