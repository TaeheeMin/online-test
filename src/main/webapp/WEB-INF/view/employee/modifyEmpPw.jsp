<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비민번호 변경</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
		<script>
			$(document).ready(function() {
				// 유효성검사
				$('#pwBtn').click(function() {
					console.log('클릭');
					if($('#oldPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#oldPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					if($('#newPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#newPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					$('#pwForm').submit();
				});
			});
		</script>
	</head>
	
	<body class="">
	  <div class="container position-sticky z-index-sticky top-0">
	    <div class="row">
	      <div class="col-12">
	        <!-- Navbar -->
	        <nav class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
	          <div class="container-fluid ps-2 pe-0">
	            <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="${pageContext.request.contextPath}/main">
	              Online Quiz
	            </a>
	            <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
	              <span class="navbar-toggler-icon mt-2">
	                <span class="navbar-toggler-bar bar1"></span>
	                <span class="navbar-toggler-bar bar2"></span>
	                <span class="navbar-toggler-bar bar3"></span>
	              </span>
	            </button>
	            <div class="collapse navbar-collapse" id="navigation">
	              <ul class="navbar-nav mx-auto">
	                <li class="nav-item">
	                  <a class="nav-link d-flex align-items-center me-2 active" aria-current="page" href="${pageContext.request.contextPath}/main">
	                    <i class="fa fa-chart-pie opacity-6 text-dark me-1"></i>
	                    Dashboard
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="">
	                    <i class="fa fa-user opacity-6 text-dark me-1"></i>
	                    Profile
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="">
	                    <i class="fas fa-user-circle opacity-6 text-dark me-1"></i>
	                    Sign Up
	                  </a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link me-2" href="">
	                    <i class="fas fa-key opacity-6 text-dark me-1"></i>
	                    Sign In
	                  </a>
	                </li>
	              </ul>
	              <ul class="navbar-nav d-lg-flex d-none">
	                <li class="nav-item d-flex align-items-center">
	                  <a class="btn btn-outline-primary btn-sm mb-0 me-2" target="_blank" href="">Online Builder</a>
	                </li>
	                <li class="nav-item">
	                  <a href="" class="btn btn-sm mb-0 me-1 bg-gradient-dark">Free download</a>
	                </li>
	              </ul>
	            </div>
	          </div>
	        </nav>
	        <!-- End Navbar -->
	      </div>
	    </div>
	  </div>
		
		<main class="main-content  mt-0">
		    <section>
		      <div class="page-header min-vh-100">
		        <div class="container">
		          <div class="row">
		            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
		              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style="background-image: url('${pageContext.request.contextPath}/resources/dashboard/assets/img/illustrations/illustration-signup.jpg'); background-size: cover;">
		              </div>
		            </div>
		            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
		              <div class="card card-plain">
		                <div class="card-header">
		                  <h4 class="font-weight-bolder">${loginEmp.empName}님</h4>
		                  <p class="mb-0">Enter your password</p>
		                </div>
		                
		                <div class="card-body">
		                  	<div>
		                      <p class="text-sm text-center text-primary" id="msg"></p>
	                      	</div>
		                  <form id="pwForm" role="form" method="post" action="${pageContext.request.contextPath}/employee/modifyEmpPw">
		                    <div class="input-group input-group-dynamic input-group-outline mb-3">
		                      <input type="password" class="form-control" name="oldPw" id="oldPw" placeholder="Password">
		                    </div>
		                    <div class="input-group input-group-dynamic input-group-outline mb-3">
		                      <input type="password" class="form-control" name="newPw" id="newPw" placeholder="New Password">
		                    </div>
		                    <div class="text-center">
		                      <button type="button" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" id="pwBtn">Submit</button>
		                    </div>
		                  </form>
		                </div>
		                <div class="card-footer text-center pt-0 px-lg-2 px-1">
		                  <p class="mb-2 text-sm mx-auto">
		                    Already have an account?
		                    <a href="" class="text-primary text-gradient font-weight-bold">Sign in</a>
		                  </p>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </section>
		  </main>
		
		<!--   Core JS Files   -->
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
		<script>c
			var win = navigator.platform.indexOf('Win') > -1;
			if (win && document.querySelector('#sidenav-scrollbar')) {
				  var options = {
				    damping: '0.5'
				  }
			  Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
			}
		</script>
		<!-- Github buttons -->
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/material-dashboard.min.js?v=3.0.4"></script>
	</body>
</html>