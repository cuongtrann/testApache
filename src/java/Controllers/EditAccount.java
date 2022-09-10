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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class EditAccount extends HttpServlet {

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
            out.println("<title>Servlet EditAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAccount at " + request.getContextPath() + "</h1>");
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
    String view;
    String status;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        view = request.getParameter("view");
        request.setAttribute("view", view);
        request.getRequestDispatcher("./Views/EditAccount.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String crPass = request.getParameter("crPass");
        String newPass = request.getParameter("newPass");
        String cfPass = request.getParameter("cfPass");

        HttpSession session = request.getSession();
        Users us = (Users) session.getAttribute("user");
        if (view.equals("edit")) {
            dao.updateUs(us.getId(), name, us.getLoginName(), us.getPassword(), us.getRoleId(), address, phone, email, us.isActive());
            session.setAttribute("user", dao.seachUserById(us.getId()));
            status = "Edit information success";            
        }

        if (view.equals("changePass")) {
            if (us.getPassword().equals(crPass) && newPass.equals(cfPass)) {
                dao.updateUs(us.getId(), us.getName(), us.getLoginName(), newPass, us.getRoleId(), us.getAddress(), us.getPhone(), us.getEmail(), us.isActive());
                session.setAttribute("user", dao.seachUserById(us.getId()));
                status = "Change password success";     
            } else {
                status = "Change password failed";   
            }
        }
        request.setAttribute("status", status);
        status = null;
        request.getRequestDispatcher("./Views/EditAccount.jsp").forward(request, response);
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
