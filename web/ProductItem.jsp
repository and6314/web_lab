<%-- 
    Document   : ProductItem
    Created on : 27.11.2017, 12:29:13
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
        <div class="container">
            <div class="row">
                <div class="column400"><a href="ProductPageServlet"><h3><%=  res.getString(request.getParameter("name"))%>  </h3></a><button onclick="addInCart(<%=request.getParameter("id") %>)" type="button" class="btn-add-in-cart"><%= res.getString("addincart") %></button><%=  res.getString(request.getParameter("characteristics"))%> </div>
            <div class="column150"><img src="img/u<%=request.getParameter("id") %>_1.jpg" width="130" height="130" alt=\"\" /></div>
            </div>
        </div>