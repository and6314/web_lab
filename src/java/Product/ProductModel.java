/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

/**
 *
 * @author Asus-PC
 */

import java.io.Serializable;

public class ProductModel implements Serializable{
    private int id;
    private int price;
    private String name;
    private String characteristics;
    private String manufacturer;
    
    public ProductModel() {
    }
    
    public ProductModel(int id, int price, String name, String characteristics, String manufacturer) {
        this.id = id;
        this.price = price;
        this.name = name;
        this.characteristics = characteristics;
        this.manufacturer=manufacturer;
    }
    
    public void setId(int i) { this.id = i;}

    public void setCharacteristics(String i) {this.characteristics = i;}
    
    public void setPrice(int i) {this.price = i;}

    public void setName(String i) {        this.name = i;    }

    public int getId(){        return this.id;    }
    
    public int getPrice(){        return this.price;    }
    
    public String getName(){        return this.name;    }
    
    
    public void setManufacturer(String i) {        this.manufacturer = i;    }

    public String getManufacturer(){        return this.manufacturer;    }
   
    public String getCharacteristics(){        return this.characteristics;    }
}

