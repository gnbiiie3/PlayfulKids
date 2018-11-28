<%-- 
    Document   : productPhysical
    Created on : Nov 16, 2018, 3:23:17 AM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playful Kids : รายการสินค้าด้านร่างกาย</title>
    </head>
    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">สินค้าของเล่น
                <small>ด้านร่างกาย</small>
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
            <img class="img-fluid rounded mb-4" src="pic/headerphysical.jpg" alt="">

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6 text-left">
                                    <h4 class="card-title">
                                        <a href="#">Project One</a>
                                    </h4>
                                </div>
                                <div class="col-6 text-right">
                                    <a href="#"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                                </div>
                            </div>
                            <h6>
                                <a href="#">Catalog</a>
                            </h6>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6 text-left">
                                    <h4 class="card-title">
                                        <a href="#">Project One</a>
                                    </h4>
                                </div>
                                <div class="col-6 text-right">
                                    <a href="#"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                                </div>
                            </div>
                            <h6>
                                <a href="#">Catalog</a>
                            </h6>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6 text-left">
                                    <h4 class="card-title">
                                        <a href="#">Project One</a>
                                    </h4>
                                </div>
                                <div class="col-6 text-right">
                                    <a href="#"><button type="button" class="btn btn-success">ซื้อเลย!</button></a>
                                </div>
                            </div>
                            <h6>
                                <a href="#">Catalog</a>
                            </h6>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

        </div>
    </body>
</html>
