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
                <h2 class="text-center">Tracking Orders</h2>
                <form action="trackingOrderByUser">
                    <input type="number" name="orderID" value="" placeholder="Enter Order ID"/>
                    <button name="action" value="search" type="submit">Search</button>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Full Name</th>
                                <th>Phone Number</th>
                                <th>Address</th>
                                <th>Total Cost</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listOrder}" var="listOrder">
                                <tr>
                                    <td>${listOrder.orderID}</td>                                                                     
                                    <td>${listOrder.orderDate}</td>
                                    <td>${listOrder.fullName}</td>
                                    <td>${listOrder.phoneNum}</td>
                                    <td>${listOrder.address}</td>
                                    <td>${listOrder.totalCost}</td>
                                    <td>${listOrder.status}</td>
                                    <td>
                                        <a href="trackingOrderByUser?action=viewDetailsOrder&id=${listOrder.orderID}" title="View Details">
                                            <i class="fa fa-eye"></i>
                                        </a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- pagination part start -->
        <%@include file="componentPublic/pagination.jsp" %>
        <!-- pagenation part end -->

        <!-- Cart section end -->

        <!-- Footer part start -->
        <!-- Footer part end -->

        <!-- JQuery and Bootstrap scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom JS for cart actions -->
        <script>
        </script>
    </body>
</html>