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
                                        <input type="checkbox" name="" value="ON" />
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
                <div class="text-center mt-4">
                    <button class="btn btn-success" onclick="confirmPurchase()">Confirm Purchase</button>
                </div>
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
                            // Lắng nghe sự kiện khi input thay đổi
                            const inputs = document.querySelectorAll('input[type="number"]');
                            inputs.forEach(input => {
                                input.addEventListener('change', updateTotalAmount);
                            });

                            // Hàm tính toán và cập nhật tổng số tiền
                            function updateTotalAmount() {
                                let totalAmount = 0;
                                const inputs = document.querySelectorAll('input[type="number"]');
                                inputs.forEach(input => {
                                    const id = input.getAttribute('id').replace('input-', '');
                                    const fee = parseFloat('${listCart.fee}'.replace('.', '').replace('đ', '')); // Chuyển đổi string fee sang số
                                    const value = parseFloat(input.value); // Lấy giá trị của input
                                    const subtotal = fee * value; // Tính tổng tiền cho từng mặt hàng
                                    totalAmount += subtotal; // Cộng dồn vào tổng số tiền
                                });

                                // Cập nhật lại nội dung của h4
                                document.getElementById('totalAmount').textContent = `Total Amount: ${totalAmount.toLocaleString()}đ`; // Hiển thị số tiền có dấu đ separa
                            }
                        });
        </script>
    </body>
</html>