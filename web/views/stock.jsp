<%-- 
    Document   : Index
    Created on : Jul 8, 2022, 10:05:01 AM
    Author     : hp
--%>

<%@page import="Controller.ProductController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Homepage" />
        </jsp:include>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/navbarcss.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/footercss.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body class="d-flex flex-column h-100">
                <jsp:include page='layouts/navbarjsp.jsp'></jsp:include>
        
        <%
            ProductController pc = new ProductController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = pc.get();
            } else {
                rs = pc.getByName(search);
            }
        %>

        <!-- Begin page content -->
        <main class="flex-shrink-0">
        <div class="container">
                <h1 class="mt-5">Hello <%= request.getSession(true).getAttribute("name") %>, Selamat Bekerja</h1>
                <p class="lead">Anda login sebagai username: <strong><%= request.getSession().getAttribute("username") %></strong></p>
                    <a href="logout" class="btn btn-sm btn-info">LOGOUT</a>
                <div class="row pt-5">
                    <div class="col-6">
                        <form action="stock" method="GET">
                            <div class="mb-3">
                                <label class="form-label">Search</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="search" value="<%= search%>" />
                                    <span class="input-group-append">
                                        <button class="input-group-text bg-light d-block">
                                            <i class='bx bxs-search'></i>
                                        </button>
                                    </span>
                                </div>
                                    <br>
                                <div class="mb-3">
                                    <a href="create" class="btn btn-sm btn-info">TAMBAH PRODUK</a>
                                    <a href="history" class="btn btn-sm btn-info">HISTORY TRANSACTION</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-12">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID Product</th>
                                    <th>Nama Barang</th>
                                    <th>Stok</th>
                                    <th>Price / KG</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (rs.next()) {%>
                                <tr>
                                    <td><%= rs.getString("id_product")%></td>
                                    <td><%= rs.getString("name")%></td>
                                    <td><%= rs.getString("stock")%> KG</td>
                                    <td>Rp. <%= rs.getString("price") %></td>
                                    <td>
                                        <form action="delete?id=<%= rs.getString("id_product") %>" method="POST"
                                              onsubmit="return confirm('Are you sure want to delete the data?')"
                                        >
                                            <a href="edit?id=<%= rs.getString("id_product") %>" class="btn btn-sm btn-info">EDIT</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id_product")%>" />
                                            <a href="transaction?id=<%= rs.getString("id_product") %>" class="btn btn-sm btn-info">BUY</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id_product")%>" />
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                        
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <jsp:include page='layouts/footer.jsp'></jsp:include>
    </body>
</html>