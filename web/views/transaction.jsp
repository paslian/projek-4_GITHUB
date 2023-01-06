<%-- 
    Document   : edit
    Created on : Jul 10, 2022, 1:32:21 PM
    Author     : hp
--%>

<%@page import="Helper.StringHelper"%>
<%@page import="Controller.ProductController"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page='layouts/head.jsp'></jsp:include>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/navbarcss.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/footercss.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
    </head>
    <body class="d-flex flex-column h-100">
                        <jsp:include page='layouts/navbarjsp.jsp'></jsp:include>

        <%
            String id = request.getParameter("id");
            if (id == null || id.equals("")) {
                response.sendRedirect("stock");
            }

            ProductController pc = new ProductController();
            ResultSet rs = pc.getById(id);
            
            System.out.println(rs);
            
            if (!rs.isBeforeFirst()) {
                response.sendRedirect("stock");
            }
            
            int totalamaount = 0;
            int order = 0;
            int price = 0;
            
            if (request.getMethod() == "POST") {
                 price = Integer.parseInt(request.getParameter("price"));
                 order = Integer.parseInt(request.getParameter("order"));
            
                    if (request.getParameter("amount") !=null){
                        totalamaount = price * order;
                    }
                }


        %>

        <% while(rs.next()) { %>
        <!-- Begin page content -->
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Barang yang terpilih : <%= rs.getString("name") %></h1>
                                <br>
                                <div class="mb-3">
                                     <a href="stock" class="btn btn-sm btn-info">back</a>
                                 </div>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="transaction" onsubmit="return confirm('Are you sure ?')">
                            <input type="hidden" name="id" value="<%= rs.getString("id_product")%>" />
                            <div class="mb-3">
                                <label class="form-label">ID Produk</label>
                                <input type="text" class="form-control" 
                                       name="id" required disabled
                                       value="<%= rs.getString("id_product")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nama Customer</label>
                                <input type="text" class="form-control" 
                                       placeholder="Masukkan nama customer..." name="customer" required
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" 
                                       placeholder="Masukkan nama produk..." name="name" required disabled
                                       value="<%= rs.getString("name")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Stock</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan stock..." name="stock" required readonly
                                       value="<%= rs.getString("stock") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="number" min="0" class="form-control" id="price"
                                       placeholder="Masukkan harga..." name="price" required readonly
                                       value="<%= rs.getString("price") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Total Order</label>
                                <input type="number" min="1" class="form-control" id="order"
                                       placeholder="Masukkan total order..." name="order" required max="<%= rs.getString("stock") %>"
                                       value=<%=order%>
                                       >
                            </div>
                            <div class="mb-3">
                                <a onclick="amount()" class="btn btn-primary btn-small btn-rounded" >TotalAmount</a>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Total Amount</label>
                                <input type="number" class="form-control" id="amount"  min="<%=totalamaount%>"
                                       placeholder="Total Amount..." name="amount" required readonly
                                       value=<%=totalamaount%>
                                       >
                            </div>
                            <div class="mb-3">
                                <button type="submit" value="cekPrice" name="cekprice" class="btn btn-primary btn-small btn-rounded" >CONFIRM</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </main>
        <% } %>

        <script>
            var totalamount = document.getElementById("amount");
            var order = document.getElementById("order");
            var price = document.getElementById("price");
            
            function amount(){
                if (Number(order.value) > 0) {
                    totalamount.value = Number(order.value) * Number(price.value);
            }
            else {
	        alert("total order tidak boleh 0 atau minus");
                totalamount.value = 0;
                order.value = 0;
            }


            }
            
           
        </script>

        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>

    </body>
</html>