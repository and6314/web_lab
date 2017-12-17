<%-- 
    Document   : ProductListPage
    Created on : 27.11.2017, 10:23:56
    Author     : Asus-PC
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="Product.ProductList"%>
<%@page import="Product.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="windows-1251"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/js1.js"></script>
        <title>ProductListPage</title>
    </head>
    <body>
        <jsp:useBean id="modList" class="Product.ModelsList" scope="session" />
        <% 
            Locale locale;
            String lang="RU";
            String m="any";int c;
            String cs="100000";
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("lang"))
                        lang = cookie.getValue();
                    if (cookie.getName().equals("Manufacturer"))
                        m = cookie.getValue();
                    if (cookie.getName().equals("rcost"))
                        cs = cookie.getValue();
                }
            try {
            c=Integer.parseInt(cs);} catch(NumberFormatException e) {c=100000;}
            if (lang.equals("RU")){locale = new Locale("ru","RU");}
            else {if (lang.equals("EN")){locale = Locale.ENGLISH;}
            else {locale = new Locale ("de", "DE");;}}
            ResourceBundle res = ResourceBundle.getBundle("/lang/res", locale);
            if (modList.getModelsList().isEmpty()){
            modList.add(new ProductModel(0,160,"Bosch TDA 703021T","characteristics0","Bosch"));
            modList.add(new ProductModel(1,40,"Philips GC1436","characteristics1","Philips"));
            modList.add(new ProductModel(2,60,"Braun 4661E-TS705A","characteristics2","Braun"));
            }
        %>
        <jsp:include page="header.jsp">
            <jsp:param name="lang" value="<%=lang%>" />
        </jsp:include>
        <div class ="container">
        <%=res.getString("manufacturer")%>
        <select id="selectManufacturer" onchange="chooseManufacturer()">
            <option <%if (m.equals("any")){%> <%= "selected" %> <%}%>value="any"><%=res.getString("any")%></option>
                <option <%if (m.equals("Philips")){%> <%= "selected" %> <%}%> value="Philips">Philips</option>
                <option <%if (m.equals("Bosch")){%> <%= "selected" %> <%}%> value="Bosch">Bosch</option>
                <option <%if (m.equals("Braun")){%> <%= "selected" %> <%}%> value="Braun">Braun</option>
        </select> 
        <br><br>
        <%=res.getString("cost")%>
        <input id="rcost" type="text" onchange="chooseCost()" value="<%=c%>" >
        <br><br>
        <% for(Product.ProductModel p : modList.getModelsList()){ %>
        <% if((m.equals(p.getManufacturer()))||(m.equals("any"))) {%>
        <% if (p.getPrice()<c) { %>
        <jsp:include page="ProductItem.jsp">
                <jsp:param name="id" value="<%=p.getId()%>" />
                <jsp:param name="price" value="<%=p.getPrice()%>" />
                <jsp:param name="name" value="<%=p.getName()%>" />
                <jsp:param name="characteristics" value="<%=p.getCharacteristics()%>" />
                <jsp:param name="lang" value="<%=lang%>" />
            </jsp:include>
        <% }}} %>
        </div>
        <script>
            function chooseLang(lang) {
                document.cookie = "lang=" + lang;
                window.location = "ProductListPage.jsp";
            }
            function chooseManufacturer() {
                var selectedM = document.getElementById("selectManufacturer").value;
                document.cookie = "Manufacturer=" + selectedM;
                window.location = "ProductListPage.jsp";
            }
            function chooseCost() {
                var selectedM = document.getElementById("rcost").value;
                document.cookie = "rcost=" + selectedM;
                window.location = "ProductListPage.jsp";
            }
            function addInCart(id) {
                var count, n_count;
                count=getCookie("count");
                if (count==undefined ){
                    count="0";
                    n_count=0;
                    document.cookie = "id" + count+"="+id;
                    n_count+=1;
                    document.cookie = "count=" + String(n_count);
                    window.location = "ProductListPage.jsp";
                } else {
                    n_count=Number(count);
                    document.cookie = "id" + count+"="+id;
                    n_count+=1;
                    document.cookie = "count=" + String(n_count);
                }
            }
            
        </script>   
    </body>
</html>
