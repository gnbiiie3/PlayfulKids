<%-- 
    Document   : productPage
    Created on : Nov 16, 2018, 1:20:21 AM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playful Kids : รายการสินค้า</title>
    </head>
    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">สินค้าทั้งหมด
            </h1>

            <ol class="breadcrumb">
                <!-- Example single danger button -->
                <div class="btn-group"style="margin-right: 8px;">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ประเภทสินค้า
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="ProductList?category=1">ด้านสติปัญญา</a>
                        <a class="dropdown-item" href="ProductList?category=2">ด้านร่างกาย</a>
                        <a class="dropdown-item" href="ProductList?category=3">ด้านอารมณ์</a>
                        <a class="dropdown-item" href="ProductList?category=4">ด้านสังคม</a>
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

            <div class="row">
                <c:forEach items="${product}" var="product" varStatus="i">
                    <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
                        <div class="card h-100">
                            <a href="ProductDetail?productid=${product.productid}"><img class="card-img-top" src="product/${product.productid}.jpg" alt="${product.productname}"></a>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6 text-left">
                                        <h4 class="card-title">
                                            <a href="ProductDetail?productid=${product.productid}">${product.productname}</a>
                                        </h4>
                                    </div>
                                    <div class="col-6 text-right">
                                        <a href="AddToCart?productid=${product.productid}"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                                    </div>
                                </div>
                                    <small>
                                        <a href="${demo}">${catalog}</a>
                                    </small>
                                    <h6>
                                        ${product.productprice} บาท
                                    </h6>
                                
                                <p class="card-text">${product.productdescription}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                
                </div>
            </div>

            <!-- Pagination -->
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>

        </div>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>
    </body>
</html>
