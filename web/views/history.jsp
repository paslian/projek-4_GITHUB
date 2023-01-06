<%-- 
    Document   : Index
    Created on : Jul 8, 2022, 10:05:01 AM
    Author     : hp
--%>

<%@page import="Controller.TransactionController"%>
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
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    </head>
    <body class="d-flex flex-column h-100">
                        <jsp:include page='layouts/navbarjsp.jsp'></jsp:include>

        <%
            TransactionController tc = new TransactionController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = tc.get();
            } else {
                rs = tc.getByName(search);
            }
        %>

        <!-- Begin page content -->
        <main class="flex-shrink-0">
<div class="container">
                <h1 class="mt-5">HISTORY TRANSACTION</h1>
                <div class="row pt-5">
                    <div class="col-6">
                        <form action="history" method="GET">
                            <div class="mb-3">
                                <label class="form-label">Search Customer</label>
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
                                     <a href="stock" class="btn btn-sm btn-info">back</a>
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
                                    <th>Id. Transaction</th>
                                    <th>Customer_Name</th>
                                    <th>Id. Product</th>
                                    <th>Name Product</th>
                                    <th>Remaining_Item</th>
                                    <th>Price</th>
                                    <th>Total_Order</th>
                                    <th>Total_Amount</th>
                                    <th>Transaction_Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while (rs.next()) {%>
                                <tr>
                                    <td><%= rs.getString("id_transaction")%></td>
                                    <td><%= rs.getString("customer_name")%></td>
                                    <td><%= rs.getString("id_product")%></td>
                                    <td><%= rs.getString("name")%></td>
                                    <td><%= rs.getString("remaining_item")%> KG</td>
                                    <td>Rp. <%= rs.getString("price")%></td>
                                    <td><%= rs.getString("total_order")%> KG</td>
                                    <td>Rp. <%= rs.getString("total_amount")%></td>
                                    <td><%= rs.getString("transaction_date")%></td>
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