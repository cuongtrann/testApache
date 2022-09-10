/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.*;

/**
 *
 * @author ASUS
 */
public class DAO {

    private ArrayList<Users> userList;
    private ArrayList<Products> productList;
    Connection con;
    public String status;

    public ArrayList<Products> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<Products> productList) {
        this.productList = productList;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<Users> getUserList() {
        return userList;
    }

    public void setUserList(ArrayList<Users> userList) {
        this.userList = userList;
    }
//    Các hàm load dữ liệu

    public ArrayList<Users> getUsers() {
        ArrayList<Users> us = new ArrayList<Users>();
        String sql = "select * from Users_HE160289";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
                         rs.getString(7), rs.getString(8), rs.getBoolean(9)));
            }
        } catch (Exception e) {
            status = "Error at read Users" + e.getMessage();
        }
        return us;
    }

    public ArrayList<Products> getProduct() {
        ArrayList<Products> pro = new ArrayList<Products>();
        String sql = "select * from Products_HE160289";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            status = "Error at read Products" + e.getMessage();
        }
        return pro;
    }

    public ArrayList<ProductDetails> getProductDetails() {
        ArrayList<ProductDetails> prodt = new ArrayList<ProductDetails>();
        String sql = "select * from ProductDetails_HE160289";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prodt.add(new ProductDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
            status = "Error at read ProductDetails" + e.getMessage();
        }
        return prodt;
    }
    
    
    public ArrayList<Orders> getOrders() {
        ArrayList<Orders> ord = new ArrayList<Orders>();
        String sql = "select * from Order_HE160289";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ord.add(new Orders(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            status = "Error at read Order" + e.getMessage();
        }
        return ord;
    }
    
    public ArrayList<OrderDetails> getOrderDetails() {
        ArrayList<OrderDetails> ordDt = new ArrayList<OrderDetails>();
        String sql = "select * from OrderLine_HE160289";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ordDt.add(new OrderDetails(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            status = "Error at read Order Details" + e.getMessage();
        }
        return ordDt;
    }
    
    

    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

//    public DAO(String u,String p) {
//        try {
//            con = new DBContext(u,p).getConnection();
//        } catch (Exception e) {
//            status = "Error connection" + e.getMessage();
//        }
//    }
    public void insertPro(int id, String name, int price, String brand, String type, int cost, String image) {
        String sql = "insert into Products_HE160289 values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, price);
            ps.setString(4, brand);
            ps.setString(5, type);
            ps.setInt(6, cost);
            ps.setString(7, image);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Product" + e.getMessage();
        }
    }
    
    public void insertUs(int id, String name, String loginName, String password, int roleId, String address, String phone, String email, boolean active) {
        String sql = "insert into Users_HE160289 values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, loginName);
            ps.setString(4, password);
            ps.setInt(5, roleId);
            ps.setString(6, address);
            ps.setString(7, phone);
            ps.setString(8, email);
            ps.setBoolean(9, active);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Product" + e.getMessage();
        }
    }

    public void insertProductDetail(int id, int productId, int size, int quantity, String description) {
        String sql = "insert into ProductDetails_HE160289 values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.setInt(4, quantity);
            ps.setString(5, description);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Product Detail" + e.getMessage();
        }
    }
    
    public void insertOrder(Users c, Carts cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // add vao bang order trc
            String sql = "insert into Order_HE160289 values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, date);
            ps.setInt(2, c.getId());
            ps.setInt(3, cart.getTotalMoney());
            ps.executeUpdate();
            // lay cai id cua order vua add
            String sql1 = "select top 1 id from Order_HE160289 order by id desc";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            // add orderdetail 
            if(rs.next()){
                int oid = rs.getInt("id");
                for(Items i:cart.getItems()){
                    String sql2 = "insert into OrderLine_HE160289 values(?,?,?,?)";
                    PreparedStatement ps2 = con.prepareStatement(sql2);
                    ps2.setInt(1, oid);
                    ps2.setInt(2, i.getProductDt().getId());
                    ps2.setInt(3, i.getQuantity());
                    ps2.setInt(4, i.getPrice());
                    ps2.executeUpdate();
                }
            }
            // cap nhat lai so luong san pham
            String sql3 = "update ProductDetails_HE160289 set quantity=quantity-? where productDetailId = ?";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            for(Items i:cart.getItems()){
                ps3.setInt(1, i.getQuantity());
                ps3.setInt(2, i.getProductDt().getId());
                ps3.executeUpdate();
            }
//            String sql = "insert into "
        } catch (Exception e) {
                
        }
        
        
    }
    public void deletePro(int id) {
        String sql = "delete from Products_HE160289 where productId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete Product" + e.getMessage();
        }
    }

    public void deleteUs(int id) {
        String sql = "delete from Users_HE160289 where userId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete User" + e.getMessage();
        }
    }

    public void deleteProDetail(int id) {
        String sql = "delete from ProductDetails_HE160289 where productDetailId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at delete Product Detail" + e.getMessage();
        }
    }

    public void updateUs(int id, String name, String loginName, String password, int roleId, String address, String phone, String email, boolean active) {
        String sql = "Update Users_HE160289 set userId=?, userName=?, loginName=?,password=?,roleId=?,address=?,phone=?,email=?,active=? where userId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, loginName);
            ps.setString(4, password);
            ps.setInt(5, roleId);
            ps.setString(6, address);
            ps.setString(7, phone);
            ps.setString(8, email);
            ps.setBoolean(9, active);
            ps.setInt(10, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update Student" + e.getMessage();
        }
    }

    public void updatePro(int id, String name, int price, String brand, String type, int cost, String image) {
        String sql = "Update Products_HE160289 set productId=?, productName=?, price=?,brand=?,type=?,cost=?,image=? where productId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, price);
            ps.setString(4, brand);
            ps.setString(5, type);
            ps.setInt(6, cost);
            ps.setString(7, image);
            ps.setInt(8, id);

            ps.execute();
        } catch (Exception e) {
            status = "Error at update Student" + e.getMessage();
        }
    }

    public void updateProDetail(int id, int productId, int size, int quantity, String description) {
        String sql = "Update ProductDetails_HE160289 set productDetailId=?, productId=?, size=?, quantity=?, description=? where productDetailId=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, productId);
            ps.setInt(3, size);
            ps.setInt(4, quantity);
            ps.setString(5, description);
            ps.setInt(6, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update updateProDetail" + e.getMessage();
        }
    }

    // search
    public Users seachUserById(int id) {
        DAO dao = new DAO();
        for (Users user : dao.getUsers()) {
            if (user.getId() == id) {
                return user;
            }
        }
        return null;
    }

    public ArrayList<Products> searchProductInHome(String brand, String color, String price1 , String price2,String type) {
        ArrayList<Products> pro = new ArrayList<Products>();
        String sql = "select * from Products_HE160289 where productName like ? and productName like ? and ?<price and price<? and type like ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"%"+brand+"%");
            ps.setString(2,"%"+color+"%");
            ps.setString(3,price1);
            ps.setString(4,price2);
            ps.setString(5,"%"+type+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            status = "Error at read Products" + e.getMessage();
        }
        return pro;
    }

    public Products searchProductById(int id) {
        DAO dao = new DAO();
        for (Products pro : dao.getProduct()) {
            if (pro.getId() == id) {
                return pro;
            }
        }
        return null;
    }

    public ArrayList<Products> searchProductByPrice(String price1, String price2) {
        ArrayList<Products> pro = new ArrayList<Products>();
        int p1 = Integer.parseInt(price1);
        int p2 = Integer.parseInt(price2);
        DAO dao = new DAO();
        for (Products products : dao.getProduct()) {
            if (products.getPrice() >= p1 && products.getPrice() <= p2) {
                pro.add(products);
            }
        }
        return pro;
    }
    
    public ArrayList<OrderDetails> searchOrderDetailByOrderId(int orderId){
        ArrayList<OrderDetails> ordDt = new ArrayList<>();
        DAO dao = new DAO();
        for (OrderDetails orderDetails : dao.getOrderDetails()) {
            if(orderDetails.getOid()==orderId){
                ordDt.add(orderDetails);
            }
        }
        return ordDt;
    }
    public ArrayList<Products> getListByPage(ArrayList<Products> list, int start, int end) {
        ArrayList<Products> arr = new ArrayList<Products>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<Users> getListUsersByPage(ArrayList<Users> list, int start, int end) {
        ArrayList<Users> arr = new ArrayList<Users>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<ProductDetails> searchProductDetails(int productId) {
        DAO dao = new DAO();
        ArrayList<ProductDetails> prodtList = new ArrayList<ProductDetails>();
        for (ProductDetails prodt : dao.getProductDetails()) {
            if (prodt.getProductId() == productId) {
                prodtList.add(prodt);
            }
        }
        return prodtList;
    }

    public ProductDetails searchProductDetailById(int id) {
        DAO dao = new DAO();

        for (ProductDetails prodt : dao.getProductDetails()) {
            if (prodt.getId() == id) {
                return prodt;
            }
        }
        return null;
    }

    

    // check login
    public Users checkUser(String u, String p) {
        DAO dao = new DAO();
        for (Users us : dao.getUsers()) {
            if (us.getLoginName().equals(u) && us.getPassword().equals(p)) {
                return us;
            }
        }
        return null;
    }
    // phaan trang

    public static void main(String[] args) {
        DAO dao = new DAO();
//        dao.insertPro(5, "cuong", 100, "adidas", "human", 10, "abc");
////        dao.deletePro(5);
//        dao.insertUs(4, "Tran Nam", "Nam", "nam123", 1, "Ha Noi", "31214", "nam@gmai.com",false);
//        dao.updateUs(4, "Tran Nam", "Nam", "nam123", 1, "Ha Noi", "31214", "nam@gmai.com",true);
//        dao.updatePro(5, "xinchao", 0, "NIKe", "FG", 0, "2510");
//        dao.updateUs(1, "Tran Ngoc Cuong", "cuongg", "1234", 0, "Ha Noi", "0973245766", "cuongtn2510@gmail.com", true);

//           for (Products pro : dao.searchProductByPrice("0", "1000000")) {
//               System.out.println(pro);
//        }
//           for (ProductDetails productDetail : dao.getProductDetails()) {
//               System.out.println(productDetail);
//        }
//           for (Object searchProductDetail : dao.searchProductDetails(1)) {
//               System.out.println(searchProductDetail);
//        }
//           for (ProductDetails productDetail : dao.getProductDetails()) {
//            
//        }
//        for (Products products : dao.searchProduct("NIKE Mercurial")) {
//            System.out.println(products.getName());
//        }
        for (Products products : dao.searchProductInHome("nike","","0","9999999999","mg")) {
            System.out.println(products);
        }
//         for (Users us : dao.getUsers()) {
//            System.out.println(us);
//        }
//    }
    }
}
