/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function ck(){
    var ent=getCookie("ent");
    if(ent != 1 ){
        document.cookie = "ent=" + "1";
        window.location = "login";
    }
}

function enter() {
    var user = document.getElementById("n").value;
    if(user != undefined && user != ""){
        document.cookie = "user=" + user;
        closeform();
    }
} 

function chooseLang(lang) {
    document.cookie = "lang=" + lang;
    window.location = "login";
}

