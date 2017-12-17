<%-- 
    Document   : order
    Created on : 14.12.2017, 8:04:42
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css1.css" rel="stylesheet" type="text/css" />
        <script src="./Scripts/order.js"></script>
        <script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"> 
        </script>
        <script src="https://yandex.st/jquery/2.2.3/jquery.min.js"></script>
        <title>Order</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="header.jsp"/>
            <h2>Заказ на имя ${sessionScope.username}</h2>
            <form action="MakeOrder" method="GET">
                <div class="row">
                    <div class="column400">
                    <fmt:message key="goodsincart"/> : ${sessionScope.count}
                    <br>
                    <fmt:message key="totalprice"/> : ${sessionScope.ProductList.getTotalPrice()}
                    <br>
                    <label>Delivery point : </label>
                    <input type="text"  name="address" style="width: 200px;" id="suggest" class="input" readonly value="Торжковская улица, 8"/>
                    </div>
                    <div class="column300">
                    <button type="submit" class="btn-buy" >Оформить заказ</button><br>
                    </div>
                </div>
            </form>
            <br>
            <div id="map" style="width: 588px; height: 400px"></div>
            <c:forEach var="p" items="${sessionScope.ProductList.getProductItems()}">
                    <div class="row">
                    <div class="column400">
                        <a href="ProductPageServlet"><h3> ${p.getName()} </h3></a> 
                        <fmt:message key="incart"/> : ${p.getNum()} <br>
                        <fmt:message key="totalprice"/> : ${p.getNum()*p.getPrice()}
                        
                        <p> ${p.getCharacteristics()} </p>
                    </div>
                    <div class="column150"> <img src="${p.getImgurl()}" width="130" height="130" alt=\"\" /> </div>
                    </div>    
                </c:forEach>
            
            <script type="text/javascript">
        ymaps.ready(init);
        function init(){  
    var myMap = new ymaps.Map('map', {
            center: [59.941071, 30.329888],
            zoom: 11,
            controls: []
        });
        
    myMap.events.add('click', function(e) {
        var coords = e.get('coords');
        ymaps.geocode(coords).then(function(res) {
            var firstGeoObject = res.geoObjects.get(0), error, hint;
            if (error)
                window.alert(error);
            else {
                document.getElementById('suggest').value = firstGeoObject.getAddressLine();
                hideError();
            }
        });
    })
    
    var myPlacemark = new ymaps.Placemark(
        [59.989239, 30.310484], {
            iconCaption: 'Торжковская улица, 8'
        });
    
    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);

    myPlacemark = new ymaps.Placemark(
        [59.972286, 30.347253], {
            iconCaption: 'Лесной проспект, 32'
        });

    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);

    myPlacemark = new ymaps.Placemark(
        [59.914469, 30.318566], {
            iconCaption: 'Московский проспект, 40'
        });
            
    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);
}

function placemarkClick(e) {
    var item = e.get('target');
    document.getElementById('suggest').value = item.properties.get('iconCaption');
    
    hideError();
}
        
        

        function init1(){ 
            var myMap, 
            myPlacemark;
            myMap = new ymaps.Map("map", {
                center: [59.76, 30.64],
                zoom: 11
            }); 
            
            myPlacemark = new ymaps.Placemark([59.76, 30.64], {
                
                iconCaption: 'Москва!',
                balloonContent: 'Столица России'
            });
            
            myMap.geoObjects.add(myPlacemark);
        }
    </script>
            <!--<script type="text/javascript">
                ymaps.ready(init);
            </script>-->
            <br>
        </div>
    </body>
</html>
