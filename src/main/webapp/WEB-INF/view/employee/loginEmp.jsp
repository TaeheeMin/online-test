<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>직</title>
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
				$('#loginBtn').click(function() {
					if($('#empId').val() == '') {
						$('#msg').text('아이디를 입력해주세요');
						$('#empId').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					if($('#empPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#empPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					$('#loginForm').submit();
				});
			});
		</script>
	</head>
	
	<body class="bg-gray-200">
		<!-- 메뉴 -->
		<div>
		</div>
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
		                    Main
		                  </a>
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
		    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
		      <span class="mask bg-gradient-dark opacity-6"></span>
		      <div class="container my-auto">
		        <div class="row">
		          <div class="col-lg-4 col-md-8 col-12 mx-auto">
		            <div class="card z-index-0 fadeIn3 fadeInBottom">
		              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
		                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
		                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign in</h4>
		                  <div class="row mt-3">
		                    <div class="col-2 text-center ms-auto">
		                      <a class="btn btn-link px-3" href="javascript:;">
		                        <i class="fa fa-facebook text-white text-lg"></i>
		                      </a>
		                    </div>
		                    <div class="col-2 text-center px-1">
		                      <a class="btn btn-link px-3" href="javascript:;">
		                        <i class="fa fa-github text-white text-lg"></i>
		                      </a>
		                    </div>
		                    <div class="col-2 text-center me-auto">
		                      <a class="btn btn-link px-3" href="javascript:;">
		                        <i class="fa fa-google text-white text-lg"></i>
		                      </a>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-body">
		                <form id="loginForm" role="form" class="text-start" method="post" action="${pageContext.request.contextPath}/loginEmp">
	                      <div>
		                      <p class="mt-4 text-sm text-center" id="msg" style="color: red;"></p>
	                      </div>
		                  <div class="input-group input-group-outline my-3">
		                    <input type="text" class="form-control" name="empId" id="empId" value="admin">
		                  </div>
		                  <div class="input-group input-group-outline mb-3">
		                    <input type="password" class="form-control" name="empPw" id="empPw" value="123">
		                  </div>
		                  <div class="form-check form-switch d-flex align-items-center mb-3">
		                    <input class="form-check-input" type="checkbox" id="rememberMe" checked>
		                    <label class="form-check-label mb-0 ms-3" for="rememberMe">Remember me</label>
		                  </div>
		                  <div class="text-center">
		                    <button type="button" class="btn bg-gradient-primary w-100 my-4 mb-2" id="loginBtn">Sign in</button>
		                  </div>
		                  <p class="mt-4 text-sm text-center">
		                    Don't have an account?
		                    <a href="" class="text-primary text-gradient font-weight-bold">Sign up</a>
		                  </p>
		                </form>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      
		      <footer class="footer position-absolute bottom-2 py-2 w-100">
		        <div class="container">
		          <div class="row align-items-center justify-content-lg-between">
		            <div class="col-12 col-md-6 my-auto">
		              <div class="copyright text-center text-sm text-white text-lg-start">
		                © <script>
		                  document.write(new Date().getFullYear())
		                </script>,
		                made with <i class="fa fa-heart" aria-hidden="true"></i> by
		                <a href="https://www.creative-tim.com" class="font-weight-bold text-white" target="_blank">Creative Tim</a>
		                for a better web.
		              </div>
		            </div>
		            <div class="col-12 col-md-6">
		              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com" class="nav-link text-white" target="_blank">Creative Tim</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-white" target="_blank">About Us</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/blog" class="nav-link text-white" target="_blank">Blog</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-white" target="_blank">License</a>
		                </li>
		              </ul>
		            </div>
		          </div>
		        </div>
		      </footer>
		    </div>
		  </main>
		  
	   	  <!--   Core JS Files   -->
		  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/popper.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/bootstrap.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
		  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
		  <script>
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