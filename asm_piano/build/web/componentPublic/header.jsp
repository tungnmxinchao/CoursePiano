<%-- 
    Document   : header
    Created on : Jun 26, 2024, 7:53:00 PM
    Author     : TNO
--%>

<header class="main_menu home_menu">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand" href="index.html"> <img src="img/logo.png" alt="logo"> </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse main-menu-item justify-content-end"
                         id="navbarSupportedContent">
                        <ul class="navbar-nav align-items-center">
                            <li class="nav-item active">
                                <a class="nav-link" href="home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="course">Courses</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Pages
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="single-blog.html">Single blog</a>
                                    <a class="dropdown-item" href="elements.html">Elements</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cart">
                                    <i class="fas fa-shopping-cart"></i> Cart
                                </a>
                            </li>
                            <c:if test="${sessionScope.user == null}">
                                <li class="d-none d-lg-block">
                                    <a class="btn_1" href="home?action=login">Login Now</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
