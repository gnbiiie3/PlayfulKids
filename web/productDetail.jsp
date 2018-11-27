<%-- 
    Document   : productDetail
    Created on : Nov 16, 2018, 9:21:01 AM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>สินค้า : </title>
    </head>
    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">Portfolio Item
                <small>Subheading</small>
            </h1>

            <ol class="breadcrumb">
                <!-- Example single danger button -->
                <div class="btn-group"style="margin-right: 8px;">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ประเภทสินค้า
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="ProductList?category=1">ด้านสติปัญญา</a>
                        <a class="dropdown-item" href="ProductList?category=1">ด้านร่างกาย</a>
                        <a class="dropdown-item" href="ProductList?category=1">ด้านอารมณ์</a>
                        <a class="dropdown-item" href="ProductList?category=1">ด้านสังคม</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="ProductList">ดูทั้งหมด</a>
                    </div>
                </div>
                <button type="button" class="btn btn-primary">ตัวเลือกการค้นหา</button>
                <li class="ml-auto">
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="ชื่อ หรือคำค้นหาสินค้า" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">ค้นหา</button>
                    </form>  
                </li>
            </ol>

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8">
                    <img class="img-fluid" src="http://placehold.it/750x500" alt="">
                </div>

                <div class="col-md-4">
                    <h3 class="my-3">${demo}</h3>
                    <p>${demo}</p>
                    <h3 class="my-3">${demo}</h3>
                    <ul>
                        <li>Lorem Ipsum</li>
                        <li>Dolor Sit Amet</li>
                        <li>Consectetur</li>
                        <li>Adipiscing Elit</li>
                    </ul>
                </div>

            </div>
            <!-- /.row -->

            <!-- Related Projects Row -->
            <h3 class="my-4">สินค้าที่ใกล้เคียงกัน</h3>

            <div class="row">
                <!--ให้ดึงมาแค่ 4-->
                <c:forEach items="${demo}" var="lineItem" varStatus="vs">
                    <div class="col-md-3 col-sm-6 mb-4" style="margin-bottom: 15px;">
                        <div class="card h-100">
                            <a href="${demo}"><img class="card-img-top" src="product/${demo}" alt="${demo}"></a>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6 text-left">
                                        <h4 class="card-title">
                                            <a href="${demo}">${demo}</a>
                                        </h4>
                                    </div>
                                    <div class="col-6 text-right">
                                        <a href="${demo}"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                                    </div>
                                </div>
                                <h6>
                                    <a href="${demo}">Catalog</a>
                                </h6>
                                <p class="card-text">${demo}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>

    </body>
</html>
