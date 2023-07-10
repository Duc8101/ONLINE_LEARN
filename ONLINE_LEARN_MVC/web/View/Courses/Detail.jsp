<%@page import="Const.ConstValue"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

            <div class="container-fluid py-5 wow fadeInDown row" data-wow-delay="0.1s">
                <div class="border col-4">
                    <div class="row g-4 justify-content-center">
                    <c:set var="isExist" value="false"></c:set>
                    <c:set var="teacher" value="${daoUser.getUser(course.getUserID())}"></c:set>
                        <div class="col-12 wow fadeInDown" data-wow-delay="0.1s">
                            <div class="course-item bg-light">
                                <div class="position-relative overflow-hidden">
                                    <div style="height: 240px">
                                        <img style="width: 100%" class="img-fluid" src="${course.getImage()}" alt="">
                                </div>
                                <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                    <!-- if login -->
                                    <c:if test="${sessionScope.user != null}">
                                        <c:forEach var="cour" items="${listEnroll}">
                                            <c:if test="${cour.getCourseID() == course.getCourseID()}">
                                                <c:set var="isExist" value="true"></c:set>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <!--if exist student learn course and exist lesson in course -->
                                    <c:if test="${isExist && !list.isEmpty()}">
                                        <form action="<%=ConstValue.CONTEXT_PATH%>/Courses/LearnCourse">
                                            <input type="hidden" name="CourseID" value="${course.getCourseID()}">
                                            <input type="submit" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;" value="Learn Course">
                                        </form>
                                    </c:if>   

                                    <!--if not exist student learn course and exist lesson in course -->
                                    <c:if test="${!isExist && !listLesson.isEmpty()}"><
                                        <a href="<%=ConstValue.CONTEXT_PATH%>/Courses/EnrollCourse?CourseID=${course.getCourseID()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" 
                                           style="border-radius: 0 30px 30px 0;">Enroll Course</a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="text-center p-4 pb-0">
                                <div class="mb-1">

                                </div>
                                <h5 class="mb-2">${course.getCourseName()}</h5>

                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border py-2"><i class="fa fa-user-tie text-primary me-2"></i>${teacher == null ? "" : teacher.getFullName()}</small>
                            </div>

                        </div>
                    </div>
                </div> 
                <div class="money-back text-center my-2">30-Day Money-Back Guarantee</div>     
            </div>


            <div class="col-8 row">
                <div class="border row align-items-center " >
                    <b style="font-size: 20px">Course Content Description:</b>
                    <p>${course.getDescription() == null ? "" : course.getDescription()}</p>              
                </div>
                <div class="border row">
                    <div class="my-2">
                        <ol class="list-group list-group-numbered">
                            <c:forEach var="lesson" items="${list}">
                                <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold">${lesson.getLessonName()}</div>
                                    </div>
                                </li>
                            </c:forEach>

                            <!--if not exist lesson -->
                            <c:if test="${list.isEmpty()}">
                                <h1 class="mb-4 justify-content-center text-primary"><i class="bi bi-exclamation-triangle display-1 text-primary"></i>This Course Is Under Development Process And Don't Have Any Courses Yet</h1>
                            </c:if>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <jsp:include page="/View/Shared/footer.jsp"></jsp:include>
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
