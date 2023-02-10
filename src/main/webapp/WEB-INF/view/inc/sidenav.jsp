<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/dashboard/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/dashboard/assets/img/favicon.png">
	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
	<!-- Nucleo Icons -->
	<link href="${pageContext.request.contextPath}/resources/dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
	<!-- Font Awesome Icons -->
	<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
	<!-- Material Icons -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
	<!-- CSS Files -->
	<link id="pagestyle" href="${pageContext.request.contextPath}/resources/dashboard/assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
</head>
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
	        
	        <!-- 강사 -->
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
	        
	        <!-- 직원 -->
	        <li class="nav-item mt-3">
	          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">admin pages</h6>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link text-white " href="">
	            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
	              <i class="material-icons opacity-10">dashboard</i>
	            </div>
	            <span class="nav-link-text ms-1">admin</span>
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
          
	      </ul>
	      
	    </div>
	  </aside>
</body>
