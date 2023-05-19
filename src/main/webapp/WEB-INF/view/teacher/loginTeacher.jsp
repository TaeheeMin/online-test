<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
		<title>GOODEE Quiz | 똑똑한 공부습관 구디아카데미</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    
	    <!-- Custom fonts for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.min.css" rel="stylesheet">
		<style type="text/css">
			@font-face {
			    font-family: 'LOTTERIACHAB';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
			    font-family: 'KCCChassam';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
			.logo{
				color: #4e73df;
				font-size: 7rem;
				position: relative;
				line-height: 1;
				font-family: 'LOTTERIACHAB';
				/* width:12.5rem; */
			}
			.lead, .p-5{
				font-family: 'KCCChassam';
			}
		</style>
		<script>
			$(document).ready(function() {
				// 유효성검사
				$('#loginBtn').click(function() {
					if($('#teacherId').val() == '') {
						$('#msg').text('아이디를 입력해주세요');
						$('#teacherId').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					if($('#teacherPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#teacherPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					$('#loginForm').submit();
				});
			});
		</script>
	</head>
	
	<body style="background-color: #f8f9fcf">
	
	    <div class="container">
	
	        <!-- Outer Row -->
	        <div class="row justify-content-center">
	
	            <div class="col-xl-10 col-lg-12 col-md-9">
	
	                <div class="card o-hidden border-0 shadow-lg my-5">
	                    <div class="card-body p-0">
	                        <!-- Nested Row within Card Body -->
	                        <div class="row">
	                           	<img  class="col-lg-6 d-none d-lg-block" style="background-position: center; background-size: cover;" alt="" src="${pageContext.request.contextPath}/resources/assets/img/main.jpg" >
	                            <div class="col-lg-6">
	                                <div class="p-5">
	                                    <div class="text-center">
	                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
	                                        <p>선생님 로그인</p>
	                                    </div>
	                                    <form class="user" id="loginForm" method="post" action="${pageContext.request.contextPath}/loginTeacher">
					                      <div>
						                      <p class="mt-4 text-sm text-center" id="msg" style="color: red;"></p>
					                      </div>
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"  name="teacherId" id="teacherId" placeholder="ID" value="t1">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user" name="teacherPw" id="teacherPw" placeholder="Password" value="123">
	                                        </div>
	                                        <button type="button" class="btn btn-primary btn-user btn-block" id="loginBtn">
	                                            Login
	                                        </button>
	                                        <div class="text-center mt-3">
	                                        	<a href="${pageContext.request.contextPath}/home" style="text-decoration: none;">
		                                        	<i class="fas fa-fw fa-home"></i> HOME
		                                    	</a>
	                                        </div>
	                                    </form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
	
	        </div>
	
	    </div>
		     <!-- Bootstrap core JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets//vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="${pageContext.request.contextPath}/resources/assets//js/sb-admin-2.min.js"></script>
	
	</body>

</html>