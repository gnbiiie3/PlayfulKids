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
            <h1 class="mt-4 mb-3">${product.productname}</h1>

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
                    <form class="form-inline" action="Search" method="get">
                        <input class="form-control mr-sm-2" type="search" name="search" placeholder="ชื่อ หรือคำค้นหาสินค้า" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">ค้นหา</button>
                    </form>  
                </li>
            </ol>

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8">
                    <img class="img-fluid" src="product/${product.productid}.jpg" alt="">
                </div>

                <div class="col-md-4">
                    <h3 class="my-3">${product.productname}</h3>
                    <p>ประเภท : ${product.productcategory.categoryname}</p>
                    <h3 class="my-3">ราคา ${product.productprice} บาท</h3>
                    <br>
                    <p>${product.productdescription}</p>
                    
                    <ul>
                        <li>ผลิตมาจาก ${product.materialofproduct}</li>
                        <li>เหมาสำหรับเด้กอายุ ${product.productforage} ปี ขึ้นไป</li>
                    </ul>
                    
                    <a href="AddToCart?productid=${product.productid}"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                </div>

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
