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
    private ArrayList<ProductModel> list;
    public ProductList() {
        list = new ArrayList<>();
    }
    
    public ArrayList<ProductModel> getProductList() {
        return list;
    }
    
    public void add(ProductModel p) {
        list.add(p);
    }
    
    
    
}
