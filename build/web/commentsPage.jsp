<%-- 
    Document   : commentsPage
    Created on : 17.12.2017, 15:37:51
    Author     : Asus-PC
--%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="Product.ProductItem"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Product.ProductList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <title>Comments</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="currentDateTime" class="column tright">&nbsp;</div>
        <h1>Комментарии</h1>
        <jsp:useBean id="data" class="db.DBhelper" scope="request" />
        <form action="#" method="POST" enctype="multipart/form-data" name="addcom" id="addcom" onSubmit="return false">
            <textarea name="text" rows="4" cols="80" id="comments"></textarea><br>
            <br>
            <input name="button" class="button" type="button" value="Добавить комментарий" onclick="postComment()">
        </form>
        <div id="commentList">
            <c:forEach items="${data.getComments()}" var="item">
                <p>
                    ${item.getCommentdate().toLocaleString()}&nbsp;-&nbsp;${item.getCommenttext()}
                </p>
            </c:forEach>
        </div>
        <script>
            function postComment() {
                var now = new Date();
                var request = new XMLHttpRequest();
                request.onreadystatechange = function() {
                    if ((request.readyState === 4) && (request.status === 200)) {
                        document.getElementById("commentList").innerHTML = 
                            document.getElementById("commentList").innerHTML + 
                            "<p>" + now.toLocaleString() + " - " + 
                            getCommentText() + "</p>";
                        document.getElementById("comments").value = "";
                    }
                };
                var params = 'date=' + encodeURIComponent(now.toISOString()) +
                    '&text=' + encodeURIComponent(getCommentText());
                request.open("POST", "AddComment", true);
                request.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
                request.send(params);
            }
            function getCommentText() {
                var text = document.getElementById("comments").value;
                return text.replace(/</g, "&lt;").replace(/>/g, "&gt;");
            }
            function clock() {
                var d = new Date();
                document.getElementById("currentDateTime").innerHTML = d.toLocaleString();
                setTimeout("clock()", 1000);
            }
            clock();
        </script>
    </body>
</html>
