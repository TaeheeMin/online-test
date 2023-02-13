<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
		<c:forEach var="t" items="${list}">
			<c:if test="${t.exampleIdx == 1}">
				<script>
					$(document).ready(function(){
						$('#testBtn').click(function() {
							if($('input:radio[id=exampleAnswer${t.questionIdx}]').is(':checked')) { // 답 선택->체크 true
								let answer = $('input:radio[id=exampleAnswer${t.questionIdx}]:checked').val(); // 체크된 보기번호 저장
								$('#answer${t.questionIdx}').val(answer); // 히든값에 넣어줌
							}
							$('#testForm').submit();
						});
					});
				</script>
			</c:if>
		</c:forEach>
	</head>
	<body class="g-sidenav-show  bg-gray-200">
	  	<!-- SideNav -->
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
	  	
	  	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
		
		<div class="container-fluid px-2 px-md-4">
	      <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
	        <span class="mask  bg-gradient-primary  opacity-6"></span>
	      </div>
	      <div class="card card-body mx-3 mx-md-4 mt-n6">
	        <div class="row gx-4 mb-2">
	          <div class="col-auto">
	            <div class="avatar avatar-xl position-relative">
	              <img src="${pageContext.request.contextPath}/resources/dashboard/assets/img/bruce-mars.jpg" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
	            </div>
	          </div>
	          <div class="col-auto my-auto">
	            <div class="h-100">
	              <h5 class="mb-1">
	                ${loginStudent.studentName}님
	              </h5>
	              <p class="mb-0 font-weight-normal text-sm">
	                CEO / Co-Founder
	              </p>
	            </div>
	          </div>
	        </div>
			<!-- 문제 상세보기 -->
			<div>
				<c:if test="${empty answer}">
					<h6>${test.testTitle} 상세보기</h6>
					<form id="testForm" method="post" action="${pageContext.request.contextPath}/student/addPaper">
						<c:forEach var="t" items="${list}">
							<c:if test="${t.exampleIdx == 1}">
								${t.questionIdx}. ${t.questionTitle}
								<input type="hidden" id="answer${t.questionIdx}" name="answer" value="">
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
						<button id="testBtn">제출</button>
					</form>
				</c:if>
			</div>
			
			<hr>
			
			<!-- 시험결과 -->
			<c:if test="${answer != null}">
				<div>
					<h6>${test.testTitle} 결과보기</h6>
					<h6>${score}/${questionCount}개</h6>
					<!-- 답 출력 -->
					<c:forEach var="a" items="${answer}">
						<c:if test="${a.exampleIdx == 1}">
							<c:choose>
								<c:when test="${a.answerCk eq '정답'}">
									<span>
										${a.questionIdx}. ${a.questionTitle} &#11093;
									</span> 
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: red;">
										&#128204; ${a.questionIdx}. ${a.questionTitle} 
									</span>
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
								<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
									<span style="font-weight: bold; color: blue;">
										&#10112; ${a.exampleContent} 오답
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
								<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
									<span style="font-weight: bold; color: blue;">
										&#10113; ${a.exampleContent} 오답
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
								<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
									<span style="font-weight: bold; color: blue;">
										&#10114; ${a.exampleContent} 오답
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
								<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
									<span style="font-weight: bold; color: blue;">
										&#10115; ${a.exampleContent} 오답
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
			</c:if>
		</div>
	</div>
		
		<footer class="footer py-4">
		        <div class="container-fluid">
		          <div class="row align-items-center justify-content-lg-between">
		            <div class="col-lg-6 mb-lg-0 mb-4">
		              <div class="copyright text-center text-sm text-muted text-lg-start">
		                © <script>
		                  document.write(new Date().getFullYear())
		                </script>,
		                made with <i class="fa fa-heart"></i> by
		                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
		                for a better web.
		              </div>
		            </div>
		            <div class="col-lg-6">
		              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
		                </li>
		                <li class="nav-item">
		                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
		                </li>
		              </ul>
		            </div>
		          </div>
		        </div>
		      </footer>
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