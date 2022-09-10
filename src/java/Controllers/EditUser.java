/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
import Models.Users;
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
public class EditUser extends HttpServlet {

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
            out.println("<title>Servlet EditUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUser at " + request.getContextPath() + "</h1>");
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
    int page;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dao", dao);
        Object obj1 = request.getAttribute("usUpdateId");
        Object obj = request.getAttribute("usDeleteId");
        if (obj != null) {
            int deleteId = Integer.parseInt((obj + "").trim());
            dao.deleteUs(deleteId);
        }
        if(obj1 != null){
            update = true;
        }
        // phan trang
         ArrayList<Users> list = dao.getUsers();
            int numperpage = 6;
            int size = dao.getUsers().size();
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
            ArrayList<Users> list1 = dao.getListUsersByPage(list, start, end);
            request.setAttribute("data", list1);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        request.getRequestDispatcher("Views/Admin/EditUser.jsp").forward(request, response);
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
        int idInsert = dao.getUsers().get(dao.getUsers().size()-1).getId()+ 1;     
        String usName = request.getParameter("usName");
        String loginName = request.getParameter("loginName");
        String password = request.getParameter("pass");
        int roleId = Integer.parseInt(request.getParameter(("role")+"").trim());
        String address = request.getParameter("add");
        String phone = request.getParameter("phone");
        String email = request.getParameter("mail");
        boolean active = Boolean.parseBoolean(request.getParameter("active"));
        if (update) {
            try {
                int usId = Integer.parseInt(request.getParameter("id"));
                dao.updateUs(usId, usName, loginName, password, roleId, address, phone, email, active);
                update = false;
            } catch (Exception e) {
            }
        } else {
            try {
                dao.insertUs(idInsert, usName, loginName, password, roleId, address, phone, email, active);
            } catch (Exception e) {
            }
        }
        response.sendRedirect("./editUser?page="+page);
//                    request.getRequestDispatcher("Views/Admin/EditUser.jsp").forward(request, response);

    }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
