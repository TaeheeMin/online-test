<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm">
            	<a class="opacity-5 text-dark" href="">
            		<c:choose>
            			<c:when test="${loginEmp != null}">
            				Employee
            			</c:when>
            			<c:when test="${loginTeacher != null}">
            				Teacher
            			</c:when>
            			<c:when test="${loginStudent != null}">
            				Student
            			</c:when>
            			<c:otherwise>
            				Main
            			</c:otherwise>
            		</c:choose>
            	</a>
            </li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
            	<c:choose>
           			<c:when test="${loginEmp != null}">
           				${loginEmp.empName}
           			</c:when>
           			<c:when test="${loginTeacher != null}">
           				${loginTeacher.teacherName}
           			</c:when>
           			<c:when test="${loginStudent != null}">
           				${loginStudent.studentName}
           			</c:when>
           			<c:otherwise>
           				Dashboard
           			</c:otherwise>
           		</c:choose>
            </li>
          </ol>
          <h6 class="font-weight-bolder mb-0">Dashboard</h6>
        </nav>
          <ul class="navbar-nav  justify-content-end">
            <c:if test="${loginStudent != null || loginStudent != null || loginEmp != null}">
	          	<li class="nav-item px-1 d-flex align-items-center">
					<a class="btn btn-outline-primary btn-sm mb-0 me-3" href="${pageContext.request.contextPath}/logout">Logout</a>
				</li>
            </c:if>
            <c:if test="${loginStudent == null && loginStudent == null && loginEmp == null}">
            	<li class="nav-item px-1 d-flex align-items-center">
	              <a href="${pageContext.request.contextPath}/loginEmp" class="nav-link text-body font-weight-bold px-0">
	                <i class="fa fa-user me-sm-1"></i>
	                <span class="d-sm-inline d-none">Employee</span>
	              </a>
	            </li>
	            <li class="nav-item px-1 d-flex align-items-center">
	              <a href="${pageContext.request.contextPath}/loginTeacher" class="nav-link text-body font-weight-bold px-0">
	                <i class="fa fa-user me-sm-1"></i>
	                <span class="d-sm-inline d-none">Teacher</span>
	              </a>
	            </li>
	            <li class="nav-item px-1 d-flex align-items-center">
	              <a href="${pageContext.request.contextPath}/loginStudent" class="nav-link text-body font-weight-bold px-0">
	                <i class="fa fa-user me-sm-1"></i>
	                <span class="d-sm-inline d-none">Student</span>
	              </a>
	            </li>
            </c:if>
          </ul>
        </div>
    </nav>
    <!-- End Navbar -->
	<!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/chartjs.min.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/material-dashboard.min.js?v=3.0.4"></script>
