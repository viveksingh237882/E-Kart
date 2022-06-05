<%-- 
    Document   : register
    Created on : Jun 8, 2021, 2:58:04 PM
    Author     : Awanish kumar singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <%@include  file="components/common_js_css.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid primary-background banner-background">

            <div class="row text-center">



                <div class="col-md-4 card mt-2 offset-md-4">
                    
                    <%@include file="message.jsp" %>

                    <div class ="container-fluid text-center">
                        <img src="images/register.png" class="img" style="max-width: 50%;max-height: 500%"/>

                    </div>
                    <p>Get started with free account </p>

                    <a class="btn btn-danger disabled btn-block" href="#!"><i class="fab fa-google"></i>&nbsp;&nbsp;
                        Login with Google </a>

                    <table><tr>
                            <td style="width:47%"><hr/></td>
                            <td style="vertical-align:middle; text-align: center">OR</td>
                            <td style="width:47%"><hr/></td>
                        </tr></table>


                    <!-- form started here  -->

                    <form action="RegisterServlet" method="post" enctype="multipart/form-data">

                        <!-- name field  -->

                        <div class="form-group input-group">

                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fa fa-user"></i></div>
                                </div>
                                <input required name="userName" type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter Name">
                            </div>
                        </div>

                        <!-- email field  -->

                        <div class="form-group input-group">

                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fa fa-envelope"></i></div>
                                </div>
                                <input required name="userEmail" type="email" class="form-control" id="inlineFormInputGroup"
                                       placeholder="Enter Email">
                            </div>
                        </div>

                        <!-- phone field  -->

                        <div class="form-group input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id=""><i class="fa fa-phone"></i></span>
                            </div>

                            <select class="custom-select" style="max-width: 80px;">
                                <option>+91</option>
                                <option>+93</option>
                                <option>+96</option>
                                <option>+71</option>
                                <option>+11</option>
                                <option>+21</option>
                                <option>+97</option>
                            </select>

                            <input required type="number" name="userPhone" class="form-control">

                        </div>

                        <!-- password fields  -->


                        <div class="form-group input-group">

                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fa fa-lock"></i></div>
                                </div>
                                <input required name="userPassword" type="text" class="form-control" id="inlineFormInputGroup"
                                       placeholder="Enter Password">
                            </div>
                        </div>

                        <div class="form-group input-group">

                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text"><i class="fa fa-building"></i></div>
                                </div>
                                <textarea required rows="3" name="userAddress" type="text" class="form-control" id="inlineFormInputGroup"
                                          placeholder="Enter Address"></textarea>
                            </div>
                        </div>

                        <div class="form-group input-group">

                            <div class="input-group mb-2">

                                <input name="userPic"  type="file" />

                            </div>
                        </div>

                        <button type="submit" class="btn btn-success btn-block">Create</button>

                        <p class = "text-center mt-2">Already have account ? <a href="login.jsp">Log In</a></p>


                    </form>

                    <!-- form ended here -->
                </div>
            </div>
        </div>
    </div>

</body>
</html>
