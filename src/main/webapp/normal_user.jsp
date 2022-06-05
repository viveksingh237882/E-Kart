<%-- 
    Document   : normal_user
    Created on : Jun 9, 2021, 3:00:34 PM
    Author     : Awanish kumar singh
--%>

<%@page import="com.ekart.entities.User"%>
<%

    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in ! Login here");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if(user.getUsertype().equals("admin")) {
                session.setAttribute("message", "You are an admin and you are not allowed to see this");
                response.sendRedirect("login.jsp");
                return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello normal</h1>
    </body>
</html>
