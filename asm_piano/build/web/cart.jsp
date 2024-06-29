<%-- 
    Document   : cart
    Created on : Jun 26, 2024, 8:06:42 PM
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
        <title>Cart</title>
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
                <h2 class="text-center">Shopping Cart</h2>
                <c:forEach items="${messageList}" var="messageList">
                    <h4 style="color: red"class="text-center">${messageList}</h4>
                </c:forEach>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Course Name</th>
                                <th>Tuition Fee</th>
                                <th>Total</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCart}" var="listCart">
                            <form action="cart" method="POST">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="idCourse" value="${listCart.id}" />
                                    </td>
                                    <td>${listCart.courseName}</td>
                                    <td>${listCart.fee}</td>
                                    <td> <input id="input-${listCart.id}" type="number" value="${listCart.total}" class="form-control" min="1"></td>
                                    <td>
                                        <input style="display: none" type="text" name="idCourse" value="${listCart.id}" />
                                        <input style="display: none" type="text" name="action" value="removeCart" />
                                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i></button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <h4 id="totalAmount" >Total Amount: ${totalAmount}</h4>
                </div>
                <form action="course" method="POST">
                    <div class="text-center mt-4">
                        <input style="display: none" type="text" name="arrayCourse" value="" />
                        <button name="action" value="confirmPurchase"class="btn btn-success">Confirm Purchase</button>
                    </div>
                </form>
            </div>
        </section>
        <!-- Cart section end -->

        <!-- Footer part start -->
        <!-- Footer part end -->

        <!-- JQuery and Bootstrap scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom JS for cart actions -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Tìm tất cả các checkbox có name là idCourse
                const checkboxes = document.querySelectorAll('input[type="checkbox"][name="idCourse"]');
                const arrayCourseInput = document.querySelector('input[name="arrayCourse"]');

                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        // Lấy tất cả các giá trị của checkbox đã chọn
                        const selectedValues = Array.from(checkboxes)
                                .filter(cb => cb.checked)
                                .map(cb => cb.value);

                        // Gắn giá trị vào thẻ input arrayCourse, ngăn cách bởi dấu phẩy
                        arrayCourseInput.value = selectedValues.join(',');
                    });
                });
            });
        </script>
    </body>
</html>