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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/navbarcss.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/footercss.css" />
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

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
                        <form method="POST" action="edit">
                            <input type="hidden" name="id" value="<%= rs.getString("id_product")%>" />
                            <div class="mb-3">
                                <label class="form-label">ID Produk</label>
                                <input type="text" class="form-control" 
                                       name="id" required readonly
                                       value="<%= rs.getString("id_product")%>"
                                       >
                            </div>
                            <div
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" 
                                       placeholder="Masukkan nama produk..." name="name" required 
                                       value="<%= rs.getString("name")%>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Stock</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan stock..." name="stock" required 
                                       value="<%= rs.getString("stock") %>"
                                       >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Price</label>
                                <input type="number" min="0" class="form-control" 
                                       placeholder="Masukkan harga..." name="price" required 
                                       value="<%= rs.getString("price") %>"
                                       >
                            </div>
                            <div class="mb-3">
                            <label class="form-label">Tanggal Expired</label>
                            <div class="input-group date" id="datepicker">
                                <input type="text" class="form-control" id="date" name="expired" required
                                       value="<%= StringHelper.modifyDateIntoDatepicker(rs.getString("expired")) %>"
                                />
                                <span class="input-group-append">
                                    <span class="input-group-text bg-light d-block">
                                        <i class='bx bxs-calendar'></i>
                                    </span>
                                </span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary btn-small btn-rounded">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <% } %>

        <jsp:include page='layouts/footer.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <jsp:include page='layouts/scripts.jsp'></jsp:include>
        <script src="https://unpkg.com/js-datepicker"></script> 
        <script>
            const picker = datepicker('#date', {
                formatter: (input, date, instance) => {
                    input.value = date.toLocaleDateString(); // => '1/1/2099'
                }
            })
        </script>

    </body>
</html>