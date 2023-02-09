<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		      <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
		        <img src="${pageContext.request.contextPath}/resources/dashboard/assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
		        <span class="ms-1 font-weight-bold text-white">Online Quiz</span>
		      </a>
		    </div>
		    <hr class="horizontal light mt-0 mb-2">
		    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
		      <ul class="navbar-nav">
		        <li class="nav-item">
		          <a class="nav-link text-white active bg-gradient-primary" href="${pageContext.request.contextPath}/resources/dashboard/pages/dashboard.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">dashboard</i>
		            </div>
		            <span class="nav-link-text ms-1">Dashboard</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/tables.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">table_view</i>
		            </div>
		            <span class="nav-link-text ms-1">Quiz</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/billing.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">receipt_long</i>
		            </div>
		            <span class="nav-link-text ms-1">Quiz</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/virtual-reality.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">view_in_ar</i>
		            </div>
		            <span class="nav-link-text ms-1">Virtual Reality</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/rtl.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">format_textdirection_r_to_l</i>
		            </div>
		            <span class="nav-link-text ms-1">RTL</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/notifications.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">notifications</i>
		            </div>
		            <span class="nav-link-text ms-1">Notifications</span>
		          </a>
		        </li>
		        
		        <li class="nav-item mt-3">
		          <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/profile.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">person</i>
		            </div>
		            <span class="nav-link-text ms-1">Profile</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/sign-in.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">login</i>
		            </div>
		            <span class="nav-link-text ms-1">Sign In</span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link text-white " href="../pages/sign-up.html">
		            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
		              <i class="material-icons opacity-10">assignment</i>
		            </div>
		            <span class="nav-link-text ms-1">Sign Up</span>
		          </a>
		        </li>
		      </ul>
		      
		    </div>
		  </aside>
	</body>