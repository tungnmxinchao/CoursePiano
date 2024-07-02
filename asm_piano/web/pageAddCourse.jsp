<%-- 
    Document   : pageAddCourse
    Created on : Jul 2, 2024, 10:59:26 PM
    Author     : TNO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Add Course</title>
        <link rel="icon" href="img/favicon.png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!-- Header -->
        <%@ include file="componentPublic/header.jsp" %>
        <!-- Header end -->

        <!-- Add Course Form -->
        <section class="add-course-section padding_top">
            <div class="container">
                <h2 class="text-center">Add Course</h2>
                <h4 style="color: red" class="text-center">${msg}</h4>
                <form action="manageCourse" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name">Course Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="5" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="fee">Tuition Fee</label>
                        <input type="number" class="form-control" id="fee" name="fee" required>
                    </div>
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label for="endDate">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                    </div>
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select class="form-control" id="categoryId" name="categoryId" required>
                            <c:forEach items="${listCategory}" var="listCategory">
                                <option value="${listCategory.id}">${listCategory.categoryName}</option>
                            </c:forEach>

                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option selected value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <label for="image">Course Image</label>
                        <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
                    </div>
                    <button type="submit" name="action" value="addCourse" class="btn btn-primary">Add Course</button>
                    <a href="manageCourse" class="btn btn-primary">Back to List Course</a>
                </form>
            </div>
        </section>
        <!-- Add Course Form end -->

        <!-- jQuery and Bootstrap scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Custom JS -->
        <script>
            // Add any custom JavaScript here
        </script>
    </body>
</html>
