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
                <small>(ใหม่)</small>
            </h1>

            <ol class="breadcrumb">
                <!-- Example single danger button -->
                <div class="btn-group"style="margin-right: 8px;">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ประเภทสินค้า
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="productIQ.jsp">ด้านสติปัญญา</a>
                        <a class="dropdown-item" href="productPhisical.jsp">ด้านร่างกาย</a>
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

            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item " style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item" style="margin-bottom: 15px;">
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
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius adipisci dicta dignissimos neque animi ea, veritatis, provident hic consequatur ut esse! Commodi ea consequatur accusantium, beatae qui deserunt tenetur ipsa.</p>
                        </div>
                    </div>
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
    </body>
</html>
