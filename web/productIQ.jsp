<%-- 
    Document   : productIQ
    Created on : Nov 16, 2018, 3:22:44 AM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playful Kids : รายการสินค้าด้านสติปัญญา</title>
    </head>
    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">สินค้าของเล่น
                <small>ด้านสติปัญญา</small>
            </h1>

            <ol class="breadcrumb">
                <!-- Example single danger button -->
                <div class="btn-group"style="margin-right: 8px;">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ประเภทสินค้า
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="productIQ.jsp">ด้านสติปัญญา</a>
                        <a class="dropdown-item" href="productPhysical.jsp">ด้านร่างกาย</a>
                        <a class="dropdown-item" href="productEmotional.jsp">ด้านอารมณ์</a>
                        <a class="dropdown-item" href="productSocial.jsp">ด้านสังคม</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="productPage.jsp">ดูทั้งหมด</a>
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

            <!-- Image Header -->
            <img class="img-fluid rounded mb-4" src="http://placehold.it/1200x300" alt="">

            <!-- Marketing Icons Section -->
            <div class="row">
                <c:forEach items="${demo}" var="lineItem" varStatus="vs">
                    <div class="col-lg-4 mb-4" style="margin-bottom: 15px;">
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
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>
    </body>
</html>
