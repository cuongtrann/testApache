/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateDelete", urlPatterns = {"/updateDelete"})
public class UpdateDelete extends HttpServlet {

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
            out.println("<title>Servlet UpdateDelete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateDelete at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");
        String id = request.getParameter("id");
        if (type != null && type.equals("0")) {
            //delete with id
            request.setAttribute("proDeleteId", id);
        } else if (type != null && type.equals("1")) {
            //update student with id
            request.setAttribute("proUpdateId", id);
        }
        else if (type != null && type.equals("2")) {
            //update student with id
            request.setAttribute("usDeleteId", id);
        }
        else if (type != null && type.equals("3")) {
            //update student with id
            request.setAttribute("usUpdateId", id);
        }else if (type != null && type.equals("4")) {
            //update student with id
            request.setAttribute("proDtUpdateId", id);
        }
        if(type!=null && (type.equals("0") || type.equals("1"))){
            request.getRequestDispatcher("editProduct").forward(request, response);
        }
        if(type!=null && (type.equals("2") || type.equals("3"))){
            request.getRequestDispatcher("editUser").forward(request, response);
        }
        if(type!=null && (type.equals("4"))){
            request.getRequestDispatcher("editProductDetail").forward(request, response);
        }
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
        processRequest(request, response);
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
