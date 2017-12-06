<%-- 
    Document   : header
    Created on : 27.11.2017, 10:42:48
    Author     : Asus-PC
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.Locale,java.util.ResourceBundle" %>
        <%  
            Locale locale;
            String lang="RU";
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("lang"))
                        lang = cookie.getValue();
                }   
            if (lang.equals("RU")){locale = new Locale("ru","RU");}
            else {if (lang.equals("EN")){locale = Locale.ENGLISH;}
            else {locale = new Locale ("de", "DE");}}
            ResourceBundle res = ResourceBundle.getBundle("/lang/res", locale);  //по умолчанию русский язык
        %>    
        <div class="container">
        <div class="row">
            <div class="column150"><button  class="btn-def btn-big"><%= res.getString("entrance") %></button></div>
            <div class="column150"><form  action="ProductListPage.jsp" ><button type="submit" class="btn-def btn-big"><%= res.getString("catalog") %></button></form></div>
            <div class="column150"><form  action="Cart" ><button type="submit" class="btn-def btn-big"><%= res.getString("basket") %></button></form></div>
            <div class="column150"><button  class="btn-def btn-big"><%= res.getString("history") %></button></div>
            <div class="column400 r">
                <button onclick="chooseLang('RU')" class="btn-def  t" name="lang"  value="RU">RU</button>
                <button onclick="chooseLang('EN')" class="btn-def  t" name="lang"  value="EN">EN</button>
                <button onclick="chooseLang('DE')" class="btn-def  t" name="lang"  value="DE">DE</button>
            </div>
        </div>
        </div>
        
