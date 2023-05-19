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
	                        <h1 class="h3 mb-0 text-gray-800"></h1>
                            <div>
	                          	<a href="#" class="btn btn-danger btn-sm btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-trash"></i>
                                    </span>
                                    <span class="text">시험 삭제</span>
                                </a>
                                
                                <a href="#" class="btn btn-info btn-sm btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-info-circle"></i>
                                    </span>
                                    <span class="text">시험 수정</span>
                                </a>
                                
		                        <a href="${pageContext.request.contextPath}/teacher/testList" class="btn btn-primary btn-icon-split btn-sm">
	                               <span class="icon text-white-50">
	                                   <i class="fas fa-arrow-right"></i>
	                               </span>
	                               <span class="text">시험 목록으로 돌아가기</span>
	                            </a>
                            </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xl-12">
	                            <div class="card shadow mb-4">
	                            	<div class="card-header py-3">
	                                    <div class="row">
	                            			<div class="col-xl-8">
		                                    	<h2 class="m-0 font-weight-bold text-primary">${test.testTitle}</h2>
		                                    </div>
	                            			<div class="col-xl-4 d-sm-flex justify-content-end">
			                                    <span>
			                                    	문제는 <mark>20번까지</mark> 등록 가능해요.
			                                    </span>
		                                    </div>
	                            		</div>
	                                </div>
		                            
	                                <div class="card-body">
	                                	<c:if test="${questionCount < 20}">
								            <div class=" border-0 p-4 mb-2 bg-gray-100 border-radius-lg">
												<div class=" d-flex flex-column">
											    	<strong>${questionCount +1}번</strong>
											    	<div>
						                      			<p class="text-primary" id="msg"></p>
				                      				</div>
											        <form id="questionForm" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
														<input type="hidden" name="testNo" value="${test.testNo}">
														<input type="hidden" class="questionIdx" name="questionIdx" value="${questionCount +1}" readonly="readonly">
														
														<!-- 문제제목 -->
														<div class="input-group input-group-dynamic mb-4 input-group-sm">
														    <input type="text" class="form-control" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1" name="questionTitle" id="questionTitle">
														</div>
														
														<div class="form-check input-group-sm input-group input-group-dynamic">
														    <!-- 1번 -->
														    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="1">
														    <span>&nbsp; &#10112; &nbsp;</span>
														    <input type="text" class="form-control" name="exampleContent" class="example" id="example1" placeholder="보기를 입력하세요">
															<input type="hidden" id="exampleIdx" name="exampleIdx" value="1">
														</div>
														<div class="form-check input-group-sm input-group input-group-dynamic">
														    <!-- 2번 -->
														    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="2">
														    <span>&nbsp; &#10113; &nbsp;</span>
														    <input type="text" class="form-control" name="exampleContent" class="example" id="example2" placeholder="보기를 입력하세요">
															<input type="hidden" id="exampleIdx" name="exampleIdx" value="2">
														</div>
														<div class="form-check input-group-sm input-group input-group-dynamic">
														    <!-- 3번 -->
														    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="3">
														    <span>&nbsp; &#10114; &nbsp;</span>
														    <input type="text" class="form-control" name="exampleContent" class="example" id="example3" placeholder="보기를 입력하세요">
															<input type="hidden" id="exampleIdx" name="exampleIdx" value="3">
														</div>
														<div class="form-check input-group-sm input-group input-group-dynamic mb-4">
														    <!-- 4번 -->
														    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="4">
														    <span>&nbsp; &#10115; &nbsp;</span>
														    <input type="text" class="form-control" name="exampleContent" class="example" id="example4" placeholder="보기를 입력하세요">
															<input type="hidden" id="exampleIdx" name="exampleIdx" value="4">
														</div>
														
														<a  class="btn btn-success btn-icon-split" id="questionBtn">
					                                        <span class="text">등록</span>
					                                    </a>
													</form>
												</div>
											</div>
										</c:if>
                                		<hr>
                                		
                                		<!-- question -->
							            <div class=" border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
											<div class=" d-flex flex-column" style="width: 100%;">
					            				<c:forEach var="t" items="${list}">
													<h6 class="mb-3 text-sm">
														<c:if test="${t.exampleIdx == 1}">
														
															<span style="font-weight: bold; font-color: black; font-size: 1.2rem;">
																${t.questionIdx}. ${t.questionTitle}
															</span>
														</c:if>
													</h6>
													<c:if test="${t.exampleIdx == 1}">
														<c:choose>
															<c:when test="${t.exampleAnswer eq '정답'}">
																<span style="font-weight: bold; color: red;">
																	&#10112; <span class="text-red" >${t.exampleContent}</span>
																</span>
															</c:when>
															<c:otherwise>
																<span>&#10112; <span class="ms-sm-2">${t.exampleContent}</span></span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${t.exampleIdx == 2}">
														<c:choose>
															<c:when test="${t.exampleAnswer eq '정답'}">
																<span style="font-weight: bold; color: red;">&#10113; <span class="text-red" >${t.exampleContent}</span></span>
															</c:when>
															<c:otherwise>
																<span>&#10113; <span class="ms-sm-2">${t.exampleContent}</span></span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${t.exampleIdx == 3}">
														<c:choose>
															<c:when test="${t.exampleAnswer eq '정답'}">
																<span style="font-weight: bold; color: red;">&#10114; <span class="text-red" >${t.exampleContent}</span></span>
															</c:when>
															<c:otherwise>
																<span>&#10114; <span class="ms-sm-2">${t.exampleContent}</span></span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${t.exampleIdx == 4}">
														<c:choose>
															<c:when test="${t.exampleAnswer eq '정답'}">
																<span style="color: red;">&#10115; <span class="text-red">${t.exampleContent}</span></span>
																<br>
																<div class="card border-left-info shadow h-100 py-2">
									                                <div class="card-body">
									                                    <div class="row no-gutters align-items-center">
									                                        <div class="col mr-2">
									                                            <div class="d-sm-flex align-items-center justify-content-between">
										                                            <div class="text-xs font-weight-bold text-info mb-1">
										                                            	정답률
										                                            </div>
										                                            <div class="text-xs font-weight-bold text-info mb-1">
											                                            <span>응시 인원 ${t.cnt }</span>
										                                            </div>
									                                        	</div>
									                                            <div class="row no-gutters align-items-center">
									                                                <div class="col-auto">
									                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${t.percen}%</div>
									                                                </div>
									                                                <div class="col">
									                                                    <div class="progress progress-sm mr-2">
									                                                        <div class="progress-bar bg-info" role="progressbar" style="width: ${t.percen}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
									                                                    </div>
									                                                </div>
									                                            </div>
									                                        </div>
									                                        <div class="col-auto">
									                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
									                                        </div>
									                                    </div>
									                                </div>
									                            </div>
									                            <br>
									                            <br>
															</c:when>
															<c:otherwise>
																<span>&#10115; <span class="ms-sm-2">${t.exampleContent}</span></span>
																<br>
																<div class="card border-left-info shadow h-100 py-2">
									                                <div class="card-body">
									                                    <div class="row no-gutters align-items-center">
									                                        <div class="col mr-2">
									                                        	<div class="d-sm-flex align-items-center justify-content-between">
										                                            <div class="text-xs font-weight-bold text-info mb-1">
										                                            	정답률
										                                            </div>
										                                            <div class="text-xs font-weight-bold text-info mb-1">
											                                            <span>응시 인원 ${t.cnt}</span>
										                                            </div>
									                                        	</div>
									                                            <div class="row no-gutters align-items-center">
									                                                <div class="col-auto">
									                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${t.percen}%</div>
									                                                </div>
									                                                <div class="col">
									                                                    <div class="progress progress-sm mr-2">
									                                                        <div class="progress-bar bg-info" role="progressbar" style="width: ${t.percen}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
									                                                    </div>
									                                                </div>
									                                            </div>
									                                        </div>
									                                        <div class="col-auto">
									                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
									                                        </div>
									                                    </div>
									                                </div>
								                            	</div>
								                            	<br>
								                            	<br>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</div>
										</div>
	                                	<!-- 문제 끝 -->
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
			$('#questionBtn').click(function() {
				// 제목 유효성 검사
				if($('#questionTitle').val() == '') {
					$('#msg').text('제목을 입력해주세요');
					$('#questionTitle').focus();
					return;
				} else {
					$('#msg').text('');
				}
				// 보기 유효성 검사
				if($('#example1').val() == ''){
					$('#msg').text('보기를 입력해주세요');
					$('#example1').focus();
				    return;
				} else {
					$('#msg').text('');
				}
				
				if($('#example2').val() == ''){
					$('#msg').text('보기를 입력해주세요');
					$('#example2').focus();
				    return;
				} else {
					$('#msg').text('');
				}
				
				if($('#example3').val() == ''){
					$('#msg').text('보기를 입력해주세요');
					$('#example3').focus();
				    return;
				} else {
					$('#msg').text('');
				}
				
				if($('#example4').val() == ''){
					$('#msg').text('보기를 입력해주세요');
					$('#example4').focus();
				    return;
				} else {
					$('#msg').text('');
				}
				
				// 정답 유효성 검사
				if($("input:radio[name=examplAnswer]:checked").length < 1){
					$('#msg').text('정답을 체크해주세요');
				    return;
				} else {
					$('#msg').text('');
				}
				
				$('#questionForm').submit();
			});
		</script>
	
	</body>
	
</html>