package com.ekart.servlets;

import com.ekart.dao.UserDao;
import com.ekart.entities.User;
import com.ekart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Awanish kumar singh
 */
public class Loginservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession https = request.getSession();

            try {

                String email = request.getParameter("useremail");
                String pass = request.getParameter("userpassword");

                SessionFactory factory = FactoryProvider.getFactory();

                User user = UserDao.getUser(email, pass);

                if (user == null) {

                    https.setAttribute("message", "Invalid credentials.");
                    response.sendRedirect("login.jsp");
                } else {
                    https.setAttribute("currentuser", user);

                    if (user.getUsertype().equals("normal")) {
                        response.sendRedirect("index.jsp");
                    } else if (user.getUsertype().equals("admin")) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        https.setAttribute("message", "user type cannot be retrieved");
                        response.sendRedirect("login.jsp");
                    }

                }
            } catch (Exception e) {

                https.setAttribute("message", "sorry ! something went wrong..");
                response.sendRedirect("login.jsp");
                e.printStackTrace();
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
