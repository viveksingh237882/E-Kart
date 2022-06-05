<%-- 
    Document   : navbar
    Created on : Jun 8, 2021, 12:20:32 PM
    Author     : Awanish kumar singh
--%>

<%@page import="com.ekart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ekart.dao.CategoryDao"%>
<%@page import="com.ekart.entities.User"%>
<%

    User user1 = (User) session.getAttribute("currentuser");


%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">Mycart</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categories
                    </a>
                    <%                        List<Category> list = CategoryDao.getAllCategory();
                    %>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <%
                            for (Category c : list) {
                        %>

                        <a class="dropdown-item" href="index.jsp?category=<%=  c.getCategoryId()%>"><%=  c.getCategoryTitle()%></a>

<!--<option value="<%= c.getCategoryId()%>"><%=  c.getCategoryTitle()%></option>-->
                        <%
                            }
                        %>

                    </div>
                </li>

            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"data-toggle="modal" data-target="#cart">
                    <a class="nav-link" href="#!"><i class="fa fa-cart-plus" style="font-size:20px"></i><span style="font-size:20px;margin-left: 8px;" class="cart-items">(0)</span></a>
                </li>
                <%                if (user1 == null) {


                %>


                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register <span class="sr-only">(current)</span></a>
                </li>

            </ul>


            <%            } else {
            %>

            <ul class="navbar-nav ml-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="admin.jsp"><%= user1.getUserName()%> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout <span class="sr-only">(current)</span></a>
                </li>

            </ul>

            <%
                }
            %>



        </div>


    </div>


</nav>