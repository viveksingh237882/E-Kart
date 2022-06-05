<%-- 
    Document   : login
    Created on : Jun 9, 2021, 9:39:26 AM
    Author     : Awanish kumar singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_js_css.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid  primary-background  banner-background">

            <div class="row">

                <div class ="mt-2 col-md-4 offset-md-4">

                    <div class="card mb-5">
                        <div class="card-header text-center">

                            <%@include file="message.jsp" %>

                            <img src="images/login.jpg" style="max-height: 100px; max-width: 100px; border-radius: 50%"/>
                            <h1 class="card-title">Login Here</h1>
                        </div>

                        <div class="card-body">

                            <form action="Loginservlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="useremail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="userpassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>

                                </div>
                                <div class="container-fluid text-center mt-2">
                                    <p>Don't have an account? <a href="register.jsp">Register</a> </p>

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
