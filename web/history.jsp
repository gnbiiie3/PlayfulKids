<%-- 
    Document   : history
    Created on : Nov 29, 2018, 6:29:36 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PlayfulKids : History</title>
    </head>
    <body style="margin-top: 70px;">
        <%@include file="include/Header.jsp" %>
        <div class="container">
            <h1 class="mt-4 mb-3">My History</h1>
            <c:forEach items="${history}" var="history">
                <div class="border border-secondary rounded">
                    <div class="row px-5 pt-3">
                        <div class="col font-weight-bold">History ID : ${history.historyid}</div>
                    </div>
                    <hr>
                    <c:forEach items="${historydetail}" var="historydetail">
                        <!-- รายละเอียดประวัติ -->
                        <div class="row px-3" style="text-align: center; font-weight: bold">
                            <div class="col-8">ชื่อสินค้า</div>
                            <div class="col-2">จำนวน</div>
                            <div class="col-2">ราคา/หน่วย</div>

                        </div>
                        <hr style="width:95%;">
                        <div class="row px-3 ">
                            <div class="col-8 pl-5">${historydetail.productId}</div>
                            <div class="col-2 text-center">${historydetail.productquantity}</div>
                            <div class="col-2 text-center">${historydetail.productprice}</div>
                        </div>   
                        <hr style="width:90%;">
                        <!-- จบ รายละเอียดประวัติ -->
                    </c:forEach>
                    <!-- ราคาสุทธิ -->
                    <div class="row px-3 pb-3 text-center">
                        <c:set var="total" value="${0}" />
                        <c:forEach var="article" items="${cart.lineItems}">
                            <c:set var="total" value="${total + article.totalPrice}" />
                        </c:forEach>
                        <div class="col-8"></div>
                        <div class="col-2">ราคาสุทธิ</div>
                        <div class="col-2"><c:out value="${total}" /> บาท</div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>
    </body>
</html>
