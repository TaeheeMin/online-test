
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
	    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.css" rel="stylesheet">
	    
		<!-- fullcalender -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>
		
		<!-- icon -->
		<script src="https://kit.fontawesome.com/ce71be7920.js" crossorigin="anonymous"></script>
	</head>
	<body id="page-top">
	
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	        <!-- Sidebar -->
			<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
	
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
					<!-- Navbar -->
					<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
	
	                <!-- Begin Page Content -->
	                <div class="container-fluid">
						
	                    <!-- Page Heading -->
	                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
	                        <h1 class="h3 mb-0 text-gray-800">비밀번호 변경</h1>
	                    </div>
	                    <div class="row">
		                    <div class="col-lg-4">
		                     <div class="card shadow mb-4">
		                     	 <!-- Card Body -->
								<div class="card-body pt-3">
					              <div class="tab-content pt-2">
									<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
		             				  <img class="rounded-circle mb-5" src="${pageContext.request.contextPath}/resources/assets/img/undraw_profile.svg" style="width: 300px;">
						              <h2>${loginEmp.empName}님</h2>
						              <div class="social-links mt-2">
						              	직원
						              </div>
						            </div>
					              </div><!-- End Bordered Tabs -->
								</div>
				              </div>
		                    </div>
							<div class="col-lg-8">
	                            <div class="card shadow mb-4">
                                <!-- Card Body -->
								<div class="card-body pt-3">
					              <div class="tab-content pt-2">
					
					                <div class="tab-pane fade profile-overview active show" id="profile-overview" role="tabpanel">
					                <!-- Change Password Form -->
					                  <form id="pwForm" method="post" action="${pageContext.request.contextPath}/employee/modifyEmpPw">
											<div>
						                      <p class="text-sm text-center text-primary" id="mssage"></p>
					                      	</div>
					                    <div class="row mb-3">
					                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
					                      <div class="col-md-8 col-lg-9">
					                        <input type="password" class="form-control" name="oldPw" id="oldPw" placeholder="Password">
					                      </div>
					                    </div>
					
					                    <div class="row mb-3">
					                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
					                      <div class="col-md-8 col-lg-9">
					                        <input type="password" class="form-control" id="newPw1" placeholder="Password">
					                      </div>
					                    </div>
					
					                    <div class="row mb-3">
					                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
					                      <div class="col-md-8 col-lg-9">
					                        <input type="password" class="form-control" name="newPw" id="newPw2" placeholder="New Password">
					                      </div>
					                    </div>
					
					                    <div class="text-center">
					                      <button type="button" class="btn btn-primary" id="pwBtn">변경</button>
					                    </div>
					                  </form><!-- End Change Password Form -->
					
					                </div>
					              </div><!-- End Bordered Tabs -->
					            </div>
                            </div>
						</div>
                    </div>
                </div>
                <!-- /.container-fluid -->
	
	            </div>
	            <!-- End of Main Content -->
	
	            <!-- Footer -->
	            <footer class="sticky-footer bg-white">
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                        <span>Copyright &copy; Your Website 2023</span>
	                    </div>
	                </div>
	            </footer>
	            <!-- End of Footer -->
	
	        </div>
	        <!-- End of Content Wrapper -->
	
	    </div>
	    <!-- End of Page Wrapper -->
	
	    <!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	        <i class="fas fa-angle-up"></i>
	    </a>
	   	  
	    <!-- Bootstrap core JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets//vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="${pageContext.request.contextPath}/resources/assets//js/sb-admin-2.min.js"></script>
	    <script>
			// 유효성검사
			$('#pwBtn').click(function() {
				if($('#oldPw').val() == '') {
					$('#mssage').text('비밀번호를 입력해주세요');
					$('#oldPw').focus();
					return;
				} else {
					$('#msg').text('');
				}
				
				if($('#newPw1').val() == '' || $('#newPw2').val() == '') {
					$('#mssage').text('비밀번호를 입력해주세요');
					$('#newPw1').focus();
					return;
				} else {
					$('#mssage').text('');
				}
				if($('#newPw1').val() != $('#newPw2').val()) {
					$('#mssage').text('비밀번호를 동일하게 입력해주세요');
					$('#newPw1').focus();
					return;
				} else {
					$('#mssage').text('');
				}
				
				$('#pwForm').submit();
			});
		</script>
	</body>
</html>