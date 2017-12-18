/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Product.ProductItem;
import Product.ProductList;
import db.DBhelper;
import db.Orders;
import db.Purchases;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
public class MakeOrder extends HttpServlet {

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
            String v=request.getParameter("address");
            String name=(String)ss.getAttribute("username");
            Date d=new Date();
            ProductList productlist = (ProductList)ss.getAttribute("ProductList");
            ArrayList<ProductItem> products=productlist.getProductItems();
            ArrayList<Purchases> purchases = new ArrayList<Purchases>();
            for (ProductItem product:products){
                for (int i=0;i<product.getNum();++i){
                    Purchases purchase = new Purchases((Integer)0,(Integer)product.getPrice(),(Integer)product.getModel());
                    purchases.add(purchase);
                }
            }
            Orders order = new Orders(name,v,d);
            DBhelper db = new DBhelper();
            db.makeOrder(order, purchases);
            ss.setAttribute("ProductList", new ProductList());
            int count = (Integer)ss.getAttribute("count");
            ss.setAttribute("count", 0);  
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies){
                    if (cookie.getName().equals("count")){
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                    if (cookie.getName().contains("id")){
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }     
            //out.println(v+"<br>"+name+"<br>"+d+"<br>succes");
            //out.println("<a href=\"ProductListPage.jsp\">qwe</a>");
            getServletContext().getRequestDispatcher("/ProductListPage.jsp").forward(request,response);     
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
