/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;
import java.io.Serializable;
/**
 *
 * @author Asus-PC
 */
public class ProductItem implements Serializable {
    private int num;
    private int model;
    private int price;
    private String name;
    private String characteristics;
    private String manufacturer;
    private String imgurl;
    
    public ProductItem() {
    }
    
    /*public ProductItem(int id, int price, String name, String characteristics, String manufacturer) {
        this.id = id;
        this.price = price;
        this.name = name;
        this.characteristics = characteristics;
        this.manufacturer=manufacturer;
    }*/
    
    public ProductItem(int model,int price,String name,String characteristics, String manufacturer) {
        this.num = 1;
        this.model = model;
        this.price = price;
        this.name = name;
        this.characteristics = characteristics;
        this.manufacturer=manufacturer;
        this.imgurl="img/u"+model+"_1.jpg";
    }
    
    public ProductItem(ProductModel x) {
        this.num = 1;
        this.model = x.getId();
        this.price = x.getPrice();
        this.name = x.getName();
        this.characteristics = x.getCharacteristics();
        this.manufacturer=x.getManufacturer();
        this.imgurl="img/u"+x.getId()+"_1.jpg";
    }
    
    
    public void setNum(int i) { this.num = i;}
    
    public int getNum() { return this.num;}
    
    public void setModel(int i) { this.model = i;}

    public void setCharacteristics(String i) {this.characteristics = i;}
    
    public void setPrice(int i) {this.price = i;}

    public void setName(String i) {        this.name = i;    }

    public int getModel(){        return this.model;    }
    
    public int getPrice(){        return this.price;    }
    
    public String getName(){        return this.name;    }
    
    public void setImgurl(String i){     this.imgurl=i;       }
    
    public String getImgurl(){        return this.imgurl;    }
    
    public void setManufacturer(String i) {        this.manufacturer = i;    }

    public String getManufacturer(){        return this.manufacturer;    }
   
    public String getCharacteristics(){        return this.characteristics;    }
}
