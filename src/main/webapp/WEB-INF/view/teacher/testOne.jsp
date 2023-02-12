<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
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
				$('#questionCount').change(function() {
					$('#questionCountForm').submit();   
				});
				$('#questionBtn').click(function() {
					let example = document.querySelectorAll('.example');
					console.log(example)
					$('#questionForm').submit();
				});
			});
		</script>
		
	</head>
	
	<body class="g-sidenav-show  bg-gray-200">
		<!-- SideNav -->
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
	  	
	  	<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
			<!-- Navbar -->
			<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
			
			<div class="container-fluid py-4">
				<div class="row">
			        <div class="col">
						<div class="card">
							<div class="card-header pb-0 px-3">
								<h6 class="mb-0 px-3">${test.testTitle}</h6>
								<a class="btn btn-link text-danger text-gradient px-3 mb-0" href="javascript:;"><i class="material-icons text-sm me-2">delete</i>Delete</a>
								<a class="btn btn-link text-dark px-3 mb-0" href="javascript:;"><i class="material-icons text-sm me-2">edit</i>Edit</a>
							</div>
							<c:if test="${questionCount < 10}">
							    	${questionCount +1}번
							        <form id="questionForm" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
										<input type="hidden" name="testNo" value="${test.testNo}">
										<!-- 문제등록 -->
										<input type="hidden" class="questionIdx" name="questionIdx" value="${questionCount +1}" readonly="readonly">
										<input type="text" class="questionTitle" name="questionTitle" placeholder="문제를 입력하세요">
										<!-- 보기등록 -->
										<br>
										<input type="radio" id="exampleAnswer" name="examplAnswer" value="1">&#10112;
										<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
										<input type="hidden" id="exampleIdx" name="exampleIdx" value="1" readonly="readonly">
										<br>
										<input type="radio" id="exampleAnswer" name="examplAnswer" value="2">&#10113; 
										<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
										<input type="hidden" id="exampleIdx" name="exampleIdx" value="2" readonly="readonly">
										<br>
										<input type="radio" id="exampleAnswer" name="examplAnswer" value="3">&#10114;
										<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
										<input type="hidden" id="exampleIdx" name="exampleIdx" value="3" readonly="readonly">
										<br>
										<input type="radio" id="exampleAnswer" name="examplAnswer" value="4">&#10115; 
										<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
										<input type="hidden" id="exampleIdx" name="exampleIdx" value="4" readonly="readonly">
										<br>
										<br>
										<button type="button" id="questionBtn">등록</button>
									</form>
							</c:if>
							
							<!-- question -->
				            <div class="card-body pt-4 p-3">
					            <div class=" border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
									<div class=" d-flex flex-column">
			            				<c:forEach var="t" items="${list}">
											<h6 class="mb-3 text-sm">
												<c:if test="${t.exampleIdx == 1}">
														${t.questionIdx}. ${t.questionTitle}
												</c:if>
											</h6>
											<c:if test="${t.exampleIdx == 1}">
												<c:choose>
													<c:when test="${t.exampleAnswer eq '정답'}">
														<span class="mb-2 text-xs" style="font-weight: bold; color: red;">&#10112; <span class="text-red font-weight-bold ms-sm-2" >${t.exampleContent}</span></span>
													</c:when>
													<c:otherwise>
														<span class="mb-2 text-xs">&#10112; <span class="ms-sm-2">${t.exampleContent}</span></span>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${t.exampleIdx == 2}">
												<c:choose>
													<c:when test="${t.exampleAnswer eq '정답'}">
														<span class="mb-2 text-xs" style="font-weight: bold; color: red;">&#10113; <span class="text-red font-weight-bold ms-sm-2" >${t.exampleContent}</span></span>
													</c:when>
													<c:otherwise>
														<span class="mb-2 text-xs">&#10113; <span class="ms-sm-2">${t.exampleContent}</span></span>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${t.exampleIdx == 3}">
												<c:choose>
													<c:when test="${t.exampleAnswer eq '정답'}">
														<span class="mb-2 text-xs" style="font-weight: bold; color: red;">&#10114; <span class="text-red font-weight-bold ms-sm-2" >${t.exampleContent}</span></span>
													</c:when>
													<c:otherwise>
														<span class="mb-2 text-xs">&#10114; <span class="ms-sm-2">${t.exampleContent}</span></span>
													</c:otherwise>
												</c:choose>
											</c:if>
											<c:if test="${t.exampleIdx == 4}">
												<c:choose>
													<c:when test="${t.exampleAnswer eq '정답'}">
														<span class="text-xs" style="font-weight: bold; color: red;">&#10115; <span class="text-red ms-sm-2 font-weight-bold">${t.exampleContent}</span></span>
														<br>
													</c:when>
													<c:otherwise>
														<span class="text-xs">&#10115; <span class="ms-sm-2">${t.exampleContent}</span></span>
														<br>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</div>
								</div>
			            	</div>
			            </div>
			        </div>
			    </div>
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