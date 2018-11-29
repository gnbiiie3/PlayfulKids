<%-- 
    Document   : editProfile
    Created on : Nov 29, 2018, 10:29:40 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PlayfulKids : Edit Profile</title>
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
                <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
            </head>
            <body style="margin-top: 100px; background-image: url('pic/bgprofile.jpg'); background-size: cover; " class="d-flex justify-content-center">
            
             
                <h1 style="margin-top: 50px; margin-right: 100px;">Edit Profile</h1>
                <form action="EditProfile" method="post">
                    <div style="width: 300px; text-align: left;">
                        <p>
                            ชื่อ : <input type="text" name="firstname" style="height: 20px" value="${customer.firstname}" required/>
                        </p>
                        <p>
                            นามสกุล : <input type="text" name="lastname" style="height: 20px" value="${customer.lastname}" required/>
                        </p>
                        <p>
                            เบอร์ติดต่อ : <input type="text" name="phonenumber" style="height: 20px"  value="${customer.phonenumber}" required/>
                        </p>
                        <p>
                            ที่อยู่ : <input type="text" name="addressline1" style="height: 20px;" value="${address.addressline1}" required/>
                        </p>
                        <p>
                            <input type="text" name="addressline2" style="height: 20px;  margin-left: 41px;" value="${address.addressline2}"/>
                        </p>
                        <p>
                            แขวง / ตำบล : <input type="text" name="district" style="height: 20px" value="${address.district}" required/>
                        </p>
                        <p>
                            เขต / อำเภอ : <input type="text" name="city" style="height: 20px" value="${address.city}" required/>
                        </p>
                        <p>
                            จังหวัด : <input type="text" name="province" style="height: 20px" value="${address.province}" required />
                        </p>
                        <p>
                            รหัสไปรษณีย์ : <input type="number" name="postalcode" maxlength="5" style="height: 20px" value="${address.postalcode}"  required/>
                        </p>
                        <button type="submit" class="btn btn-info">แก้ไขข้อมูล</button>
        
                    </div>
        
        
                </form>
        
            </body>
            <style>
                body {
                    width: 100vw;
                    text-align: center;
                }
                body {
        font-family: 'Itim', cursive;
    }
            </style>
</html>
