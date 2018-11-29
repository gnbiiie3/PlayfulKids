<%-- 
    Document   : checkout
    Created on : Nov 29, 2018, 7:27:34 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PlayfulKids : Checkout</title>
    </head>

    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">
            <h1>Checkout</h1>
            <div class="border border-secondary rounded">
                <div class="row px-5 pt-3">
                    <div class="col font-weight-bold">รายการซื้อสินค้าทั้งหมด</div>
                </div>
                <hr>


                <div class="row px-3" style="text-align: center; font-weight: bold">
                    <div class="col-8">ชื่อสินค้า</div>
                    <div class="col-2">จำนวน</div>
                    <div class="col-2">ราคา/หน่วย</div>

                </div>
                <hr style="width:95%;">
                <c:forEach items="${cart.lineItems}" var="product" varStatus="i">
                    <div class="row px-3 ">
                        <div class="col-8 pl-5">${product.product.productname}</div>
                        <div class="col-2 text-center">{จำนวน}</div>
                        <div class="col-2 text-center">${product.product.productprice}</div>
                    </div>
                </c:forEach>
                <hr style="width:90%;">
                <!-- จบ รายละเอียด -->

                <!-- ราคาสุทธิ -->
                <div class="row px-3 pb-3 text-center">
                    <c:set var="total" value="${0}"/>
                    <c:forEach var="article" items="${cart.lineItems}">
                        <c:set var="total" value="${total + article.totalPrice}" />
                    </c:forEach>
                    <div class="col-8"></div>
                    <div class="col-2">ราคาสุทธิ</div>
                    <div class="col-2"><c:out value ="${total}"/> บาท</div>
                </div>
            </div>

            <!-- ที่อยู่ -->
            <div class="border border-secondary rounded mt-4">
                <div class="row px-5 pt-3">
                    <div class="col font-weight-bold">ที่อยู่จัดส่ง</div>
                </div>
                <hr>

                <div class="row px-3">
                    <div class="col pl-5">${address.receivername}<br>${address.addressline1} ${address.addressline2}<br>ตำบล/แขวง
                        ${address.district}<br>อำเภอ/เขต ${address.city}<br>${address.province}<br>${address.postalcode}</div>

                </div>
            </div>
            <hr>
            <div class="d-flex justify-content-center">
                <div class="row pl-5 pr-2 pb-3" style="width: 50%">
                    
                    <!-- ตัวฟอร์มกรอกชำระ -->
                    <div class="col-12 pb-1">
                        <input class="form-control mr-sm-2 " type="name" name="receivername" placeholder="ชื่อเจ้าของบัญชี">
                    </div>
                    <div class="col-12 pb-1">
                        <input class="form-control mr-sm-2" type="name" name="receivername" placeholder="เลขที่บนบัตร">
                    </div>
                    <div class="col-6" pb-1>
                        <input class="form-control mr-sm-2" type="date" name="receivername" placeholder="วันหมดอายุ">
                    </div>
                    <div class="col-6" pb-1>
                        <input class="form-control mr-sm-2" type="name" name="receivername" placeholder="รหัส CVC">
                    </div>
                    <!-- ตัวฟอร์มกรอกชำระ -->
                </div>
            </div>
            <button type="button" class="btn btn-success mt-3 float-right mb-5">Checkout</button>
        </div>
        <footer class="py-5 bg-dark" style="margin-top: 70px;">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>
    </body>

</html>