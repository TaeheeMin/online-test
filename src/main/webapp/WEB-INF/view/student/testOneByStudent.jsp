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
	                        <a href="${pageContext.request.contextPath}/student/testListByStudent" class="btn btn-primary btn-icon-split btn-sm">
                               <span class="icon text-white-50">
                                   <i class="fas fa-arrow-right"></i>
                               </span>
                               <span class="text">시험 목록으로 돌아가기</span>
                            </a>
	                    </div>
	                    <div class="row">
	                        <div class="col-xl-12">
	                            <div class="card shadow mb-4">
	                            	<div class="card-header py-3">
	                                    <div class="row">
	                            			<div class="col-xl-8">
		                                    	<h2 class="m-0 font-weight-bold text-primary">${test.testTitle}</h2>
		                                    </div>
	                            			<div class="col-xl-4">
			                                    <h5 class="d-sm-flex justify-content-end">${score}/${questionCount}개</h5>
		                                    </div>
	                            		</div>
	                                </div>
		                            
		                        	<!-- 시험 문제 -->
									<c:if test="${empty answer}">
		                                <div class="card-body">
		                                	<div>
												<form id="testForm" method="post" action="${pageContext.request.contextPath}/student/addPaper">
													<c:forEach var="t" items="${list}">
														<c:if test="${t.exampleIdx == 1}">
															<span style="font-weight: bold; font-color: black; font-size: 1.3rem;">
																${t.questionIdx}. ${t.questionTitle}
															</span>
															<input type="hidden" id="answer${t.questionIdx}" name="answer" value="">
															<input type="hidden" name="testNo" value="${t.testNo}">
															<input type="hidden" name="studentNo" value="${loginStudent.getStudentNo() }">
															<input type="hidden" name="questionNo" value="${t.questionNo}">
														</c:if>
														<br>
														<c:if test="${t.exampleIdx == 1}">
															<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="1">&#10112; ${t.exampleContent}
														</c:if>
														<c:if test="${t.exampleIdx == 2}">
															<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="2">&#10113; ${t.exampleContent}
														</c:if>
														<c:if test="${t.exampleIdx == 3}">
															<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="3">&#10114; ${t.exampleContent}
														</c:if>
														<c:if test="${t.exampleIdx == 4}">
															<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="4">&#10115; ${t.exampleContent}
															<br>
															<br>
														</c:if>
													</c:forEach>
													<div class="d-sm-flex justify-content-center mt-5">
														<a  class="btn btn-success btn-icon-split" id="testBtn">
					                                        <span class="text">제출하기</span>
					                                    </a>
													</div>
												</form>
											</div>
		                                </div>
									</c:if>
									
									<!-- 시험 결과 -->
									<c:if test="${answer != null}">
										<div class="card-body">
		                                	<div>
												<!-- 답 출력 -->
												<c:forEach var="a" items="${answer}">
													<c:if test="${a.exampleIdx == 1}">
														<c:choose>
															<c:when test="${a.answerCk eq '정답'}">
																<span style="font-weight: bold; font-color: black; font-size: 1.3rem;">
																	${a.questionIdx}. ${a.questionTitle}
																</span> 
																<span>나의 답 : <big style="color:blue;">${a.answer}</big></span>
															</c:when>
															<c:otherwise>
																<span style="font-weight: bold; color: red; font-size: 1.3rem;">
																	&#128204; ${a.questionIdx}. ${a.questionTitle} 
																</span>
																<span> 나의 답 : <span style="color:blue;">${a.answer}</span></span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<br>
													<c:if test="${a.exampleIdx == 1}">
														<c:choose>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
																<span style="font-weight: bold;">
																	&#10112; ${a.exampleContent}
																</span> 
															</c:when>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
																<span style="font-weight: bold; color: red;">
																	&#10112; ${a.exampleContent}
																</span>
															</c:when>
															<c:otherwise>
																<span>
																	&#10112; ${a.exampleContent}
																</span>
															</c:otherwise>
														</c:choose>
													</c:if>
													
													<c:if test="${a.exampleIdx == 2}">
														<c:choose>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
																<span style="font-weight: bold;">
																	&#10113; ${a.exampleContent}
																</span> 
															</c:when>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
																<span style="font-weight: bold; color: red;">
																	&#10113; ${a.exampleContent}
																</span>
															</c:when>
															<c:otherwise>
																<span>
																	&#10113; ${a.exampleContent}
																</span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${a.exampleIdx == 3}">
														<c:choose>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
																<span style="font-weight: bold;">
																	&#10114; ${a.exampleContent}
																</span> 
															</c:when>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
																<span style="font-weight: bold; color: red;">
																	&#10114; ${a.exampleContent}
																</span>
															</c:when>
															<c:otherwise>
																<span>
																	&#10114; ${a.exampleContent}
																</span>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${a.exampleIdx == 4}">
														<c:choose>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
																<span style="font-weight: bold;">
																	&#10115; ${a.exampleContent}
																</span> 
															</c:when>
															<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
																<span style="font-weight: bold; color: red;">
																	&#10115; ${a.exampleContent}
																</span>
															</c:when>
															<c:otherwise>
																<span>
																	&#10115; ${a.exampleContent}
																</span>
															</c:otherwise>
														</c:choose>
														<br>
														<br>
													</c:if>
												</c:forEach>
											</div>
		                                </div>
									</c:if>
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
		
	    <c:forEach var="t" items="${list}">
			<c:if test="${t.exampleIdx == 1}">
				<script>
					$('#testBtn').click(function() {
						if($('input:radio[id=exampleAnswer${t.questionIdx}]:checked').val() == '') {
							console.log($('input:radio[id=exampleAnswer${t.questionIdx}]:checked').val())
							alert('문제를 모두 풀어주세요');
							return;
						} else {
							if($('input:radio[id=exampleAnswer${t.questionIdx}]').is(':checked')) { // 답 선택->체크 true
								let answer = $('input:radio[id=exampleAnswer${t.questionIdx}]:checked').val(); // 체크된 보기번호 저장
								$('#answer${t.questionIdx}').val(answer); // 히든값에 넣어줌
							}
							$('#testForm').submit();
						}
					});
				</script>
			</c:if>
		</c:forEach>
	
	</body>
</html>