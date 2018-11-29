<%-- 
    Document   : register
    Created on : Nov 15, 2018, 11:22:13 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src = "https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src = "https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src = "https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link href="https://fonts.googleapis.com/css?family=Rosario" rel="stylesheet"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Register</title>
    </head>
    
    <h3><center>${message}</center></h3>
    <body style="margin-top: 100px;" class="d-flex justify-content-center">

        <h1 style="margin-top: 50px; margin-right: 100px;">Register</h1>
        <form action="Register" method="post">
            <div style="width: 300px; text-align: left;">
                <p>
                    Email : <input type="text" name="email" style="height: 20px" required/> 
                </p>
                <p>
                    Password : <input type="password" name="password" style="height: 20px" required/>
                </p>
                <p>
                    Confirm Password : <input type="password" name="comfirmpassword" style="height: 20px" required/>
                </p>
                <p>
                    ชื่อ : <input type="text" name="firstname" style="height: 20px" required/>
                </p>
                <p>
                    นามสกุล : <input type="text" name="lastname" style="height: 20px" required/>
                </p>
                <p>
                    เบอร์ติดต่อ : <input type="text" name="phonenumber" style="height: 20px" required/>
                </p>
                <p>
                    ที่อยู่ : <input type="text" name="addressline1" style="height: 20px;" required/>
                </p>
                <p>
                    <input type="text" name="addressline2" style="height: 20px; margin-left: 41px;"/>
                </p>
                <p>
                    แขวง / ตำบล : <input type="text" name="district" style="height: 20px" required/>
                </p>
                <p>
                    เขต / อำเภอ : <input type="text" name="city" style="height: 20px" required/>
                </p>
                <p>
                    จังหวัด : <input type="text" name="province" style="height: 20px" required />
                </p>
                <p>
                    รหัสไปรษณีย์ : <input type="number" name="postalcode" maxlength="5" style="height: 20px" required/>
                </p>

                <p>
                    <input type="submit" value="Submit" style="margin-top: 5px;"/>
                </p>
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
