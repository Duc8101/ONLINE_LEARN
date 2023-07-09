<%@page import="Const.ConstValue"%>
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
        <jsp:include page="/WEB-INF/View/Shared/navbar.jsp"></jsp:include>
            <!-- Navbar End -->

        <c:if test="${enroll != null}">
            <script>
                window.onload = function () {
                    alert("${enroll}");
                };
            </script>
        </c:if>


        <!-- Courses Start -->
        <div class="container-xxl py-4">
            <div class="container">
                <div class="text-center wow fadeInDown" data-wow-delay="0.1s">
                    <h4 class="section-title bg-white text-center text-primary px-3">Courses</h4>
                </div>
                <div class="row">
                    <div class="col-2 border">
                        <div class="list-group mt-2" >
                             <a  class="py-3 list-group-item list-group-item-action ${CategoryID == 0 ? "active" : ""}" href="<%=ConstValue.CONTEXT_PATH%>/Courses">ALL</a>
                            <c:forEach var="category" items="${listCategory}">
                                <a  class="py-3 list-group-item list-group-item-action ${category.getID() == CategoryID ? "active" : ""}" href="<%=ConstValue.CONTEXT_PATH%>/Courses?CategoryID=${category.getID()}">${category.getName()}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="border col-10">
                        <form action="Courses" class=" my-3 wow fadeInDown row fs-5 fw-bolder"  data-wow-delay="0.2s">
                            <c:if test="${CategoryID != 0}">
                                <input type="hidden" name="CategoryID" value="${CategoryID}">
                            </c:if>
                            <div class="border col-2 text-center py-2 ms-2 fs-5 fw-bolder">Sort By : </div>
                            <select name="properties" class="form-select form-select-md col-3 mx-1 py-2 fs-5 fw-bolder" aria-label=".form-select-lg example" style="width: 15%">
                                <option value="CourseName">Title</option>
                            </select>
                            <select name="flow" class="form-select form-select-md col-3 mx-1 py-2 fs-5 fw-bolder" aria-label=".form-select-lg example" style="width: 15%">
                                <option value="ASC" ${"ASC".equals(flow) ? "selected" : ""}>Ascending</option>
                                <option value="DESC" ${"DESC".equals(flow) ? "selected" : ""}>Descending</option>
                            </select>
                            <input class="mx-2 btn btn-primary border border-primary col-1 py-2 fs-5 fw-bolder" type="submit" value="Sort">
                        </form>

                        <div class="row g-4 justify-content-center">
                            <c:forEach var="course" items="${listCourse}">
                                <c:set var="isExist" value="false"></c:set>
                                <c:set var="teacher" value="${daoUser.getUser(course.getUserID())}"></c:set>
                                <c:set var="listLesson" value="${daoLesson.getListLesson(course.getCourseID())}"></c:set>
                                    <div class="col-lg-4 col-md-6 wow fadeInDown" data-wow-delay="0.1s">
                                        <div class="course-item bg-light">
                                            <div class="position-relative overflow-hidden">
                                                <div style="height: 240px">
                                                    <img class="img-fluid w-100" src="${course.getImage()}" alt="">
                                            </div> 
                                            <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                                <a href="<%=ConstValue.CONTEXT_PATH%>/Courses/Detail?CourseID=${course.getCourseID()}" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end"
                                                   style="border-radius: 30px ${listLesson.isEmpty() ? "" : "0 0"} 30px;">Read More
                                                </a>
                                                <!-- if login -->
                                                <c:if test="${sessionScope.user != null}">
                                                    <c:forEach var="cour" items="${listEnroll}">
                                                        <c:if test="${cour.getCourseID() == course.getCourseID()}">
                                                            <c:set var="isExist" value="true"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>

                                                <!--if exist student learn course and exist lesson in course -->
                                                <c:if test="${isExist && !listLesson.isEmpty()}">
                                                    <form action="<%=ConstValue.CONTEXT_PATH%>/Courses/LearnCourse">
                                                        <input type="hidden" name="CourseID" value="${course.getCourseID()}">
                                                        <input type="submit" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;" value="Learn Course">
                                                    </form>
                                                </c:if>
                                                <!--if not exist student learn course and exist lesson in course -->
                                                <c:if test="${!isExist && !listLesson.isEmpty()}">
                                                    <a href="<%=ConstValue.CONTEXT_PATH%>/Courses/EnrollCourse?CourseID=${course.getCourseID()}" class="flex-shrink-0 btn btn-sm btn-primary px-3" 
                                                       style="border-radius: 0 30px 30px 0;">Enroll Course</a>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="text-center p-4 pb-0">
                                            <div class="mb-1">

                                            </div>
                                            <h5 class="mb-2">${course.getCourseName().length() <= 24 ? course.getCourseName() : course.getCourseName().substring(0, 24)}${course.getCourseName().length() <= 24 ? "" : "..."}</h5>
                                        </div>
                                        <div class="d-flex border-top">
                                            <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i>${teacher == null ? "" : teacher.getFullName()}</small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${listCourse.size() != 0}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item ${pageSelected == 1 ? "disabled" : ""}"><a class="page-link" href="${previous}">Previous</a></li>
                                            <c:forEach var="i" begin="1" end="${number}">
                                                <c:set var="pageURL" value="<%=ConstValue.CONTEXT_PATH%>"></c:set>
                                                <c:choose>
                                                    <c:when test="${properties == null && flow == null}">
                                                        <c:choose>
                                                            <c:when test="${CategoryID == 0}">
                                                                <c:set var="pageURL" value="${pageURL}/Courses?page=${i}"></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="pageURL" value="${pageURL}/Courses?CategoryID=${CategoryID}&page=${i}"></c:set>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>

                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${CategoryID == 0}">
                                                            <c:set var="pageURL" value="${pageURL}/Courses?properties=${properties}&flow=${flow}&page=${i}"></c:set>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="pageURL" value="${pageURL}/Courses?CategoryID=${CategoryID}&properties=${properties}&flow=${flow}&page=${i}"></c:set>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            <li class="page-item"><a class="page-link" href="${pageURL}">${i}</a></li>  
                                            </c:forEach>
                                        <li class="page-item ${pageSelected == number ? "disabled" : ""}"><a class="page-link" href="${next}">Next</a></li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Courses End -->

        <!-- Footer Start -->
        <jsp:include page="/WEB-INF/View/Shared/footer.jsp"></jsp:include>
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
