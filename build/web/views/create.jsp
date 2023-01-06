<%-- 
    Document   : create
    Created on : Jul 9, 2022, 2:11:28 PM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = en>
    <head>
        <jsp:include page='layouts/head.jsp'></jsp:include>
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/navbarcss.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/assets/backend/footercss.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unpkg.com/js-datepicker/dist/datepicker.min.css"> 

    </head>
    <body class="d-flex flex-column h-100">
                        <jsp:include page='layouts/navbarjsp.jsp'></jsp:include>
        
        <!-- Begin page content -->
        <main class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">Tambah Produk</h1>
                <p class="lead">Silahkan isi produk baru di kolom yang sudah tertera</p>
                <div class="mb-3">
                     <a href="stock" class="btn btn-sm btn-info">back</a>
                 </div>
                <div class="row pt-5">
                    <div class="col-12">
                        <form method="POST" action="create">
                            <div class="mb-3">
                                <label class="form-label">Nama Produk</label>
                                <input type="text" class="form-control" placeholder="Masukkan nama produk..." name="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Stok Produk</label>
                                <input type="number" min="0" class="form-control" placeholder="Masukkan stok..." name="stock" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Harga Produk</label>
                                <input type="number" min="0" class="form-control" placeholder="Masukkan harga..." name="price" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tanggal Expired</label>
                                <div class="input-group date" id="datepicker">
                                    <input type="text" class="form-control" id="date" name="expired" required />
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


        <jsp:include page='layouts/footer.jsp'></jsp:include>
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