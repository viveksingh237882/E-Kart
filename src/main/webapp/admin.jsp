<%-- 
    Document   : admin
    Created on : Jun 9, 2021, 3:00:06 PM
    Author     : Awanish kumar singh
--%>

<%@page import="com.ekart.dao.UserDao"%>
<%@page import="com.ekart.dao.ProductDao"%>
<%@page import="com.ekart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ekart.dao.CategoryDao"%>
<%@page import="com.ekart.entities.User"%>
<%

    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in ! Login here to checkout..");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUsertype().equals("normal")) {
            session.setAttribute("message", "you are not an admin ! Login here");
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
        <title><%=  user.getUserName()%></title>
        <%@include file="components/common_js_css.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <%@include  file="message.jsp" %>

        <div class="container mt-5 admin">
            <!--first row is coded here-->
            <div class ="row">

                <!--first card-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">

                            <img src="images/users.png" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <h1><%= UserDao.getAlluser()  %></h1>
                            <h1>Users</h1>
                        </div>
                    </div>
                </div>

                <!--second card-->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">

                            <img src="images/categories.jpg" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <h1><%=  CategoryDao.getAllCategory().size()  %></h1>
                            <h1>Categories</h1>
                        </div>
                    </div>
                </div>

                <!--Third card-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">

                            <img src="images/products.png" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <h1><%=  ProductDao.getAllProduct().size()  %></h1>
                            <h1>Products</h1>
                        </div>
                    </div>
                </div>


            </div>

            <!--second row is coded here-->

            <div class="row mt-3">

                <!--first card-->
                <div class="col-md-6">
                    <div class="card"  data-toggle="modal" data-target="#addProductmodel">
                        <div class="card-body text-center">


                            <img src="images/addProduct.png" class="img-fluid" style="max-height: 70px;border-radius: 50%;"/>
                            <p>Click here to add new Product</p>

                            <h1>Add Product</h1>
                        </div>
                        <div class="card-footer text-center">
                            <p>Total number of  products : <%=  ProductDao.getAllProduct().size()%></p>
                        </div>
                    </div>
                </div>

                <!--second card-->
                <div class="col-md-6 text-center">
                    <div class="card"  data-toggle="modal" data-target="#addcategorytoggle">
                        <div class="card-body">

                            <img src="images/addcategories.jpg" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <p>Click here to add new category</p>
                            <h1>Add Category</h1>

                        </div>

                        <div class="card-footer">
                            <p>Total number of  categories : <%=  CategoryDao.getAllCategory().size()%></p>
                        </div>
                    </div>
                </div>

            </div>


        </div>

        <!--add category modal form goes here-->


        <!-- Modal -->
        <div class="modal fade" id="addcategorytoggle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="container text-center">
                            <img src="images/addcategories.jpg" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <h4>Add Category</h4>

                        </div>
                    </div>
                    <div class="modal-body">

                        <form action="SaveCategory" method="post">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" required class="form-control" id="title" placeholder="Enter Title" name="title">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Description</label>
                                <textarea required rows="5" class="form-control" name="description" placeholder="Enter Description"></textarea>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div></form>


                    </div>
                </div>
            </div>
        </div>


        <!--//add products modal starts here....-->

        <!-- Button trigger modal -->

        <div class="modal fade" id="addProductmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header ">
                        <div class="container text-center">
                            <img src="images/addProduct.png" class="img-fluid" style="max-height: 70px; border-radius: 50%;"/>
                            <h4>Add Product Here</h4>

                        </div>
                    </div>

                    <div class="modal-body">

                        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input name="pname" type="text" class="form-control" placeholder="Enter Product Name">
                            </div>

                            <div class="form-group">
                                <select name="catId" required="true" class="form-control">
                                    <option selected="true" disabled="true">----Select Product Category----</option>

                                    <%                                    List<Category> lists = CategoryDao.getAllCategory();
                                        for (Category c : lists) {


                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>


                                    <%                                        }
                                    %>
                                </select>

                            </div>


                            <div class="form-group">
                                <input name="price" type="number" class="form-control" placeholder="Enter Product Price">
                            </div>

                            <div class="form-group">
                                <input name="quantity" type="number" class="form-control" placeholder="Enter Product Quantity">
                            </div>

                            <div class="form-group">
                                <input name="discount" type="number" class="form-control" placeholder="Enter Discount in percentage">
                            </div>

                            <div class="form-group">
                                <textarea name="description" placeholder="Enter the product description here." class="form-control" rows="5"></textarea>   
                            </div>


                            <div class="form-group">
                                <label for="exampleFormControlFile1">Select the product image.</label>
                                <input type="file" class="form-control-file" name="image" id="exampleFormControlFile1">
                            </div>

                            <div class="modal-footer text-center">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div> 
                        </form>

                    </div>

                </div>
            </div>
        </div>


        <script>
            $(document).ready(function () {
                $('#myModal').on('shown.bs.modal', function () {
                    $('#myInput').trigger('focus')
                })
            })
        </script>

    </body>
</html>
