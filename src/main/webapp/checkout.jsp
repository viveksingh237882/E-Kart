<%-- 
    Document   : checkout
    Created on : Jun 15, 2021, 8:08:09 AM
    Author     : Awanish kumar singh
--%>

<%
    User user = (User)session.getAttribute("currentuser");
    
    if(user == null){
        session.setAttribute("message", "Login to checkout");
        response.sendRedirect("login.jsp");
        return;
    }
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout page</title>

        <%@include file="components/common_js_css.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">

            <div class="row">

                <div class="col-md-8">

                    <div class="card">
                        <div class="card-header">
                            <h3 class="text-center">Your selected item</h3>
                        </div>
                        <div class="card-body">
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card">

                        <div class="card-header">
                            <h3 class="text-center">Check the status</h3>
                        </div>

                        <div class="card-body">

                            <form action="OrderServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name='email' type="email" class="form-control" value="<%= user.getUserEmail() %>" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label>Name - </label>
                                    <input name="name" type="text" class="form-control" value="<%= user.getUserName() %>" id="exampleInputPassword1" placeholder="Your name">
                                </div>
                                
                                
                                    <div class='form-group'>
                                        <label>Contact number</label>
                                        <input class='form-control' name="mobile" placeholder="Enter your contact number" value="<%= user.getUserphone()  %>"/>
                                    </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea required rows="5" name="address" placeholder="Enter your address" value= "<%=  user.getUserAddress()  %>" class='form-control'></textarea>
                                    
                                </div>
                                    
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-primary">Order</button>
                                </div>
                                </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <%@include  file="components/commonitems.jsp" %>
    </body>
</html>