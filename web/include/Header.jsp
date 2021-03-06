<%-- 
    Document   : Header
    Created on : Nov 15, 2018, 7:31:33 PM
    Author     : kanisorn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">



<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top" style="background-color: #223F4A


">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Playful Kids</a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="productPage.jsp" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Product
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                    <a class="dropdown-item" href="ProductList?category=1">ด้านสติปัญญา</a>
                    <a class="dropdown-item" href="ProductList?category=2">ด้านร่างกาย</a>
                    <a class="dropdown-item" href="ProductList?category=3">ด้านอารมณ์</a>
                    <a class="dropdown-item" href="ProductList?category=4">ด้านสังคม</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="ProductList">ดูทั้งหมด</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">

                <c:choose>
                    <c:when test ="${account != null}">
                        <div class="dropdown" >
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Hello:&nbsp;${customer.firstname}
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="Profile">Profile</a>
                                <a class="dropdown-item" href="Cart">My Cart</a>
                                <a class="dropdown-item" href="History">History</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Logout">Logout</a>
                                
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="Login">Login</a>
                        </li>
                        <li class="nav-item nav-link">|</li>
                        <li class="nav-item">
                            <a class="nav-link" href="Register">Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <!--                <li>
                                    <form class="form-inline">
                                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                                    </form>  
                                </li>-->

            </ul>
        </div>
    </div>
</nav>
<style>
    nav{font-family: 'Itim', cursive;}
    body {
        font-family: 'Itim', cursive;
    }
</style>
<style>
    /*    body {
            opacity: 1;
            transition: 1s opacity;
        }
        body.fade-out {
            opacity: 0;
            transition: none;
        }*/
    
</style>
<script>document.body.className += ' fade-out';
    $(function () {
        $('body').removeClass('fade-out');
    });
</script>
