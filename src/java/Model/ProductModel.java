/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hp
 */
public class ProductModel {
       
    private String name;
    private String stock;
    private String price;
    private String expired;
    private String remaining_stock;

    public void setExpired(String expired) {
        String[] splitted = expired.split("/");
        expired = splitted[2] + "-" + splitted[0] + "-" + splitted[1];
        
        this.expired = expired;
    }

    public String getExpired() {
        return expired;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {
        return price;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getStock() {
        return stock;
    }

    public void setRemaining_stock(String remaining_stock) {
        this.remaining_stock = remaining_stock;
    }

    public String getRemaining_stock() {
        return remaining_stock;
    }



}
