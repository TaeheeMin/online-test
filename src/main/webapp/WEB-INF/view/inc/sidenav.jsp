<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<body>
	<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
	    <div class="sidenav-header">
	      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
	      <a class="navbar-brand m-0" href=" ${pageContext.request.contextPath}/main " >
	        <img src="${pageContext.request.contextPath}/resources/dashboard/assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
	        <span class="ms-1 font-weight-bold text-white">Online Quiz</span>
	      </a>
	    </div>
	    <hr class="horizontal light mt-0 mb-2">
	    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
	      <ul class="navbar-nav">
           	<li class="nav-item">
	          <a class="nav-link text-white active bg-gradient-primary" href="${pageContext.request.contextPath}/main">
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">home</i>
	            </div>
	            <span class="nav-link-text ms-1">Dashboard</span>
	          </a>
	        </li>
	        
	        
          	<!-- 학생 -->
	        <c:choose>
       			<c:when test="${loginStudent != null}">
			        <li class="nav-item mt-3">
			          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Student pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/student/testListByStudent">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">assignment</i>
			            </div>
			            <span class="nav-link-text ms-1">Quiz</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/student/modifyStudentPw">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">person</i>
			            </div>
			            <span class="nav-link-text ms-1">Profile</span>
			          </a>
			        </li>
       			</c:when>
       			<c:when test="${loginStudent == null}">
			        <li class="nav-item mt-3">
			          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Teacher pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/student/testListByStudent">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">assignment</i>
			            </div>
			            <span class="nav-link-text ms-1">Quiz</span>
			          </a>
			        </li>
     			</c:when>
          </c:choose>
	      
	        <!-- 강사 -->
	        <c:choose>
       			<c:when test="${loginTeacher != null}">
			        <li class="nav-item mt-3">
			          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Teacher pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/teacher/testList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">assignment</i>
			            </div>
			            <span class="nav-link-text ms-1">Quiz</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">person</i>
			            </div>
			            <span class="nav-link-text ms-1">Profile</span>
			          </a>
			        </li>
       			</c:when>
       			<c:when test="${loginTeacher == null}">
			        <li class="nav-item mt-3">
			          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Teacher pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/teacher/testList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">assignment</i>
			            </div>
			            <span class="nav-link-text ms-1">Quiz</span>
			          </a>
			        </li>
     			</c:when>
          </c:choose>
	        
          	<!-- 직원 -->
	        <c:choose>
       			<c:when test="${loginEmp != null}">
        			<li class="nav-item mt-3">
				          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">admin pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/employee/empList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">dashboard</i>
			            </div>
			            <span class="nav-link-text ms-1">Employee</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/employee/teacherList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">dashboard</i>
			            </div>
			            <span class="nav-link-text ms-1">Teacher</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/employee/studentList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">dashboard</i>
			            </div>
			            <span class="nav-link-text ms-1">Student</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/employee/modifyEmpPw">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">person</i>
			            </div>
			            <span class="nav-link-text ms-1">Profile</span>
			          </a>
			        </li>
       			</c:when>
       			<c:when test="${loginEmp == null}">
	       			<li class="nav-item mt-3">
				          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">admin pages</h6>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link text-white " href="${pageContext.request.contextPath}/employee/empList">
			            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			              <i class="material-icons opacity-10">dashboard</i>
			            </div>
			            <span class="nav-link-text ms-1">admin</span>
			          </a>
			        </li>
     			</c:when>
          </c:choose>
	      </ul>
	    </div>
	  </aside>
</body>
