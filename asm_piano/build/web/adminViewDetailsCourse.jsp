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
                <h2 class="text-center">Details Course</h2>
                <h4 style="color: red" class="text-center">${msg}</h4>
                <form action="manageCourse" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name">Course Name</label>
                        <input type="text" class="form-control" id="name" value="${course.name}" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="5" required>${course.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="fee">Tuition Fee</label>
                        <input type="text" class="form-control" value="${course.fee}" id="fee" name="fee" required>
                    </div>
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" class="form-control" value="${course.startDate}" id="startDate" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label for="endDate">End Date</label>
                        <input type="date" class="form-control" value="${course.endDate}" id="endDate" name="endDate" required>
                    </div>
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select class="form-control" id="categoryId" name="categoryId" required>
                            <c:forEach items="${listCategory}" var="listCategory">
                                <option ${categoryOfCourse == listCategory.id ? 'selected' : ""} value="${listCategory.id}">${listCategory.categoryName}</option>
                            </c:forEach>

                            <!-- Add more options as needed -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option ${course.status == true ? 'selected' : ""} value="1">Active</option>
                            <option ${course.status == false ? 'selected' : ""} value="0">Inactive</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" value="${course.quanity}" id="quantity" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <label for="image">Course Image</label>
                        <input type="file" class="form-control-file" id="image" name="image" onchange="previewImage(event)" accept="image/*">
                    </div>
                    <div class="form-group">
                        <img id="imagePreview" src="${course.image}" alt="Image Preview" style="max-width: 100%; height: auto;" />
                    </div>
                    
                    <input style="display: none" type="text" name="idCourse" value="${course.id}" />
                    <button type="submit" name="action" value="updateCourse" class="btn btn-primary">Update Course</button>
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
                            function previewImage(event) {
                                var reader = new FileReader();
                                reader.onload = function () {
                                    var output = document.getElementById('imagePreview');
                                    output.src = reader.result;
                                    output.style.display = 'block';
                                };
                                reader.readAsDataURL(event.target.files[0]);
                            }
        </script>
    </body>
</html>
