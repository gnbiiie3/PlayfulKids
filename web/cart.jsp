<!-- <%-- 
    Document   : cart
    Created on : Nov 28, 2018, 9:19:44 PM
    Author     : jenny
--%> -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PlayfulKids : My Cart</title>
</head>

<body style="margin-top: 70px;">
    <%@include file="include/Header.jsp" %>
    <div class="container">
        <div class="row">



            <!-- Post Content Column -->
            <div class="col" style="height: 100vh;">

                <!-- Title -->
                <h1 class="mt-4">My Cart</h1>

                <!-- Author -->
                <p class="lead">
                    รายการสั่งซื้อภายในตะกร้าของคุณ
                </p>
                <hr>

                <div class="row" style="text-align: center; font-weight: bold">
                    <div class="col-2">ภาพตัวอย่าง</div>
                    <div class="col-4">ชื่อสินค้า</div>
                    <div class="col-3">จำนวน</div>
                    <div class="col-2">ราคา/หน่วย</div>
                    <div class="col-1"></div>
                </div>
                <hr>

                <c:forEach items="${cart.lineItems}" var="product" varStatus="i">

                    <div class="row" style="text-align: center;">
                        <div class="col-2"><img class="img-thumbnail" src="product/${product.product.productid}.jpg"
                                alt="" /></div>
                        <div class="col-4">${product.product.productname}<br>${product.product.productdescription}</div>
                        <div class="col-3">
                                <div class="row">
                                    <div class="col-2"><input class="form-control mr-sm-2" type="number" name="receivername"></div>
                                    <div class="col-1"><button type="button" class="btn btn-info">+</button></div>
                                </div>
                        </div>
                        <div class="col-2">${product.product.productprice}</div>
                        <div class="col-1"><a href="RemoveProductFromCart?productid=${product.product.productid}" class="btn btn-danger"
                                role="button">X</a></div>
                    </div>
                    <hr>
                </c:forEach>

                <div class="row" style="text-align: center;">
                    <c:set var="total" value="${0}" />
                    <c:forEach var="article" items="${cart.lineItems}">
                        <c:set var="total" value="${total + article.totalPrice}" />
                    </c:forEach>

                    <div class="col-3"></div>
                    <div class="col-4"></div>
                    <div class="col-5">
                        <div class="row">
                            <div class="col-6">ราคาสุทธิ</div>
                            <div class="col-6">
                                <c:out value="${total}" /> บาท</div>
                        </div>
                        <div class="row" style="margin-top: 25px;">
                            <div class="col-6"></div>
                            <div class="col-6"><button type="button" class="btn btn-success">ชำระเงินค่าสินค้า</button></div>
                        </div>
                    </div>
                </div>
                <hr>
            </div>





        </div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
        </div>
    </footer>
</body>

</html>