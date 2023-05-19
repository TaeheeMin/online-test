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
	                        <h1 class="h3 mb-0 text-gray-800">시험목록</h1>
	                    </div>
	                    <div class="row">
	                        <!-- 시험 캘린더 -->
	                        <div class="col-xl-6 col-lg-7">
	                            <div class="card shadow mb-4">
	                                <!-- Card Body -->
	                                <div class="card-body">
                                    	<div id='calendar'></div>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 시험 캘린더 -->
	                        <div class="col-xl-6 col-lg-7">
	                            <div class="card shadow mb-4">
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                	<table class="table align-items-center justify-content-center mb-0">
						                  <thead>
						                    <tr>
						                      <th colspan="3" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Test</th>
						                    </tr>
						                  </thead>
						                  <tbody>
							                  <c:forEach var="t" items="${list}">
							                    <tr>
							                      <td>
							                        <div class="d-flex px-2">
							                          <div class="my-auto">
							                            <h6 class="mb-0 text-sm">
							                            	<a href="${pageContext.request.contextPath}/student/testOneByStudent?testNo=${t.testNo}">${t.testTitle}</a>
							                            </h6>
							                          </div>
							                        </div>
							                      </td>
						                          <td class="align-middle text-center">
						                       		<span class="text-secondary text-xs font-weight-bold">${t.testDate}</span>
							                      </td>
							                      <td class="align-middle text-center">
							                      	<c:choose>
												        <c:when test="${t.score == '미응시'}">
												            <a href="${pageContext.request.contextPath}/student/testOneByStudent?testNo=${t.testNo}" style="font-color: ">미응시</a>
												        </c:when>         
												        <c:otherwise>
												          ${t.score}
												         </c:otherwise>
												    </c:choose>
							                      </td>
							                    </tr>
						                    </c:forEach>
						                  </tbody>
						                </table>
						                <div class="col-sm-12 col-md-7">
						                	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
							                	<ul class="pagination">
									                <li class="paginate_button page-item previous" id="dataTable_previous">
										                <a aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link"  href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${currentPage-1}">
										                	Previous
										                </a>
									              	</li>
								              	 	<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
										              	 <li class="paginate_button page-item">
										              		<a aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link" href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${i}">${i}</a>
										              	</li>
													</c:forEach>
									              	<li class="paginate_button page-item next" id="dataTable_next">
										              	<a aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${currentPage+1}">
										              		Next
										              	</a>
									              	</li>
									           </ul>
									        </div>
									     </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <!-- Content Row -->
	                    <div class="row">
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-4 col-md-6 mb-4">
	                            <div class="card border-left-primary shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
	                                                시험
	                                             </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-4 col-md-6 mb-4">
	                            <div class="card border-left-success shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
	                                                제출된 문제지
	                                             </div>
	                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-4 col-md-6 mb-4">
	                            <div class="card border-left-info shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                            	직원
	                                            </div>
	                                            <div class="row no-gutters align-items-center">
	                                                <div class="col-auto">
	                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
	                                                </div>
	                                                <div class="col">
	                                                    <div class="progress progress-sm mr-2">
	                                                        <div class="progress-bar bg-info" role="progressbar"
	                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
	                                                            aria-valuemax="100"></div>
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
	                        </div>
	                    </div>
	
	                    <!-- Content Row -->
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
			$(document).ready(function() {
				if(${currentPage} == 1){
					$('#dataTable_previous').addClass("disabled");
				}
				if(${currentPage} == ${lastPage}){
					$('#dataTable_next').addClass("disabled");
				}
			});
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var request = $.ajax({   			
					 method: 'get'
					 , url:"/online-test/testList" 
			    });
			    request.done(function(data){
				 	var calendar = new FullCalendar.Calendar(calendarEl, {
					      initialView: 'dayGridMonth'
					      , events: data // 시험 이벤트로 넣어주기
					      , eventClick:function(event) {
			                    alert("wicked", "width=700,height=600");
			                    return false;
				            }
				    });
					calendar.render();
			    });
			});
		</script>
	</body>
</html>