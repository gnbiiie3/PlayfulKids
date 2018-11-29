<%-- 
    Document   : checkoutSuccess
    Created on : Nov 29, 2018, 11:41:49 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>สั่งซื้อสำเร็จ!</title>
    </head>
    <body style="margin-top: 100px; background-color:#ffca03" >
        <%@include file="include/Header.jsp"%>
        <div class="container">
            <div class="text-center">
                <img src="pic/check.png" style="height: 400px" class="mb-2">
                <h1>การสั่งซื้อของคุณเสร็จสิ้น!</h1>
                <a href="index.jsp">
                        <button type="button" class="btn btn-info">กลับไปหน้าแรก</button>
                </a>
            </div>
        </div>
    </body>
</html>
