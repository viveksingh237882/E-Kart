package com.ekart.servlets;

import com.ekart.dao.UserDao;
import com.ekart.entities.User;
import com.ekart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Awanish kumar singh
 */

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {

                String name = request.getParameter("userName");
                String email = request.getParameter("userEmail");
                String password = request.getParameter("userPassword");
                String address = request.getParameter("userAddress");
                String phone = request.getParameter("userPhone");
                Part part = request.getPart("userPic");
                String pic = part.getSubmittedFileName();
                
                if(pic.equals("")){
                    pic = "default.jpg";
                }
                
                User user = new User();
                user.setUserName(name);
                user.setUserAddress(address);
                user.setUserEmail(email);
                user.setUserPassword(password);
                user.setUserPic(pic);
                user.setUserphone(phone);
                user.setUsertype("normal");
                
                int id = UserDao.saveUser(user);
                
                HttpSession httpsession =  request.getSession();
                httpsession.setAttribute("message", "Registration successfull..! User Id :" +id);
                
                response.sendRedirect("register.jsp");
                
            } catch (Exception e) {
                e.printStackTrace();
                HttpSession httpsession =  request.getSession();
                httpsession.setAttribute("message", "Sorry ! This email-id is already registered.");                
                response.sendRedirect("register.jsp");
                
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
