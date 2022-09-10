/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Carts;
import Models.Items;
import Models.ProductDetails;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ProcessCart", urlPatterns = {"/process"})
public class ProcessCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProcessCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAO dao;
    public void init(){
        dao = new DAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         List<ProductDetails> list = dao.getProductDetails();
         Cookie[] arr = request.getCookies();
        String txt = "";   
         if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
         Carts cart = new Carts(txt,list);
         String num_raw = request.getParameter("num");
         String id_raw = request.getParameter("id");
        int id,num;
        try {
            id = Integer.parseInt(id_raw);
            ProductDetails p = dao.searchProductDetailById(id);
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);
            if(num==-1 && (cart.getQuantityById(id)<=1)){
                cart.removeItem(id);
            }else{
                if(num==1 && (cart.getQuantityById(id)>=numStore)){
                    num = 0;
                }
                int price = dao.searchProductById(p.getProductId()).getPrice();
                Items t = new Items(p, num, price);
                cart.addItem(t);
            }
        } catch (Exception e) {
        }
        List<Items> items = cart.getItems();
        txt = "";
        if(items.size()>0){
            txt = items.get(0).getProductDt().getId()+":"+items.get(0).getQuantity();
            for(int i = 1;i<items.size();i++){
                txt+="/"+items.get(i).getProductDt().getId()+":"+items.get(i).getQuantity();
            }
        }
        Cookie c= new Cookie("cart", txt);
        c.setMaxAge(60*60*24*2);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("Views/Cart.jsp").forward(request, response);
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         List<ProductDetails> list = dao.getProductDetails();
         Cookie[] arr = request.getCookies();
        String txt = "";   
         if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
         String id = request.getParameter("id");
         String [] ids = txt.split("/");
         String out = "";
         for(int i =0; i < ids.length;i++){
             String [] s = ids[i].split(":");
             if(!s[0].equals(id)){
                 if(out.isEmpty()){
                     out = ids[i];
                 }else{
                     out += "/" +ids[i]; 
                 }
             }
         }
         if(!out.isEmpty()){
             Cookie c = new Cookie("cart", out);
             c.setMaxAge(2*24*60*60);
             response.addCookie(c);
         }
         Carts cart = new Carts(out,list);
         request.setAttribute("cart", cart);
         request.getRequestDispatcher("Views/Cart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
