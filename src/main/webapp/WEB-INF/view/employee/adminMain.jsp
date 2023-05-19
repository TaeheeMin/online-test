<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Test List</title>
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
				$('#empBtn').click(function(){
					$('#category').val("employee");
					$('#listForm').submit();
				});
				$('#teacherBtn').click(function(){
					$('#category').val("teacher");
					$('#listForm').submit();
				});
				$('#studentBtn').click(function(){
					$('#category').val("student");
					$('#listForm').submit();
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
			        <div class="col-12">
			        	<div class="col-md-12 mb-lg-0 mb-4">
			              <div class="card my-4">
			                <div class="card-body p-3">
						        <div class="row gx-4 mb-2">
						          <div class="col-auto my-auto">
						            <div class="h-100">
						              <h5 class="mb-1">
						                ${loginEmp.empName}님
						              </h5>
						              <p class="mb-0 font-weight-normal text-sm">
						                Employee / ${loginEmp.empId}
						              </p>
						            </div>
						          </div>
						          <div class="col-lg-4 col-md-6 my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3">
						            <div class="nav-wrapper position-relative end-0">
							            <form method="get" action="${pageContext.request.contextPath}/employee/adminMain" id="listForm">
							            	<input type="hidden" name="category" id="category" value="">
							              <ul class="nav nav-pills nav-fill p-1" role="tablist">
							                <li class="nav-item">
							                  <a class="nav-link mb-0 px-0 py-1 active " data-bs-toggle="tab" href="${pageContext.request.contextPath}/employee/empList" role="tab" aria-selected="true" id="empBtn">
							                    <i class="fas fa-user-edit text-secondary text-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Employee"></i>
							                    <span class="ms-1">Employee</span>
							                  </a>
							                </li>
							                <li class="nav-item">
							                  <a class="nav-link mb-0 px-0 py-1 " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="false" id="teacherBtn">
							                    <i class="fas fa-user-edit text-secondary text-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Teacher"></i>
							                    <span class="ms-1">Teacher</span>
							                  </a>
							                </li>
							                <li class="nav-item">
							                  <a class="nav-link mb-0 px-0 py-1 " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="false" id="studentBtn">
							                    <i class="fas fa-user-edit text-secondary text-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Student"></i>
							                    <span class="ms-1">Student</span>
							                  </a>
							                </li>
							              </ul>
							            </form>
						            </div>
						          </div>
						        </div>
						        <div class="row">
						          	<form method="get" action="${pageContext.request.contextPath}/employee/adminMain">
										<select name="rowPerPage">
											<option value="10">10
											<option value="20">20
											<option value="30">30
										</select>
										<input name="word" placeholder="사원 이름 검색" value="${word}">
										<button type="submit">검색</button>
									</form>
									<table border="1">
										<tr>
											<td>아이디</td>
											<td>이름</td>
											<td>삭제</td>
										</tr>
										<c:forEach var="e" items="${list}">
											<tr>
												<td>${e.empId}</td>
												<td>${e.empName}</td>
												<td>
													<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">삭제</a>
												</td>
											</tr>
									 	</c:forEach>
									</table>
									
									<!-- 페이징 -->
									<div>
										<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&word=${word}">HOME</a>
										<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&word=${word}">&#128072;</a>
										<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
											<span>
												<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&word=${word}">${i}</a>
											</span>
										</c:forEach>
										<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&word=${word}">&#128073;</a>
										<a href="${pageContext.request.contextPath}/employee/empList?rowPerPage=${rowPerPage}&currentPage=${lastPage}">END</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
			        <div>
			        	간단 통계자료? 강사수, 직원수, 학생수, 시험 개수, 문제개수 같은거?
			        </div>
			        <div>
			        	<a href="${pageContext.request.contextPath}/employee/empList">
			        		사원관리
			        	</a>
			        </div>
			        <div>
			        	<a href="${pageContext.request.contextPath}/employee/teacherList">
			        		강사관리
			        	</a>
			        </div>
			        <div>
			        	<a href="${pageContext.request.contextPath}/employee/studentList">
			        		학생관리
			        	</a>
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
		  </div>
		</div>
		<!--   Core JS Files   -->
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/core/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
		<!-- Github buttons -->
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
		<script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/material-dashboard.min.js?v=3.0.4"></script>
	</body>
</html>