<%-- 
    Document   : courseDetails
    Created on : Jun 15, 2024, 3:14:37 PM
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
                                <h2>Course Details</h2>
                                <p>Home<span>/</span>Course Details</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb start-->

        <!--================ Start Course Details Area =================-->
        <section class="course_details_area section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 course_details_left">
                        <div class="main_image">
                            <img class="img-fluid" src="${course.image}" alt="">
                        </div>
                        <div class="content_wrapper">
                            <h4 class="title_top">Description</h4>
                            <div class="content">
                                ${course.description}
                            </div>

                            <h4 class="title">Eligibility</h4>
                            <div class="content">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore
                                magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                                ut aliquip ex ea commodo
                                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.
                                <br>
                                <br>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore
                                magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
                                ut aliquip ex ea
                                commodoconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                cillum. Lorem ipsum dolor sit
                                amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                dolore magna aliqua. Ut enim
                                ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                commodo consequat. Duis aute
                                irure dolor in reprehenderit in voluptate velit esse cillum.
                            </div>

                            <h4 class="title">Course Outline</h4>
                            <div class="content">
                                <ul class="course_list">
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Introduction Lesson</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Basics of HTML</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Getting Know about HTML</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Tags and Attributes</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Basics of CSS</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Getting Familiar with CSS</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Introduction to Bootstrap</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Responsive Design</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                    <li class="justify-content-between align-items-center d-flex">
                                        <p>Canvas in HTML 5</p>
                                        <a class="btn_2 text-uppercase" href="#">View Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-4 right-contents">
                        <div class="sidebar_top">
                            <ul>
                                <li>
                                    <a class="justify-content-between d-flex">
                                        <p>Trainer’s Name</p>
                                        <span class="color">${course.userCreated}</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="justify-content-between d-flex">
                                        <p>Course Fee </p>
                                        <span>${course.fee}</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="justify-content-between d-flex">
                                        <p>Schedule </p>
                                        <span>${course.startDate} to ${course.endDate}</span>
                                    </a>
                                </li>

                            </ul>
                            <a href="course?action=addToCart&idCourse=${course.id}" class="btn_1 d-block">Add To Cart</a>
                        </div>

                        <h4 class="title">Reviews</h4>
                        <div class="content">
                            <div class="review-top row pt-40">
                                <div class="col-lg-12">
                                    <h6 class="mb-15">Provide Your Rating</h6>
                                    <div class="d-flex flex-row reviews justify-content-between">
                                        <span>Quality</span>
                                        <div class="rating">
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                        </div>
                                        <span>Outstanding</span>
                                    </div>
                                    <div class="d-flex flex-row reviews justify-content-between">
                                        <span>Puncuality</span>
                                        <div class="rating">
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                        </div>
                                        <span>Outstanding</span>
                                    </div>
                                    <div class="d-flex flex-row reviews justify-content-between">
                                        <span>Quality</span>
                                        <div class="rating">
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                            <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                        </div>
                                        <span>Outstanding</span>
                                    </div>

                                </div>
                            </div>
                            <div class="feedeback">
                                <h6>Your Feedback</h6>
                                <textarea name="feedback" class="form-control" cols="10" rows="10"></textarea>
                                <div class="mt-10 text-right">
                                    <a href="#" class="btn_1">Read more</a>
                                </div>
                            </div>
                            <div class="comments-area mb-30">
                                <div class="comment-list">
                                    <div class="single-comment single-reviews justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/cource/cource_1.png" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Emilly Blunt</a>
                                                </h5>
                                                <div class="rating">
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                                </div>
                                                <p class="comment">
                                                    Blessed made of meat doesn't lights doesn't was dominion and sea earth
                                                    form
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-list">
                                    <div class="single-comment single-reviews justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/cource/cource_2.png" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Elsie Cunningham</a>
                                                </h5>
                                                <div class="rating">
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                                </div>
                                                <p class="comment">
                                                    Blessed made of meat doesn't lights doesn't was dominion and sea earth
                                                    form
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="comment-list">
                                    <div class="single-comment single-reviews justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/cource/cource_3.png" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Maria Luna</a>
                                                </h5>
                                                <div class="rating">
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/color_star.svg" alt=""></a>
                                                    <a href="#"><img src="img/icon/star.svg" alt=""></a>
                                                </div>
                                                <p class="comment">
                                                    Blessed made of meat doesn't lights doesn't was dominion and sea earth
                                                    form
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================ End Course Details Area =================-->

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
        <script src="js/jquery.nice-select.min.js"></script>
        <!-- particles js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- swiper js -->
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>

</html>
