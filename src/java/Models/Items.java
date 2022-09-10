/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ASUS
 */
public class Items {
    private ProductDetails productDt;
    private int quantity;
    private int price;

    public Items() {
    }

    public Items(ProductDetails productDt, int quantity, int price) {
        this.productDt = productDt;
        this.quantity = quantity;
        this.price = price;
    }

    public ProductDetails getProductDt() {
        return productDt;
    }

    public void setProductDt(ProductDetails productDt) {
        this.productDt = productDt;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
