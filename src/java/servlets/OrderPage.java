/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Product.ModelsList;
import Product.ProductItem;
import Product.ProductList;
import Product.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus-PC
 */
public class OrderPage extends HttpServlet {

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
            HttpSession ss = request.getSession();
        ProductList p = (ProductList)ss.getAttribute("ProductList");
        ModelsList m = (ModelsList)ss.getAttribute("modList");
        p = new ProductList();
        Locale locale;
        String lang="RU";String s_count="0";int count=0;
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("lang"))
                    lang = cookie.getValue();
                if (cookie.getName().equals("count"))
                    s_count = cookie.getValue();
            }   
        if (lang.equals("RU")){locale = new Locale("ru","RU");}
        else {if (lang.equals("EN")){locale = Locale.ENGLISH;}
        else {locale = new Locale ("de", "DE");}}
        ResourceBundle res = ResourceBundle.getBundle("/lang/res", locale);
        ss.setAttribute("locale", lang);    
        try {
            count=Integer.parseInt(s_count);} catch(NumberFormatException e) {count=100000;}    
        for (int i=0;i<count;++i)  {
            int id;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("id"+i)){
                    try {
                    id = Integer.parseInt(cookie.getValue());} catch(NumberFormatException e) {id=0;}
                    ProductModel model=m.get_by_id(id);
                    ProductItem item=new ProductItem(model.getId(),model.getPrice(),model.getName(),res.getString(model.getCharacteristics()),model.getManufacturer());
                    p.addProductItem(item);
                    break;
                }
            }
        }  
        ss.setAttribute("ProductList", p);    
        ss.setAttribute("count", count);  
            
            
            getServletContext().getRequestDispatcher("/orderPage.jsp").forward(request,response);
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
