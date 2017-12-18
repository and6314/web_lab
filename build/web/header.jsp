<%-- 
    Document   : header
    Created on : 27.11.2017, 10:42:48
    Author     : Asus-PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.Locale,java.util.ResourceBundle" %>
        <%  
            Locale locale;
            String lang="RU";String u="";String count="";
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("lang"))
                        lang = cookie.getValue();
                    if (cookie.getName().equals("user")) {
                        u = cookie.getValue();
                        HttpSession ss = request.getSession(true);
                        ss.setAttribute("username",u); 
                    }
                    if (cookie.getName().equals("count"))
                        count = cookie.getValue();
                }   
            if (lang.equals("RU")){locale = new Locale("ru","RU");}
            else {if (lang.equals("EN")){locale = Locale.ENGLISH;}
            else {locale = new Locale ("de", "DE");}}
            HttpSession ss = request.getSession();
            ss.setAttribute("lang", lang);
            ResourceBundle res = ResourceBundle.getBundle("/lang/res", locale);  //по умолчанию русский язык
        %>    
        <div class="container">
        <div class="row">
            <div class="column150">
                <%
                
                String user = (String)ss.getAttribute("username");
                if(user == "" || user == null){
                %>
                <form  action="login" ><button  class="btn-def btn-big"><%= res.getString("entrance") %></button></form>
                <%} else {%>
                <form  action="cabinet.jsp" ><button  class="btn-def btn-big"><%= res.getString("cabinet") %> (<%= user%>) </button></form>
                <%}%>
            
            </div>
            <div class="column150"><form  action="ProductListPage.jsp" ><button type="submit" class="btn-def btn-big"><%= res.getString("catalog") %></button></form></div>
            <div class="column150"><form  action="Cart" ><button type="submit" class="btn-def btn-big"><%= res.getString("basket") %></button></form></div>
            <div class="column150">
                <%if(user == "" || user == null){%>
                <form  action="login" ><button type="submit" class="btn-def btn-big"><%= res.getString("history") %></button></form>
                <%} else {%>
                <form  action="history.jsp" ><button type="submit" class="btn-def btn-big"><%= res.getString("history") %></button></form>
                <%}%>
            </div>
            <div class="column150">
                <%
                if((user != "" && user != null)&&(count!="")){
                %>
                <form  action="OrderPage" ><button type="submit" class="btn-def btn-big"><%= res.getString("order") %></button></form>
                
                <%}%>
            </div>
            <div class="column400 r">
                <button onclick="chooseLang('RU')" class="btn-def  t" name="lang"  value="RU">RU</button>
                <button onclick="chooseLang('EN')" class="btn-def  t" name="lang"  value="EN">EN</button>
                <button onclick="chooseLang('DE')" class="btn-def  t" name="lang"  value="DE">DE</button>
            </div>
        </div>
        </div>
<fmt:setLocale value="RU" scope="session" />
<c:set var="lang" value="RU" scope="session" />
<c:if test="${cookie.containsKey('lang')}">
    <c:if test="${cookie.lang.value eq 'EN'}">
        <fmt:setLocale value="EN" scope="session" />
    </c:if>
    <c:if test="${cookie.lang.value eq 'DE'}">
        <fmt:setLocale value="DE" scope="session" />
    </c:if>
    <c:set var="lang" value="${cookie.lang.value}" scope="session" />
</c:if>
<fmt:setBundle basename="/lang/res" scope="session" />
<script>
function chooseLang(lang) {
    document.cookie = "lang=" + lang;
    //window.location = "Cart";
    window.location.reload();
}          
</script>