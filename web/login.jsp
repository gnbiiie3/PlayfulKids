<%-- 
    Document   : login
    Created on : Nov 15, 2018, 11:22:32 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1 style="margin-top: 250px;">LOGIN</h1>
        <form action="Login" method="post">
            <div class="row" style="margin-bottom: 5px;">
                <input type="text" name="id" placeholder="Username" style="height: 20px"/>
            </div>
            <div class="row">
                <input type="text" name="pass" placeholder="Password" style="height: 20px"/>
            </div>
            <div class="row">
                <input type="submit" value="Submit" style="margin-top: 5px;"/>
            </div>
        </form>
    </body>
    <style>
        body {
            width: 100vw;
            text-align: center;
        }
    </style>
</html>
