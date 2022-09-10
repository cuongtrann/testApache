/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.*;
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
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
            String search = request.getParameter("search");
            String color = request.getParameter("color");
            String price = request.getParameter("price");
            String price1,price2;
            String type = request.getParameter("type");
            if(price==null || price.equals("")){
                price1 = "0";
                price2 = "999999999";
            }else{
                String s[] = price.split("-");
                price1 = s[0];
                price2 = s[1];
            }
            if(search == null){
                search = "";
            }
            if(color == null){
                color = "";
            }
            if(type==null){
                type = "";
            }
            
            ArrayList<Products> list = dao.searchProductInHome(search, color, price1, price2,type);
            int page, numperpage = 6;
            int size = list.size();
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
            request.setAttribute("search", search);
            request.setAttribute("color", color);
            request.setAttribute("price", price);
            request.setAttribute("type", type);
            request.getRequestDispatcher("Views/Home.jsp").forward(request, response);
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
