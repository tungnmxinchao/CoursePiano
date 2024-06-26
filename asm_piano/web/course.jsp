<%-- 
    Document   : course
    Created on : Jun 15, 2024, 3:13:35 PM
    Author     : TNO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Etrain</title>
        <link rel="icon" href="img/favicon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- themify CSS -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- flaticon CSS -->
        <link rel="stylesheet" href="css/flaticon.css">
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="css/magnific-popup.css">
        <!-- swiper CSS -->
        <link rel="stylesheet" href="css/slick.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <!--::header part start::-->
        <%@include file="componentPublic/header.jsp" %>
        <!-- Header part end-->

        <!-- breadcrumb start-->
        <section class="breadcrumb breadcrumb_bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner text-center">
                            <div class="breadcrumb_iner_item">
                                <h2>Our Courses</h2>
                                <p>Home<span>/</span>Courses</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb start-->

        <!--::review_part start::-->
        <section class="special_cource padding_top">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-5">
                        <div class="section_tittle text-center">
                            <p>popular courses</p>
                            <h2>Special Courses</h2>
                        </div>
                    </div>
                </div>
                <form action="course">
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="name" placeholder='Enter name course'
                                   onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = 'Enter name course'">
                            <div class="input-group-append">                    
                                <input class="btn btn_1" class="ti-angle-right" type="submit" name="action" value="search" />
                            </div>
                        </div>
                    </div> 
                </form>
                <div class="row">
                    <c:forEach items="${listCourse}" var="listCourse">
                        <div class="col-sm-6 col-lg-4">
                            <div class="single_special_cource">
                                <img src="${listCourse.image}" class="special_img" alt="">
                                <div class="special_cource_text">
                                    <a href="course?action=viewCourseDetails&idCourse=${listCourse.id}" class="btn_4">${listCourse.category_name}</a>
                                    <h4>${listCourse.fee}</h4>
                                    <a href="course?action=viewCourseDetails&idCourse=${listCourse.id}">
                                        <h3>${listCourse.name}</h3>
                                    </a>
                                    <p>${listCourse.description}</p>
                                    <div class="author_info">
                                        <div class="author_img">
                                            <img src="img/author/author_1.png" alt="">
                                            <div class="author_info_text">
                                                <p>Conduct by:</p>
                                                <h5><a>${listCourse.userCreated}</a></h5>
                                            </div>
                                        </div>
                                        <div class="author_rating">
                                            <div class="rating">
                                                <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                            </div>
                                            <p>3.8 Ratings</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!--::blog_part end::-->
        <%@include file="componentPublic/pagination.jsp"%>

        <!-- footer part start-->
        <footer class="footer-area">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-sm-6 col-md-4 col-xl-3">
                        <div class="single-footer-widget footer_1">
                            <a href="index.html"> <img src="img/logo.png" alt=""> </a>
                            <p>But when shot real her. Chamber her one visite removal six
                                sending himself boys scot exquisite existend an </p>
                            <p>But when shot real her hamber her </p>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-xl-4">
                        <div class="single-footer-widget footer_2">
                            <h4>Newsletter</h4>
                            <p>Stay updated with our latest trends Seed heaven so said place winged over given forth fruit.
                            </p>
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Enter email address'
                                               onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Enter email address'">
                                        <div class="input-group-append">
                                            <button class="btn btn_1" type="button"><i class="ti-angle-right"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div class="social_icon">
                                <a href="#"> <i class="ti-facebook"></i> </a>
                                <a href="#"> <i class="ti-twitter-alt"></i> </a>
                                <a href="#"> <i class="ti-instagram"></i> </a>
                                <a href="#"> <i class="ti-skype"></i> </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-sm-6 col-md-4">
                        <div class="single-footer-widget footer_2">
                            <h4>Contact us</h4>
                            <div class="contact_info">
                                <p><span> Address :</span> Hath of it fly signs bear be one blessed after </p>
                                <p><span> Phone :</span> +2 36 265 (8060)</p>
                                <p><span> Email : </span>info@colorlib.com </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright_part_text text-center">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer part end-->

        <!-- jquery plugins here-->
        <!-- jquery -->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.magnific-popup.js"></script>
        <!-- swiper js -->
        <script src="js/swiper.min.js"></script>
        <!-- swiper js -->
        <script src="js/masonry.pkgd.js"></script>
        <!-- particles js -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <!-- swiper js -->
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>

</html>
