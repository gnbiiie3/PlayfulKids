<%-- 
    Document   : index
    Created on : Nov 15, 2018, 7:36:21 PM
    Author     : jenny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playful Kids</title>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%; margin-top: 30px;" >
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" >
                <div class="carousel-item active" style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/funnykid.png" alt="First slide" height="600px" >
                    <div class="carousel-caption">
                        <h5 >Welcome to <b>Playful Kids</b> Shop</h5>
                        <p>ร้านค้าของเล่นเพื่อพัฒนาการที่ดีของลูกน้อยคุณ</p>
                        <a href="ProductList"><button type="button" class="btn btn-warning">ดูสินค้าทั้งหมด</button></a>
                    </div>
                </div>
                <div class="carousel-item" style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/toypromo.png" alt="Second slide" >
                    <div class="carousel-caption">
                        
                        <a href="ProductList"><button type="button" class="btn btn-warning">ดูสินค้าทั้งหมด</button></a>
                        
                    </div>
                </div>
                <div class="carousel-item"  style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/coloring.png" alt="Third slide">
                    <div class="carousel-caption">
                        <h5>Lots of Magezine Here </h5>
                        <a href="ProductList"><button type="button" class="btn btn-warning">ดูสินค้าประเภทนี้</button></a>
                        <p>Update the daily news and Fashion</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Page Content -->
        <div class="container">

            <h1 class="my-4">ของเล่นเสริมพัฒนาการเด็ก</h1>

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-6 mb-6" style="margin-bottom: 30px;">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="pic/physical.jpg" alt=""></a>
                        <h4 class="card-header">ด้านร่างกาย</h4>
                        <div class="card-body">
                            <p class="card-text">เป็นความสามารถของร่างกายในการทรงตัวและการเคลื่อนไหว โดยการใช้กล้ามเนื้อมัดใหญ่ (Gross Motor Development) เช่น วิ่ง, กระโดด, ปีนป่าย และการใช้กล้ามเนื้อมัดเล็ก มือและตาประสานกันในการทำกิจกรรมต่างๆ (Fine Motor - Adaptive Development) เช่น ระบายสี, ใช้ช้อน, ติดกระดุม</p>
                        </div>
                        <div class="card-footer">
                            <a href="ProductList?category=1" class="btn btn-primary">ดูรายการสินค้า</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-6" style="margin-bottom: 30px;">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="pic/social.jpg" alt=""></a>
                        <h4 class="card-header">ด้านสังคม</h4>
                        <div class="card-body">
                            <p class="card-text">เป็นความสามารถในการสร้างสัมพันธภาพกับผู้อื่น เข้าใจผู้อื่น (personal-social) สามารถช่วยเหลือตนเองในชีวิตประจำวัน (self help, self care) และรู้จักผิดชอบชั่วดี ประกอบด้วย พัฒนาการด้านสังคม (Social Development) และพัฒนาการด้านคุณธรรม (Moral Development)</p>
                        </div>
                        <div class="card-footer">
                            <a href="ProductList?category=2" class="btn btn-primary">ดูรายการสินค้า</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-6" style="margin-bottom: 70px;">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="pic/emotion.jpg" alt=""></a>
                        <h4 class="card-header">ด้านอารมณ์</h4>
                        <div class="card-body">
                            <p class="card-text">เป็นความสามารถในการแสดงความรู้สึก และควบคุมการแสดงออกของอารมณ์อย่างเหมาะสม ในอารมณ์ต่างๆ เช่น ยิ้ม, ร้องไห้, หัวเราะ, กลัว, เศร้า, เสียใจ, โกรธ รวมถึงการสร้างความรู้สึกที่ดี การนับถือตนเอง (self esteem)</p>
                        </div>
                        <div class="card-footer">
                            <a href="ProductList?category=3" class="btn btn-primary">ดูรายการสินค้า</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-6" style="margin-bottom: 70px;">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="pic/cognitive.jpg" alt=""></a>
                        <h4 class="card-header">ด้านสติปัญญา</h4>
                        <div class="card-body">
                            <p class="card-text">เป็นความสามารถในการเรียนรู้ความสัมพันธ์ระหว่างสิ่งต่างๆ กับตนเอง เป็นกระบวนการทางจิตใจ (mental processes) ที่เราใช้คิด เรียนรู้ หาเหตุผล แก้ไขปัญหา และสื่อสาร ซึ่งประกอบด้วย พัฒนาการด้านภาษา (Language Development) และพัฒนาการด้านกล้ามเนื้อมัดเล็ก (Fine Motor Development)</p>
                        </div>
                        <div class="card-footer">
                            <a href="ProductList?category=4" class="btn btn-primary">ดูรายการสินค้า</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->


            

            

            <!-- Features Section -->
            <div class="row">
                <div class="col-lg-6">
                    <h2>สีที่ปลอดภัยกับลูกน้อยของคุณ</h2>

                    <p>สีที่ใช้สำหรับการทาลงบนของเล่นเด็กคือ สีแลคเกอร์<br>
                        ที่ผ่านมาตรฐานความปลอดภัย EN-71 (EN = European Norm) Safety of Toys.<br>
                        ซึ่งเป็นมาตรฐานคุณภาพสินค้ายุโรป ในส่วนที่เกี่ยวข้องกับของเล่นเด็ก<br>
                        โดยตัวสีปราศจากโลหะหนักอันตราย 8 ชนิด เพื่อให้มั่นใจว่าของเล่นเด็กมีความปลอดภัยจากสารเคมี</p>
                </div>
                <div class="col-lg-6">
                    <img class="img-fluid rounded" src="pic/paintbucket.jpg" alt="">
                </div>
            </div>
            <!-- /.row -->

            <hr>

           

        </div>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <!-- /.container -->
        </footer>
    </body>
</html>
