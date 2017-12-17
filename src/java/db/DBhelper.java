/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.io.Serializable;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Asus-PC
 */
public class DBhelper implements Serializable {
    
    public DBhelper() {
    }
    
    public ArrayList<Orders> getOrders() {
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        ArrayList<Orders> ordersList = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Orders as orders");
            ordersList = (ArrayList<Orders>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {     
        session.close(); 
        }
        return ordersList;
    }
    
    public ArrayList<Purchases> getPurchases() {
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        ArrayList<Purchases> purchasesList = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Purchases as purchases");
            purchasesList = (ArrayList<Purchases>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {     
        session.close(); 
        }
        return purchasesList;
    }
    
    public int addOrder(Orders order){
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = null; 
        Integer resId = null;
        try {     
            tx = session.beginTransaction(); 
            resId = (Integer)session.save(order);
            tx.commit();
        }catch (HibernateException e) {  
            if (tx != null)         
            tx.rollback();     
            e.printStackTrace(); 
        } finally {     
        session.close(); 
        }
        return resId;
    }
    public void addPurchase(Purchases purchases){
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = null; 
        Integer resId = null;
        try {     
            tx = session.beginTransaction();
            session.save(purchases);
            tx.commit();
        } catch (HibernateException e) {  
            if (tx != null)         
            tx.rollback();     
            e.printStackTrace(); 
        } finally {     
        session.close(); 
        }
    }
    public void makeOrder(Orders order,ArrayList<Purchases> purchaseslist){
        Integer order_id=(Integer)addOrder(order); 
        for (Purchases p:purchaseslist){
            p.setOrderId(order_id);
            addPurchase(p);
        }
    }  
    
    public ArrayList<Orders> getOrders_by_user(String username){
        ArrayList<Orders> orders = null;
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Orders as orders where orders.customer='"+username+"'");
            orders = (ArrayList<Orders>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {     
        session.close(); 
        }
        return orders;
    }
    
    public ArrayList<Purchases> getPurchases_by_order_id(int order_id){
        ArrayList<Purchases> purchases = null;
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Purchases as purchases where purchases.orderId="+order_id);
            purchases = (ArrayList<Purchases>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {     
        session.close(); 
        }
        return purchases;
    }
    
    public void addComment(Comments comment){
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = null; 
        Integer resId = null;
        try {     
            tx = session.beginTransaction();
            session.save(comment);
            tx.commit();
        } catch (HibernateException e) {  
            if (tx != null)         
            tx.rollback();     
            e.printStackTrace(); 
        } finally {     
        session.close(); 
        }
    }
    
    public ArrayList<Comments> getComments() {
        Session session = HibernateUtil.getSessionFactory().openSession(); 
        ArrayList<Comments> commentsList = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery ("from Comments as comments");
            commentsList = (ArrayList<Comments>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {     
        session.close(); 
        }
        return commentsList;
    }
}
