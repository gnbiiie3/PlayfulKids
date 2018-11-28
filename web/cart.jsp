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
                <!-- for each -->
                <div class="row" style="text-align: center;">
                    <div class="col-3">{}</div>
                    <div class="col-4">{}</div>
                    <div class="col-2">{}</div>
                    <div class="col-2">{}</div>
                    <div class="col-1"><button type="button" class="btn btn-danger">X</button></div>
                </div>
                <hr>
                <!-- for each -->

                <div class="row" style="text-align: center;">
                    <div class="col-3"></div>
                    <div class="col-4"></div>
                    <div class="col-5">
                        <div class="row">
                            <div class="col-6">ราคาสินค้า</div>
                            <div class="col-6">500</div>
                        </div>
                        <div class="row" style="margin-top: 15px;">
                            <div class="col-6">ค่าจัดส่ง</div>
                            <div class="col-6"><span style="color: red;">เลือกประเภทจัดส่ง</span></div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-6">ราคาสุทธิ</div>
                            <div class="col-6">550</div>
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
                                <div class="col-10">217 ถนนเจริญกรุง แขวงยานนาวา เขตสาทร กรุงเทพ 10120</div>
                            </div>
                            <div class="row" style="margin-top: 15px">
                                <div class="col-1"><input type="radio" name="address" value="AddAddress"></div>
                                <div class="col-10"><textarea name="newAddress" style="width:250px; height: 100px;"></textarea></div>
                            </div>

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