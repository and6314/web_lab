/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import java.util.ArrayList;
import java.io.Serializable;
/**
 *
 * @author Asus-PC
 */
public class ProductList implements Serializable {
    private ArrayList<ProductItem> ProductItems;
    private int totalPrice;
    
    public ProductList() {
        ProductItems = new ArrayList<>();
        totalPrice=0;
    }
    

    public void addProductItem(ProductItem p ){
        boolean b=true;
        for (ProductItem i:ProductItems){
            if (p.getModel()==i.getModel()){
                int n=i.getNum();
                n+=1;
                i.setNum(n);
                b=false;
                break;
            }          
        }
        if (b){
            this.ProductItems.add(p);    
        }
        this.totalPrice+=p.getPrice();
    }
    
    public int getTotalPrice(){ /*return Integer.toString(this.totalPrice);*/ return this.totalPrice;}
    public ArrayList<ProductItem> getProductItems(){ return this.ProductItems; }
    

}
