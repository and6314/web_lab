package db;
// Generated 17.12.2017 7:19:17 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Orders generated by hbm2java
 */
public class Orders  implements java.io.Serializable {


     private Integer id;
     private String customer;
     private String deliveryPoint;
     private Date orderdate;

    public Orders() {
    }

	
    public Orders(Date orderdate) {
        this.orderdate = orderdate;
    }
    public Orders(String customer, String deliveryPoint, Date orderdate) {
       this.customer = customer;
       this.deliveryPoint = deliveryPoint;
       this.orderdate = orderdate;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(String customer) {
        this.customer = customer;
    }
    public String getDeliveryPoint() {
        return this.deliveryPoint;
    }
    
    public void setDeliveryPoint(String deliveryPoint) {
        this.deliveryPoint = deliveryPoint;
    }
    public Date getOrderdate() {
        return this.orderdate;
    }
    
    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }




}


