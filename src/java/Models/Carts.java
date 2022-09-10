/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import DAL.DAO;
import java.util.ArrayList;
import java.util.List;
import org.apache.coyote.http11.Constants;

/**
 *
 * @author ASUS
 */
public class Carts {

    private List<Items> items;

    public Carts() {
        items = new ArrayList<>();
    }

    public List<Items> getItems() {
        return items;
    }

    // lay so luong trong gio hang
    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    // lay item bang pdtId
    private Items getItemById(int id) {
        for (Items i : items) {
            if (i.getProductDt().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Items t) {
        // san pham da ton tai trong gio
        if (getItemById(t.getProductDt().getId()) != null) {
            Items m = getItemById(t.getProductDt().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public int getTotalMoney() {
        int price = 0;
        for (Items i : items) {
            price += (i.getQuantity() * i.getPrice());
        }
        return price;
    }

    public ProductDetails getProductDetailById(int id, List<ProductDetails> list) {
        for (ProductDetails i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public Carts(String txt, List<ProductDetails> list) {
        DAO dao = new DAO();
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    ProductDetails p = getProductDetailById(id, list);
                    Items t = new  Items(p, quantity, dao.searchProductById(p.getProductId()).getPrice());
                    addItem(t);
                }
            }
        } catch (Exception e) {

        }
    }
}
