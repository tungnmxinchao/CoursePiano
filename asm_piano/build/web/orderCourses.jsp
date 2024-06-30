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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Tuition Fee</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCart}" var="listCart">
                            <form action="cart" method="POST">
                                <tr>
                                    <td>${listCart.courseName}</td>
                                    <td>${listCart.fee}</td>
                                    <td> 
                                        <input disabled id="input-${listCart.id}" type="number" value="${listCart.total}" class="form-control" min="1">
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <h4 id="totalAmount">Total Amount: ${totalAmount}</h4>
                </div>
            </div>
        </section>
        <!-- Cart section end -->

        <!-- Order section start -->
        <section class="order_section padding_top">
            <div class="container">
                <h2 class="text-center">Order Information</h2>
                <h4 style="color: red" class="text-center">${msg}</h4>
                <form action="course?action=confirmOrder" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" value="${user.fullName}" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" value="${user.address}" id="address" name="address" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" class="form-control" value="${user.phoneNum}" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <select name="optionCharge">
                            <option selected >Cash payment</option>
                        </select>
                    </div>
                    <div class="text-center mt-4">
                        <input type="hidden" name="arrayCourse" value="${arrayCourse}">
                        <button name="action" value="confirmOrder" class="btn btn-success">Confirm Order</button>
                    </div>
                </form>
            </div>
        </section>
        <!-- Order section end -->

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
