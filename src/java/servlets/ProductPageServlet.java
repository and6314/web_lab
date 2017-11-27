/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus-PC
 */
@WebServlet(name = "ProductPageServlet", urlPatterns = {"/ProductPageServlet"})
public class ProductPageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String s=getInitParameter("act");
            Locale loc2 = new Locale("ru","RU");
            ResourceBundle resRu = ResourceBundle.getBundle("lang.res",loc2);
            ResourceBundle res1 = resRu;    //по умолчанию русский язык
            if (request.getParameter("lang")!=null)
            {
                if ("EN".equals(request.getParameter("lang"))) {
                    Locale loc1 = Locale.ENGLISH;
                    ResourceBundle resEn = ResourceBundle.getBundle("lang.res",loc1);
                    res1 = resEn;
                } else {
                    if ("DE".equals(request.getParameter("lang"))) {
                        Locale loc3=Locale.GERMAN;
                        ResourceBundle resDe = ResourceBundle.getBundle("lang.res",loc3);
                        res1 = resDe;
                    }
                }
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductPageServlet</title>"); 
            out.println("<link href=\"css1.css\" rel=\"stylesheet\" type=\"text/css\" />");
            out.println("<script src=\"Scripts/js1.js\"></script>");
            out.println("</head>");//<script src="путь_к_файлу_скрипта/script.js"></script>
            out.println("<body>");
            out.println("<div class=\"container\">");
            out.println("<div class=\"row\">");
            out.println("<div class=\"column400\"><h1>Bosch TDA 703021T</h1></div>"); 
            out.println("<div class=\"column400 r\"><form action=ProductPageServlet method=\"get\"><div> <input type='submit' class=\"btn-def r\" name=\"lang\"  value=\"DE\">\n" +
"  <input type='submit' class=\"btn-def r\" name=\"lang\"  value=\"EN\">\n" +
"  <input type='submit' class=\"btn-def r\" name=\"lang\"  value=\"RU\"></div></form></div>");
            out.println("</div>");
            out.println("<br>");
            out.println("<button type=\"button\" class=\"btn-buy\">"+res1.getString("buy")+"</button><br><br>");
            out.println("<img src=\"u1.jpg\" width=\"100\" height=\"100\" alt=\"\"  tabindex=\"0\"/>");
            out.println("<img src=\"u2.jpg\" width=\"100\" height=\"100\" alt=\"\"  tabindex=\"0\"/>");
            out.println("<img src=\"u3.jpg\" width=\"100\" height=\"100\" alt=\"\"  tabindex=\"0\"/>");
            out.println("<img src=\"u4.jpg\" width=\"100\" height=\"100\" alt=\"\"  tabindex=\"0\"/>");
            out.println("<br>");
            out.println("<br>");
            out.println("<br>");           
            out.println("<div id=\"tabs\">\n" +
"        <div class=\"tab whiteborder\">"+res1.getString("bsum")+"</div>\n" +
"        <div class=\"tab\">"+res1.getString("drev")+"</div>\n" +
"        <div class=\"tab\">"+res1.getString("respl")+"</div>\n");
            out.println("<div class=\"tabContent\">\n");
            out.println("<p><img align=\"right\" src=\"u1.jpg\"  width=\"400\" height=\"400\"></p>");
            out.println("<h2>Bosch TDA 703021T</h2>");
            out.println("<h4>"+res1.getString("ch")+"</h4>");
            out.println(res1.getString("pw"));
            out.println("</div><div class=\"tabContent\">\n");
            out.println("<p><img align=\"right\" src=\"u1.jpg\"  width=\"200\" height=\"200\"></p>");
            out.println("<h2>Bosch TDA 703021T</h2>");
            out.println(res1.getString("about"));
            out.println("</div><div class=\"tabContent\">\n");
            out.println("<h2>Bosch TDA 703021T</h2>");
            out.println(res1.getString("resp"));
            out.println("</div></div>");
            out.println("<script>var tab; // заголовок вкладки\n" +
"var tabContent; // блок содержащий контент вкладки\n" +
"\n" +
"\n" +
"window.onload=function() {\n" +
"    tabContent=document.getElementsByClassName('tabContent');\n" +
"    tab=document.getElementsByClassName('tab');\n" +
"    hideTabsContent("+s+");showTabsContent("+s+")\n" +
"}\n" +
"\n" +
"document.getElementById('tabs').onclick= function (event) {\n" +
"    var target=event.target;\n" +
"    if (target.className=='tab') {\n" +
"       for (var i=0; i<tab.length; i++) {\n" +
"           if (target == tab[i]) {\n" +
"               showTabsContent(i);\n" +
"               break;\n" +
"           }\n" +
"       }\n" +
"    }\n" +
"}\n" +
"\n" +
"function hideTabsContent(a) {\n" +
"    for (var i=a; i<tabContent.length; i++) {\n" +
"        tabContent[i].classList.remove('show');\n" +
"        tabContent[i].classList.add(\"hide\");\n" +
"        tab[i].classList.remove('whiteborder');\n" +
"    }\n" +
"}\n" +
"\n" +
"function showTabsContent(b){\n" +
"    if (tabContent[b].classList.contains('hide')) {\n" +
"        hideTabsContent(0);\n" +
"        tab[b].classList.add('whiteborder');\n" +
"        tabContent[b].classList.remove('hide');\n" +
"        tabContent[b].classList.add('show');\n" +
"    }\n" +
"} </script>");
            out.println("</div></body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
