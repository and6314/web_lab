<%-- 
    Document   : header
    Created on : 27.11.2017, 10:42:48
    Author     : Asus-PC
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.Locale,java.util.ResourceBundle" %>
        <%  
            Locale loc;
            String lang = request.getParameter("lang");
            if (lang == null)
                lang = "RU";
            if (lang.equals("RU")){loc = new Locale("ru","RU");}
            else {if (lang.equals("EN")){loc = Locale.ENGLISH;}
            else {loc = new Locale ("de", "DE");;}}
            ResourceBundle res = ResourceBundle.getBundle("/lang/res", loc);   //по умолчанию русский язык
        %>    
        <div class="container"><button onclick="chooseLang('DE')" class="btn-def r" name="lang"  value="DE">DE</button>
        <button onclick="chooseLang('EN')" class="btn-def r" name="lang"  value="EN">EN</button>
        <button onclick="chooseLang('RU')" class="btn-def r" name="lang"  value="RU">RU</button>
        <button  class="btn-def btn-big"><%= res.getString("entrance") %></button>
        <button  class="btn-def btn-big"><%= res.getString("basket") %></button>
        <button  class="btn-def btn-big"><%= res.getString("history") %></button>
        </div>
                
