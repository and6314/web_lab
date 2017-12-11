var tab; 
var tabContent; 

document.getElementById('tabs').onclick= function (event) {
    var target=event.target;
    if (target.className=='tab') {
       for (var i=0; i<tab.length; i++) {
           if (target == tab[i]) {
               showTabsContent(i);
               break;
           }
       }
    }
}
function getCookie(name) {
                var matches = document.cookie.match(new RegExp(
                  "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
                ));
                return matches ? decodeURIComponent(matches[1]) : undefined;
              }
function hideTabsContent(a) {
    for (var i=a; i<tabContent.length; i++) {
        tabContent[i].classList.remove('show');
        tabContent[i].classList.add("hide");
        tab[i].classList.remove('whiteborder');
    }
}
function showTabsContent(b){
    if (tabContent[b].classList.contains('hide')) {
        hideTabsContent(0);
        tab[b].classList.add('whiteborder');
        tabContent[b].classList.remove('hide');
        tabContent[b].classList.add('show');
    }
} 

function addInCart(id) {
                var count, n_count;
                count=getCookie("count");
                if (count==undefined){
                    document.cookie = "count=" + "0";
                } else {
                    n_count=Number(count);
                    document.cookie = "id" + count+"="+id;
                    n_count+=1;
                    document.cookie = "count=" + String(n_count);
                }
            }
            function getCookie(name) {
                var matches = document.cookie.match(new RegExp(
                  "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
                ));
                return matches ? decodeURIComponent(matches[1]) : undefined;
              }
              
function selectdeftab() {
                var selectedM = document.getElementById("selectdeftab").value;
                document.cookie = "deftab=" + selectedM;
                window.location = "cabinet.jsp";
            }