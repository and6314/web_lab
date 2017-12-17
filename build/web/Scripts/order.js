/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function chooseLang(lang) {
    document.cookie = "lang=" + lang;
    window.location = "OrderPage";
}
            

/*function init(){  
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
        [59.988253, 30.287816], {
            hintContent: 'Магазин на Школьной'
        });
    
    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);

    myPlacemark = new ymaps.Placemark(
        [59.978705, 30.344636], {
            hintContent: 'Магазин на Лесном'
        });

    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);

    myPlacemark = new ymaps.Placemark(
        [59.929463, 30.323693], {
            hintContent: 'Магазин на Садовой'
        });
            
    myPlacemark.events.add('click', placemarkClick);        
    myMap.geoObjects.add(myPlacemark);
}

function placemarkClick(e) {
    var item = e.get('target');
    document.getElementById('suggest').value = item.properties.get('hintContent');
    
    hideError();
}*/