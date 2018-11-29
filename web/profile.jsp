<%-- 
    Document   : profile
    Created on : Nov 29, 2018, 9:44:54 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PlayfulKids : My Profile</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
    <link href="https://fonts.googleapis.com/css?family=Rosario" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Register</title>
</head>

<body style="margin-top: 100px; background-image: url('pic/bgprofile.jpg'); background-size: cover; " class="d-flex justify-content-center">


    <img src="pic/profile.png" style="margin-top: 50px; margin-right: 100px;">
    <h1 style="margin-top: 50px; margin-right: 100px;">Profile</h1>
    <form action="Register" method="post">
        <div style="width: 300px; text-align: left;">
            <p>
                ชื่อ : 
            </p>
            <p>
                Email : 
            </p>
            <p>
                นามสกุล :
            </p>
            <p>
                เบอร์ติดต่อ :
            </p>
            <p>
                ที่อยู่ :
            </p>
            <p>
                แขวง / ตำบล :
            </p>
            <p>
                เขต / อำเภอ : 
            </p>
            <p>
                จังหวัด :
            </p>
            <p>
                รหัสไปรษณีย์ : 
            </p>
            <p>
                <a href="editProfile.jsp">
                    <button type="button" class="btn btn-warning">Edit Profile</button>
                </a>
                <a href="index.jsp">
                    <button type="button" class="btn btn-light">Back</button>
                </a>
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