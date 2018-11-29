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
                <div class="col-lg-8" style="height: 100vh;">

                    <!-- Title -->
                    <h1 class="mt-4">My Cart</h1>

                    <!-- Author -->
                    <p class="lead">
                        รายการสั่งซื้อภายในตะกร้าของคุณ
                    </p>
                    <hr>

                    <div class="row" style="text-align: center; font-weight: bold">
                        <div class="col-3">ภาพตัวอย่าง</div>
                        <div class="col-4">ชื่อสินค้า</div>
                        <div class="col-2">จำนวน</div>
                        <div class="col-2">ราคา/หน่วย</div>
                        <div class="col-1"></div>
                    </div>
                    <hr>

                    <c:forEach items="${cart.lineItems}" var="product" varStatus="i">
                        
                              <div class="row" style="text-align: center;">
                                <div class="col-3">{}</div>
                                <div class="col-4">${product.product.productname}</div>
                                <div class="col-2">1</div>
                                <div class="col-2">${product.product.productprice}</div>
                                <div class="col-1"><a href="RemoveProductFromCart?productid=${product.product.productid}" class="btn btn-danger" role="button">X</a></div>
                            </div>
                            <hr>
                        </c:forEach>

                        <div class="row" style="text-align: center;">
                            <c:set var="total" value="${0}"/>
                            <c:forEach var="article" items="${cart.lineItems}">
                                <c:set var="total" value="${total + article.totalPrice}" />
                            </c:forEach>

                            <div class="col-3"></div>
                            <div class="col-4"></div>
                            <div class="col-5">
                                <div class="row">
                                    <div class="col-6">ราคาสุทธิ</div>
                                    <div class="col-6"><c:out value ="${total}"/> บาท</div>
                                </div>
                                <div class="row" style="margin-top: 25px;">
                                    <div class="col-6"></div>
                                    <div class="col-6"><button type="button" class="btn btn-success">ชำระเงินค่าสินค้า</button></div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        </div>




                        <!-- Sidebar Widgets Column -->
                        <div class="col-md-4" style="width:400px;">

                            <!-- Side Widget -->
                            <div class="card my-4">
                                <h4 class="card-header">การจัดส่ง</h4>
                                <div class="card-body">

                                    <form action="" method="post">

                                        <h5>ที่อยู่การจัดส่ง</h5>
                                        <div class="row">
                                            <div class="col-1"><input type="radio" name="address" value="oldAddress"></div>
                                            <div class="col-10">ใช้ที่อยู่การจัดส่งล่าสุด<br>${address.receivername}<br>${address.addressline1}${address.addressline2}<br>ตำบล/แขวง : ${address.district}<br>อำเภอ/เขต : ${address.city}<br>${address.province}<br>${address.postalcode}</div>
                                        </div>
                                        <form action="AddAddress" method="post">
                                            <div class="row" style="margin-top: 15px">
                                                <div class="col-1"><input type="radio" name="address" value="AddAddress"></div>
                                                <div class="col-10">ใช้ที่อยู่การจัดส่งใหม่ 
                                                    <input class="form-control mr-sm-2" type="name" name="receivername" placeholder="ชื่อผู้จัดส่ง">
                                                    <input class="form-control mr-sm-2" type="name" name="addressline1" placeholder="ที่อยู่การจัดส่ง">
                                                    <input class="form-control mr-sm-2" type="name" name="district" placeholder="ตำบล/แขวง">
                                                    <input class="form-control mr-sm-2" type="name" name="city" placeholder="อำเภอ/เขต">
                                                    <input class="form-control mr-sm-2" type="name" name="province" placeholder="จังหวัด">
                                                    <input class="form-control mr-sm-2" type="number" name="postalcode" placeholder="รหัสไปรษณีย์">
                                                    <button type="submit" class="btn btn-primary">เพิ่มที่อยู่</button>
                                                </div>
                                            </div>
                                        </form>

                                        <!-- ประเภท -->
                                        <h5 style="margin-top: 25px">รูปแบบการจัดส่ง</h5>
                                        <div class="row">
                                            <div class="col-1"><input type="radio" name="send" value="register"></div>
                                            <div class="col-10">ลงทะเบียน</div>
                                        </div>
                                        <div class="row" style="margin-top: 15px">
                                            <div class="col-1"><input type="radio" name="send" value="ems"></div>
                                            <div class="col-10">EMS</div>
                                        </div>
                                    </form>



                                </div>
                            </div>

                        </div>

                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->

            <!-- Footer -->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
                </div>
                <!-- /.container -->
            </footer>
    </body>

</html>