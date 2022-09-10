/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.ProductDetails;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class EditProduct extends HttpServlet {

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
            out.println("<title>Servlet EditProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProduct at " + request.getContextPath() + "</h1>");
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

    public void init() {
        dao = new DAO();
    }
    boolean update = false;
    int proId;
    int page;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dao", dao);
        Object obj = request.getAttribute("proDeleteId");
        Object obj1 = request.getAttribute("proUpdateId");
        // delete product
        if (obj != null) {
            int proDeleteId = Integer.parseInt((obj + "").trim());
            dao.deletePro(proDeleteId);
            // delete them ca product detail cua no
            for (ProductDetails searchProductDetail : dao.searchProductDetails(proDeleteId)) {
                dao.deleteProDetail(searchProductDetail.getId());
            }
        }
        // update product
        if (obj1 != null) {
            update = true;
            proId = Integer.parseInt((obj1+"").trim());
        }
        
        // phan trang
        ArrayList<Products> list = dao.getProduct();
            int numperpage = 6;
            int size = dao.getProduct().size();
            int num = (size%numperpage==0?size/numperpage:size/numperpage+1);
            String xpage = request.getParameter("page");
            if(xpage == null){
                page = 1;
            }else{
                page = Integer.parseInt(xpage);
            }
            int start,end;
            start = (page-1)*numperpage;
            end = Math.min(page*numperpage, size);
            ArrayList<Products> list1 = dao.getListByPage(list, start, end);
            request.setAttribute("data", list1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        request.getRequestDispatcher("Views/Admin/EditProduct.jsp").forward(request, response);
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
//        request.setAttribute("dao", dao);
        // Product
        int idInsert = dao.getProduct().get(dao.getProduct().size()-1).getId()+ 1;
        String proName = request.getParameter("proName").trim();
        int price = Integer.parseInt(request.getParameter("price").trim());
        String brand = request.getParameter("brand").trim();
        String type = request.getParameter("type").trim();
        int cost = Integer.parseInt(request.getParameter("cost").trim());
        String image = request.getParameter("image").trim();
        int size = 39;
        // update product
        if (update) {
            try {
                dao.updatePro(proId, proName, price, brand, type, cost, image);
                update = false;
            } catch (Exception e) {
            }
        } else { //insert
            try {
                dao.insertPro(idInsert, proName, price, brand, type, cost, image);
                // khin insert them 1 product, tu dong insert them product detail
                for(int i =0;i<7;i++){
                    dao.insertProductDetail(dao.getProductDetails().get(dao.getProductDetails().size()-1).getId()+1,
                            idInsert, size++, 0, null);
                }
            } catch (Exception e) {

            }
        }
        
        response.sendRedirect("./editProduct?page="+page);
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
