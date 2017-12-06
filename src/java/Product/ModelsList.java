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
public class ModelsList implements Serializable {
    private ArrayList<ProductModel> list;
    public ModelsList() {
        list = new ArrayList<>();
    }
    
    public ArrayList<ProductModel> getModelsList() {
        return list;
    }
    
    public void add(ProductModel p) {
        list.add(p);
    }
    
    public ProductModel get_by_id(int id){
        for (ProductModel m:list){
            if (m.getId()==id)
               return m;
        }
        return null;
    }
}
