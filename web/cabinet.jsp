<%-- 
    Document   : cabinet
    Created on : 11.12.2017, 4:09:46
    Author     : Asus-PC
--%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
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
            <%=res.getString("deftab")%>
        <select id="selectdeftab" onchange="selectdeftab()">
            <option <%if (s.equals("0")){%> <%= "selected" %> <%}%>value="0"><%=res.getString("bsum")%></option>
            <option <%if (s.equals("1")){%> <%= "selected" %> <%}%> value="1"><%=res.getString("drev")%></option>
            <option <%if (s.equals("2")){%> <%= "selected" %> <%}%> value="2"><%=res.getString("respl")%></option>
        </select> 
        <form  action="exit" ><button type="submit" class="btn-def btn-big">Exit</button></form>   
        </div>
    </body>
</html>
