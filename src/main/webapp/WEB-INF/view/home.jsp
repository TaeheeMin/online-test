<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>GOODEE Quiz | 똑똑한 공부습관 구디아카데미</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <!-- Custom fonts for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.css" rel="stylesheet">
		<style type="text/css">
			@font-face {
			    font-family: 'LOTTERIACHAB';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
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
		</style>
	</head>
		
	
	<body id="page-top">
	
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content" style="height: 100vh;">
	                <!-- Begin Page Content -->
	                <div class="container-fluid">
	
	                    <!-- Page Heading -->
	                    <div class="text-center" style="padding-top: 150px;">
	                        <p class="lead text-gray-800">똑똑한 공부습관</p>
	                        <div class="logo">구디 아카데미</div>
							<div class="row">
			                    <div class="col-lg-4"></div>
			                    
			                    <div class="col-lg-4" style="">
			                        <div class="p-5">
			                            <hr>
			                                <a href="${pageContext.request.contextPath}/loginStudent" class="btn btn-primary btn-user btn-block">
			                                    학생
			                                </a>
			                                <a href="${pageContext.request.contextPath}/loginTeacher" class="btn btn-facebook btn-user btn-block">
			                                    선생님
			                                </a>
			                                <a href="${pageContext.request.contextPath}/loginEmp" class="btn btn-facebook btn-user btn-block">
			                                    직원
			                                </a>
			                        </div>
			                    </div>
			                    <div class="col-lg-4"></div>
			                </div>
	                    </div>
	                  </div>
	
	                <!-- /.container-fluid -->
					
	            </div>
	            <!-- End of Main Content -->
	        </div>
	        <!-- End of Content Wrapper -->
	
	    </div>
	    <!-- End of Page Wrapper -->
	
	    <!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	        <i class="fas fa-angle-up"></i>
	    </a>
	
	    <!-- Logout Modal-->
	    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">Logout</a>
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

