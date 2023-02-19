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
				$('#questionBtn').click(function() {
					
					
					$('#questionForm').submit();
				});
			});
		</script>
		
	</head>
	
	<body class="g-sidenav-show bg-gray-200">
		<!-- SideNav -->
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
	  	
	  	<div class="main-content position-relative max-height-vh-100 h-100">
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
		<div class="container-fluid py-4">
			<div class="row">
		        <div class="col">
					<div class="card">
						<div class="card-header pb-0 px-3">
							<h6 class="mb-0 px-3">${test.testTitle}</h6>
							<span class="mb-0 px-3 text-sm"><small>문제는 <mark>10번까지</mark> 등록 가능해요.</small></span>
							<br>
							<a class="btn btn-link text-danger text-gradient px-3 mb-0" href=""><i class="material-icons text-sm me-2">delete</i>Delete</a>
							<a class="btn btn-link text-dark px-3 mb-0" href=""><i class="material-icons text-sm me-2">edit</i>Edit</a>
						</div>
						
						<!-- 문제등록 -->
						<div class="card-body pt-4 p-3">
				            <div class=" border-0 p-4 mb-2 bg-gray-100 border-radius-lg">
								<div class=" d-flex flex-column">
									<c:if test="${questionCount < 10}">
								    	<strong>${questionCount +1}번</strong>
								    	
								        <form id="questionForm" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
											<input type="hidden" name="testNo" value="${test.testNo}">
											<input type="hidden" class="questionIdx" name="questionIdx" value="${questionCount +1}" readonly="readonly">
											
											<!-- 문제제목 -->
											<div class="input-group input-group-dynamic mb-4 input-group-sm">
											    <input type="text" class="form-control" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1" name="questionTitle">
											</div>
											
											<div class="form-check input-group-sm input-group input-group-dynamic">
											    <!-- 1번 -->
											    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="1">
											    <span>&nbsp; &#10112; &nbsp;</span>
											    <input type="text" class="form-control" name="exampleContent" class="example" placeholder="보기를 입력하세요">
												<input type="hidden" id="exampleIdx" name="exampleIdx" value="1">
											</div>
											<div class="form-check input-group-sm input-group input-group-dynamic">
											    <!-- 2번 -->
											    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="2">
											    <span>&nbsp; &#10113; &nbsp;</span>
											    <input type="text" class="form-control" name="exampleContent" class="example" placeholder="보기를 입력하세요">
												<input type="hidden" id="exampleIdx" name="exampleIdx" value="2">
											</div>
											<div class="form-check input-group-sm input-group input-group-dynamic">
											    <!-- 3번 -->
											    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="3">
											    <span>&nbsp; &#10114; &nbsp;</span>
											    <input type="text" class="form-control" name="exampleContent" class="example" placeholder="보기를 입력하세요">
												<input type="hidden" id="exampleIdx" name="exampleIdx" value="3">
											</div>
											<div class="form-check input-group-sm input-group input-group-dynamic mb-4">
											    <!-- 4번 -->
											    <input class="form-check-input" type="radio" name="examplAnswer" id="exampleAnswer" value="4">
											    <span>&nbsp; &#10115; &nbsp;</span>
											    <input type="text" class="form-control" name="exampleContent" class="example" placeholder="보기를 입력하세요">
												<input type="hidden" id="exampleIdx" name="exampleIdx" value="4">
											</div>
											<button type="button" class="btn btn-outline-secondary btn-sm" id="questionBtn">등록</button>
										</form>
									</c:if>
								</div>
							</div>
							
						<!-- question -->
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
		     <footer class="footer py-4  ">
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
			</div>
		</div>
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