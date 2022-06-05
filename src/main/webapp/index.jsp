<%-- 
    Document   : index
    Created on : Jun 7, 2021, 4:21:57 PM
    Author     : Awanish kumar singh
--%>


<%@page import="com.ekart.entities.Product"%>
<%@page import="com.ekart.dao.ProductDao"%>
<%@page import="com.ekart.helper.FactoryProvider"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%@include file="components/common_js_css.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="row mt-3 container-fluid">

            <div class="col-md-2">

                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All products
                    </a>

                    <%                        List<Category> categories = CategoryDao.getAllCategory();
                        for (Category c : categories) {
                    %>


                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action ">
                        <%= c.getCategoryTitle()%>
                    </a>


                    <%
                        }
                    %>


                </div>

            </div>

            <div class="col-md-10 container-fluid">

                <div class="card-columns">
                    <%
                        String category = request.getParameter("category");

                        List<Product> p = null;                                

                        if (category == null || category.trim().equals("all")) {
                            p = ProductDao.getAllProduct();
                        } else {
                            int cid = Integer.parseInt(category);
                            p = ProductDao.getAllProductById(cid);
                        }

                        for (Product p1 : p) {
                            String s = p1.getpDescription().substring(0, Math.min(p1.getpDescription().length(), 75));
                            String s1 = p1.getPname().substring(0, Math.min(p1.getPname().length(), 35));
                            int discount = p1.getpPrice() - ((p1.getpPrice() * p1.getpDiscount()) / 100);
                    %>
                    <div class="card">
                        <img class="card-img-top" style="max-height: 270px; max-width: 100%;"  src="product_image/<%= p1.getpPhoto()%>" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= s1%></h5>
                            <p class="card-text"><%= s%>&nbsp;<h4 style="color:blue"><%= p1.getpDiscount()%>% Off</h4></p>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-success" onclick="add_to_cart( <%= p1.getpId() %>  ,  '<%= p1.getPname() %>'   ,  <%= p1.getpPrice() %>  ,  <%= p1.getpQuantity()%>  )">Add to cart</button>
                            <button class="btn btn-danger disabled"><strike>&#8377;<%=  p1.getpPrice()%></strike></button>
                            <button class="btn btn-outline-primary">&#8377;<%= discount%></button>
                        </div>
                    </div>
                    <%
                        }
                        if (p.size() == 0) {
                            out.println("No Items found for this..");
                        }
                    %>
                </div>

            </div>

        </div>

                    <%@include  file="components/commonitems.jsp" %>

    </body>
</html>
