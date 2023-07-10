<%@page import="Entity.User"%>
<%@page import="Model.DAOUser"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>eLEARNING</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
<!-- Favicon -->
        <link href="<c:url value="/resources/img/favicon.ico"></c:url>" rel="icon">
            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="<c:url value="/resources/lib/animate/animate.min.css"></c:url>" rel="stylesheet">
        <link href="<c:url value="/resources/lib/owlcarousel/assets/owl.carousel.min.css"></c:url>" rel="stylesheet">

            <!-- Customized Bootstrap Stylesheet -->
            <link href="<c:url value="/resources/css/bootstrap.min.css"></c:url>" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="<c:url value="/resources/css/style.css"></c:url>" rel="stylesheet">
        <!-- Favicon -->
        <link href="<c:url value="/resources/img/favicon.ico"></c:url>" rel="icon">
            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

            <!-- Icon Font Stylesheet -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Libraries Stylesheet -->
            <link href="<c:url value="/resources/lib/animate/animate.min.css"></c:url>" rel="stylesheet">
        <link href="<c:url value="/resources/lib/owlcarousel/assets/owl.carousel.min.css"></c:url>" rel="stylesheet">

            <!-- Customized Bootstrap Stylesheet -->
            <link href="<c:url value="/resources/css/bootstrap.min.css"></c:url>" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="<c:url value="/resources/css/style.css"></c:url>" rel="stylesheet">
        </head>

        <body>
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Navbar Start -->
        <jsp:include page="/View/Shared/navbar.jsp"></jsp:include>
            <!-- Navbar End -->

            <!-- About Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                            <div class="position-relative h-100">
                                <img class="img-fluid position-absolute w-100 h-100" src="<c:url value="/resources/img/about.jpg"></c:url>" alt="" style="object-fit: cover;">
                            </div>
                        </div>
                        <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                            <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                            <h1 class="mb-4">Welcome to eLEARNING</h1>
                            <p class="mb-4">
                                Changing learning for the better<br>
                                Whether you want to learn or to share what you know, you are come to the right place. As a global destination for online learning, we connect people through knowledge.
                            </p>
                            <p class="mb-4">At E-Learning, we are all learners and instructors. We live out our values every day to create a culture that is diverse, inclusive, and committed to helping employees thrive.</p>
                            <div class="row gy-2 gx-4 mb-4">
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                                </div>
                                <div class="col-sm-6">
                                    <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About End -->

            <!-- Team Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                        <h1 class="mb-5">Expert Instructors</h1>
                    </div>
                    <div class="row g-4">
                    <%
                        DAOUser daoUser = new DAOUser();
                        // get top 4 teacher
                        List<User> list = daoUser.getTop4Teacher();
                        double num = 0.1;
                        // loop for traverse through list
                        for (User user : list) {
                            String delay = num + "s";
                    %>

                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="<%=delay%>">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">
                                <%
                                    if (user.getImage().contains("http")) {
                                %>
                                <c:set var="image" value="<%=user.getImage()%>"></c:set>
                                <img class="img-fluid" src="<c:url value="/resources/${image}"></c:url>" alt="">
                                <%} else {%>
                                <img class="img-fluid" src="<%=user.getImage()%>" alt="">
                                <%}%>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0"><%=user.getFullName()%></h5>
                                <small>Teacher</small>
                            </div>
                        </div>
                    </div>
                    <% num = num + 0.2;%>
                    <%}%>
                </div>
            </div>
        </div>
        <!-- Team End -->

        <!-- Testimonial Start -->
        <jsp:include page="/View/Shared/testimonial.jsp"></jsp:include>
            <!-- Testimonial End -->

            <!-- Footer Start -->
        <jsp:include page="//View/Shared/footer.jsp"></jsp:include>
            <!-- Footer End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="<c:url value="/resources/lib/wow/wow.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/lib/easing/easing.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/lib/waypoints/waypoints.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/lib/owlcarousel/owl.carousel.min.js"></c:url>"></script>

            <!-- Template Javascript -->
            <script src="<c:url value="/resources/js/main.js"></c:url>"></script>
    </body>
</html>
