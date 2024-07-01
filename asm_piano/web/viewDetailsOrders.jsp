<%-- 
    Document   : orderCourses
    Created on : Jun 29, 2024, 6:00:57 PM
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
        <title>Order</title>
        <link rel="icon" href="img/favicon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!-- Header part start -->
        <%@include file="componentPublic/header.jsp" %>
        <!-- Header part end -->

        <!-- Cart section start -->
        <section class="cart_section padding_top">
            <div class="container">
                <div class="table-responsive">
                    <h2 class="text-center">View Details Orders</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Tuition Fee</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listOrderDetails}" var="listOrderDetails">
                            <form action="cart" method="POST">
                                <tr>
                                    <td>${listOrderDetails.nameCourse}</td>
                                    <td>${listOrderDetails.coursePrice}</td>
                                    <td>${listOrderDetails.amount}</td>  
                                    <td>
                                        <a href="course?action=viewCourseDetails&idCourse=${listOrderDetails.courseID}" title="View Details">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </td>       
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- Cart section end -->

        <!-- Footer part start -->

        <!-- Footer part end -->

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!-- JavaScript để cập nhật arrayCourse -->
        <script>

        </script>
    </body>
</html>
