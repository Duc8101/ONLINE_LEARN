<%@page import="Const.ConstValue"%>
<%@page import="Entity.User"%>
<%
    User user = (User) session.getAttribute("user");
    String d_none1 = user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT) ? "d-none" : "";
    String d_none2 = user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT) ? "" : "d-none";
    String d_none3 = user != null && user.getRoleName().equals(ConstValue.ROLE_TEACHER) ? "" : "d-none";
%>
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="<%=ConstValue.CONTEXT_PATH%>/Home" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-info"><i class="fa fa-book me-3"></i>eLEARNING</h2>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <a href="<%=ConstValue.CONTEXT_PATH%>/Home" class="nav-item nav-link">Home</a>
            <a href="<%=ConstValue.CONTEXT_PATH%>/About" class="nav-item nav-link">About</a>
            <a href="<%=ConstValue.CONTEXT_PATH%>/MyTeachingCourse/Create" class="nav-item nav-link <%=d_none1%>">Create Course</a>
            <%  // if not login or login as student
                if (user == null || user.getRoleName().equals(ConstValue.ROLE_STUDENT)) {
            %>
            <a href="<%=ConstValue.CONTEXT_PATH%>/Courses" class="nav-item nav-link">Courses</a>
            <%}%>
        </div>   
    </div>

    <%  // if not login
        if (user == null) {
    %>
    <a href="<%=ConstValue.CONTEXT_PATH%>/Login" class="btn btn-info py-4 px-lg-5 d-none d-lg-block text-white">Join Now<i class="fa fa-arrow-right ms-3"></i></a>
        <%} else {%>
    <div class="nav-item dropdown">
        <a href="#" class="btn btn-info py-4 px-lg-5 text-white"><img src="<%=user.getImage()%>" alt="Avatar" class="avatar">  <%=user.getUsername()%></a>
        <div class="dropdown-menu fade-down m-0">
            <a href="<%=ConstValue.CONTEXT_PATH%>/Profile" class="dropdown-item">Profile</a>
            <a href="<%=ConstValue.CONTEXT_PATH%>/MyCourse" class="dropdown-item <%=d_none2%>">My Course</a>
            <a href="<%=ConstValue.CONTEXT_PATH%>/MyTeachingCourse" class="dropdown-item <%=d_none3%>">My Teaching Course</a>
            <a href="<%=ConstValue.CONTEXT_PATH%>/Logout" class="dropdown-item">Log Out <i class="bi bi-box-arrow-right"></i></a>
        </div>
    </div>
    <%}%>

</nav>