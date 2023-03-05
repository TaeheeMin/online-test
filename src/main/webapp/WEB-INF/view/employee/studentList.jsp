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
				$('#addBtn').click(function() {
					// 유효성 검사
					if($('#id').val() == '') {
						$('#msg').text('ID 입력 해주세요');
						$('#id').focus();
						return;
					} else {
						$('#msg').text('');
					}
					if($('#studentId').val() == '') {
						$('#msg').text('ID 중복 체크 해주세요');
						$('#studentId').focus();
						return;
					} else {
						$('#msg').text('');
					}
					
					if($('#studentPw').val() == '') {
						$('#msg').text('비밀번호를 입력해주세요');
						$('#studentPw').focus();
						return;
					} else {
						$('#msg').text('');
					}
					if($('#studentName').val() == '') {
						$('#msg').text('이름을 입력해주세요');
						$('#studentName').focus();
						return;
					} else {
						$('#msg').text('');
					}
					$('#addForm').submit();
					alert('학생 등록 완료');
				});
				$('#search').click(function() {
					$('#serachForm').submit();
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
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">Employee list</h6>
					              </div>
					            </div>
				                <div class="card-body p-3">
				                  <div class="row">
				                    <div class="col-md-3 mb-md-0 mb-4 ">
				                      <div class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row">
				                      	<form method="post" action="${pageContext.request.contextPath}/employee/addStudent" id="addForm">
					                      	<h6>학생등록</h6>
				                      		<div>
				                      			<p class="text-sm text-center text-primary" id="msg"></p>
		                      				</div>
											<div class="input-group input-group-static my-3">
										      <label>ID</label>
		  									  <input type="text" class="form-control" name="id" id="id" placeholder="ID를 입력해주세요">
		  									  <input type="text" class="form-control" name="studentId" id="studentId" readonly="readonly" placeholder="ID CHECK CLICK">
		  									  
										      <label>PASSWORD</label>
										      <input type="password" class="form-control" name="studentPw" id="studentPw">
										      
										      <label>NAME</label>
										      <input type="text" class="form-control" name="studentName" id="studentName">
										    </div>
										    <div class="text-end">
			                      				<a class="btn bg-gradient-dark mb-0 mt-3 px-3 mx-3" id="idck">ID CHECK</a>
			                      				<a class="btn bg-gradient-dark mb-0 mt-3 px-3 mx-3" id="addBtn"><i class="material-icons text-sm">add</i>&nbsp;&nbsp;Add New Student</a>
			                   				 </div>
										</form>
				                      </div>
				                    </div>
				                    <div class="text-end">
				                    <form method="get" action="${pageContext.request.contextPath}/employee/studentList" id="serachForm">
										<select name="rowPerPage" id="rowPerPage">
											<option value="10">10
											<option value="20">20
											<option value="30">30
										</select>
										<input name="word" id="word" placeholder="학생 이름 검색" value="${word}">
										<a class="btn bg-gradient-dark mb-0 mt-3 px-3 mx-3" id="search">검색</a>
									</form>
									</div>
									
				                    <div class="card-body px-0 pb-2 pt-2">
						              <div class="table-responsive p-0">
						                <table class="table align-items-center justify-content-center mb-0">
						                  <thead>
						                    <tr>
						                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">ID</th>
						                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 align-middle text-center">NAME</th>
						                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">Delete</th>
						                    </tr>
						                  </thead>
						                  <tbody>
							                  <c:forEach var="s" items="${list}">
							                    <tr>
							                      <td>
							                        <div class="d-flex px-2">
							                          <div class="my-auto">
							                            <h6 class="mb-0 text-sm">${s.studentId}</h6>
							                          </div>
							                        </div>
							                      </td>
						                          <td class="align-middle text-center">
							                       		<span class="text-secondary text-xs font-weight-bold">${s.studentName}</span>
							                      </td>
							                      <td class="align-middle text-center">
							                          <a href="${pageContext.request.contextPath}/employee/removeStudent?studentNo=${s.studentNo}">삭제</a>
							                      </td>
							                    </tr>
						                    </c:forEach>
						                  </tbody>
						                </table>
						              </div>
						            </div>
				                  </div>
				                </div>
				              </div>
				            </div>
				          </div>
				        </div>
				        <!-- 페이징 -->
			          	<div class="pagination-container">
				          <ul class="pagination pagination-primary pagination-sm justify-content-center">
				          	<li class="page-item">
						        <a class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage-1}&word=${word}" aria-label="Previous">
						          <span aria-hidden="true">
						          	<span class="material-icons">
										keyboard_arrow_left
									</span>
								</span>
					          </a>
					        </li>
					        <c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
					        	<c:if test="${i == currentPage}">
									<li class="page-item active">
								      <a class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${i}&word=${word}">${i}</a>
								    </li>
								</c:if>
					        	<c:if test="${i != currentPage}">
									<li class="page-item">
								      <a class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${i}&word=${word}">${i}</a>
								    </li>
								</c:if>
							</c:forEach>
						    <li class="page-item">
						        <a class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage+1}&word=${word}" aria-label="Previous">
						          <span aria-hidden="true">
						          	<span class="material-icons">
										keyboard_arrow_right
									</span>
								</span>
						        </a>
						     </li>
						  </ul>
					  </div>
					  <!-- 페이징 -->
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
	<script>
		$('#idck').click(function() {
			console.log($('#id').val())
			$.ajax({
				url:'http://localhost/online-test/student/idCheck'
				, type:'get'
				, data:{id:$('#id').val()}
				, success:function(model) { //model -> yes/no
					console.log(model)
					if(model =='YES') {
						// 사용가능
						  $('#studentId').val($('#id').val());
					} else {
						// 사용불가능
						alert($('#id').val()+'는 사용중인 아이디입니다.');
					}
				}
			})
		});
	</script>
</html>