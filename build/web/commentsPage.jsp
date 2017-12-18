<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div id="currentDateTime" class="column tright"><br></div>
        <h2><fmt:message key="addcomment"/></h2>
        <jsp:useBean id="data" class="db.DBhelper" scope="request" />
        <form action="#" method="POST" enctype="multipart/form-data" name="addcom" id="addcom" onSubmit="return false">
            <textarea name="text" rows="4" cols="80" id="comments"></textarea><br>
            <br>
            <input name="button" class="btn-def" type="button" value="<fmt:message key="addcomment"/>" onclick="postComment()">
        </form>
        <h2><fmt:message key="comments"/></h2>
        <div id="commentList">
            <c:forEach items="${data.getComments()}" var="item">
                <p>
                    ${item.getCommentdate().toLocaleString()} : ${item.getAuthor()} - ${item.getCommenttext()}
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
