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
	</head>
	<body class="g-sidenav-show  bg-gray-200">
	   <!-- SideNav -->
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
	  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
		<h3>${loginTeacher.teacherName}님 Test List</h3>
		<a href="${pageContext.request.contextPath}/teacher/addTest">시험등록</a>
		
		<table border="1">
			<tr>
				<td>시험</td>
				<td>날짜</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
					</td>
					<td>${t.testDate}</td>
					<td>
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}">삭제</a>
					</td>
				</tr>
		 	</c:forEach>
		</table>
		
		
		<div class="container-fluid py-4">
			<div class="row">
		        <div class="col-12">
		          <div class="card my-4">
		            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
		              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
		                <h6 class="text-white text-capitalize ps-3">Projects table</h6>
		              </div>
		              
		              <div class="input-group input-group-static mt-4">
					     <label for="exampleFormControlSelect1" class="ms-0">Example select</label>
					     <select class="form-control" id="exampleFormControlSelect1">
					       <option>1</option>
					       <option>2</option>
					       <option>3</option>
					       <option>4</option>
					       <option>5</option>
					     </select>
					   </div>
					   <form method="get" action="${pageContext.request.contextPath}/teacher/testList">
							<select name="rowPerPage">
								<option value="10">10
								<option value="20">20
								<option value="30">30
							</select>
							<button type="submit">검색</button>
						</form>
		            </div>
		            
		            <div class="card-body px-0 pb-2">
		              <div class="table-responsive p-0">
		                <table class="table align-items-center justify-content-center mb-0">
		                  <thead>
		                    <tr>
		                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Quiz</th>
		                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 align-middle text-center">Date</th>
		                      <th></th>
		                    </tr>
		                  </thead>
		                  <tbody>
			                  <c:forEach var="t" items="${list}">
			                    <tr>
			                      <td>
			                        <div class="d-flex px-2">
			                          <div class="my-auto">
			                            <h6 class="mb-0 text-sm">
			                            	<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
			                            </h6>
			                          </div>
			                        </div>
			                      </td>
		                          <td class="align-middle text-center">
			                       		<span class="text-secondary text-xs font-weight-bold">${t.testDate}</span>
			                      </td>
			                      
			                      <td class="align-middle text-center">
			                          <a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}"><i class="fa fa-ellipsis-v text-xs"></i>
			                          </a>
			                      </td>
			                    </tr>
		                    </c:forEach>
		                  </tbody>
		                </table>
		              </div>
		            </div>
		          </div>
		          <!-- 페이징 -->
		          <div class="pagination-container">
			          <ul class="pagination pagination-primary pagination-sm justify-content-center">
			          	<li class="page-item">
					        <a class="page-link" href="javascript:;" aria-label="Previous">
					          <span aria-hidden="true">
					          	<span class="material-icons">
									keyboard_arrow_left
								</span>
							</span>
				          </a>
				        </li>
					    <li class="page-item active">
					      <a class="page-link" href="javascript:;">1</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#link">2</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#link">3</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#link">4</a>
					    </li>
					    <li class="page-item">
					      <a class="page-link" href="#link">5</a>
					    </li>
					    <li class="page-item">
					        <a class="page-link" href="javascript:;" aria-label="Previous">
					          <span aria-hidden="true">
					          	<span class="material-icons">
									keyboard_arrow_right
								</span>
							</span>
					        </a>
					     </li>
					  </ul>
				  </div>
		          		<div>
							<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=1">HOME</a>
							<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}">&#128072;</a>
							<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
								<span>
									<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${i}">${i}</a>
								</span>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}">&#128073;</a>
							<a href="${pageContext.request.contextPath}/teacher/testList?rowPerPage=${rowPerPage}&currentPage=${lastPage}">END</a>
						</div>
						<!-- 페이징 -->
		          
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