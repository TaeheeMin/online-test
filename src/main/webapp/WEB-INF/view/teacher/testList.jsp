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
						<div class="row">
							<!-- Donut Chart -->
	                        <div class="col-xl-4 col-lg-5">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">시험출제</h6>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
					                	  <!-- 시험등록 Form -->
						                  <form method="post" action="${pageContext.request.contextPath}/teacher/addTest" id="addTestForm">
												<div>
							                      <p class="text-sm text-center text-primary" id="msg"></p>
						                      	</div>
						                    <div class="row mb-3">
						                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">시험제목</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="text" class="form-control" name="testTitle" id="testTitle" placeholder="제목을 입력해주세요">
						                      </div>
						                    </div>
						                    
						                    <div class="row mb-3">
						                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">날짜</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="date" class="form-control" name="testDate" id="testDate">
						                      </div>
						                    </div>
						
						                    <div class="text-center">
						                      <button type="button" class="btn btn-primary" id="addTestBtn">등록</button>
						                    </div>
						                  </form><!-- End Change Password Form -->
	                                    <hr>
	                                    시험 등록 후 문제를 출제해주세요!
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="col-xl-8 col-lg-7">
	                            <!-- Area Chart -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3 d-sm-flex align-items-center justify-content-between">
	                                    <h6 class="font-weight-bold text-primary mb-0">시험목록</h6>
	                                    <p class="mb-0"><mark>응시자가 없을 때</mark> 삭제 가능해요!</p>
	                                </div>
	                                <div class="card-body">
	                                	<div class="table-responsive">
							                <table class="table align-items-center justify-content-center">
							                  <thead>
							                    <tr>
							                      <th class="text-uppercase">title</th>
							                      <th class="text-uppercase">date</th>
							                      <th class="text-uppercase align-middle text-center"></th>
							                    </tr>
							                  </thead>
							                  <tbody>
								                  <c:forEach var="t" items="${list}">
								                    <tr>
								                      <td>
							                            <h6 class="mb-0 text-sm">
							                            	<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}">${t.testTitle}</a>
							                            </h6>
								                      </td>
							                          <td>
						                          		<h6 class="mb-0 text-sm">${t.testDate}</h6>
								                      </td>
								                      <td class="align-middle text-center">
								                      	<c:choose>
															<c:when test="${t.cnt == null}">
																<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${t.testNo}" class="btn btn-danger btn-circle btn-sm" style="height: 1.3rem; width: 1.3rem; font-size: 0.5rem;" id="remove">
						                                        	<i class="fas fa-trash"></i>
						                                    	</a>
															</c:when>
															<c:otherwise>
																<h6 class="mb-0">${t.cnt} 응시</h6>
															</c:otherwise>
														</c:choose>
								                      </td>
								                    </tr>
							                    </c:forEach>
							                  </tbody>
							                </table>
						              	</div>
	                                </div>
	                                <div class="card-footer">
		                                <div class="dataTables_paginate paging_simple_numbers align-items-center justify-content-center" style="display: flex;" id="dataTable_paginate">
						                	<ul class="pagination">
								                <li class="paginate_button page-item previous ${currentPage == 1 ? "disabled" : "" }" id="dataTable_previous">
									                <a  class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}&word=${word}&rowPerPage=${rowPerPage}" >
									                	Previous
									                </a>
								              	</li>
							              	 	<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
									              	 <li class="paginate_button page-item ${currentPage == i ? "active" : "" }" id="dataTable_current">
									              		<a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${i}&word=${word}&rowPerPage=${rowPerPage}">${i}</a>
									              	</li>
												</c:forEach>
								              	<li class="paginate_button page-item next ${currentPage == lastPage ? "disabled" : "" }" id="dataTable_next">
									              	<a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}&word=${word}&rowPerPage=${rowPerPage}">
									              		Next
									              	</a>
								              	</li>
								           </ul>
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
			// 유효성 검사
			$('#addTestBtn').click(function() {
				if($('#testTitle').val() == '') {
					$('#msg').text('제목을 입력해주세요');
					$('#testTitle').focus();
					return;
				} else {
					$('#msg').text('');
				}
				
				if($('#testDate').val() == '') {
					$('#msg').text('날짜를 입력해주세요');
					$('#testDate').focus();
					return;
				} else {
					$('#msg').text('');
				}
				$('#addTestForm').submit();   
			});
		</script>
	</body>
</html>