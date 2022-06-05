/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ekart.servlets;

import com.ekart.dao.CategoryDao;
import com.ekart.dao.ProductDao;
import com.ekart.entities.Category;
import com.ekart.entities.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Awanish kumar singh
 */
@MultipartConfig
public class AddProductServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            try {

                String name = request.getParameter("pname");
                int catId = Integer.parseInt(request.getParameter("catId"));
                int price = Integer.parseInt(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int discount = Integer.parseInt(request.getParameter("discount"));
                String description = request.getParameter("description");
                Part part = request.getPart("image");
                String pic = part.getSubmittedFileName();
                
                Category category = CategoryDao.getCategorybyId(catId);

                Product product = new Product(name, description, pic, price, discount, quantity, category);
                
                ProductDao.saveProduct(product);
                
                //sending image to the img/products folder....
                
                String path = request.getRealPath("/") + "product_image" + File.separator  + part.getSubmittedFileName();
                System.out.println(path);
                FileOutputStream fos = new FileOutputStream(path);
                
                InputStream is = part.getInputStream();
                byte[] b = new byte[is.available()];
                is.read(b);
                fos.write(b);
                fos.close();
                
                HttpSession http = request.getSession();
                http.setAttribute("message", "product saved successfully.");
                response.sendRedirect("admin.jsp");
                  
            } catch (Exception e) {
                e.printStackTrace();

                HttpSession http = request.getSession();
                http.setAttribute("message", "product not saved due to some reasons..");
                response.sendRedirect("admin.jsp");
                
            }

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
        processRequest(request, response);
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
