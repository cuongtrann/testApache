/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class EditProductDetail extends HttpServlet {

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
            out.println("<title>Servlet EditProductDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductDetail at " + request.getContextPath() + "</h1>");
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
    int proDtId;
    int proDtUpdateId;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dao", dao);
        Object obj = request.getParameter("proDtId");
        Object obj1 =request.getAttribute("proDtUpdateId");
        if(obj!=null){
           proDtId = Integer.parseInt((obj+"").trim());
           request.setAttribute("proDtId", proDtId);
        }
        if(obj1!=null){
            proDtUpdateId = Integer.parseInt((obj1 + "").trim());
        }
        request.getRequestDispatcher("Views/Admin/EditProductDetail.jsp").forward(request, response);
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
        
        int id = proDtUpdateId;
        int productId = proDtId;
        int size = Integer.parseInt(request.getParameter("size").trim());
        int quantity = Integer.parseInt(request.getParameter("quantity").trim());
        String description = request.getParameter("description");
        dao.updateProDetail(id, productId, size, quantity, description);
        for (ProductDetails proDt : dao.searchProductDetails(proDtId)) {
            dao.updateProDetail(proDt.getId(), proDt.getProductId(), proDt.getSize(), proDt.getQuantity(), description);
        }
        response.sendRedirect("./editProductDetail?proDtId="+proDtId);
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
