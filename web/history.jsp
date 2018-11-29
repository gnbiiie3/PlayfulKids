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
                <div class="border border-secondary rounded">
                    <div class="row px-5 pt-3">
                        <div class="col font-weight-bold">History ID : {}</div>
                    </div>
                    <hr>
                    
                    <!-- รายละเอียดประวัติ -->
                    <div class="row px-3" style="text-align: center; font-weight: bold">
                            <div class="col-8">ชื่อสินค้า</div>
                            <div class="col-2">จำนวน</div>
                            <div class="col-2">ราคา/หน่วย</div>
                            
                        </div>
                    <hr style="width:95%;">
                    <div class="row px-3 ">
                        <div class="col-8 pl-5">{ชื่อ}</div>
                        <div class="col-2 text-center">{จำนวน}</div>
                        <div class="col-2 text-center">{ราคา/หน่วย}</div>
                    </div>   
                    <hr style="width:90%;">
                    <!-- จบ รายละเอียดประวัติ -->
                    
                    <!-- ราคาสุทธิ -->
                    <div class="row px-3 pb-3 text-center">
                        <div class="col-8"></div>
                        <div class="col-2">ราคาสุทธิ</div>
                        <div class="col-2">{ราคาสุทธิ}</div>
                    </div>
                </div>
            
        </div>
    </body>
</html>
