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
		
		<style type="text/css">
			table{
				table-layout: fixed;
			}
		</style>
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
	                                    <h6 class="m-0 font-weight-bold text-primary">학생등록</h6>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
						                <!-- 학생등록 Form -->
						                  <form method="post" action="${pageContext.request.contextPath}/employee/addStudent" id="addForm">
												<div>
							                      <p class="text-sm text-center text-primary" id="msg"></p>
						                      	</div>
						                    <div class="row mb-3">
						                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">아이디</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="text" class="form-control" name="id" id="id" placeholder="ID를 입력해주세요">
						                      </div>
						                    </div>
						                    
						                    <div class="row mb-3">
						                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">중복확인</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="text" class="form-control mt-6" name="studentId" id="studentId" readonly="readonly" placeholder="ID CHECK CLICK">
						                      </div>
						                    </div>
						
						                    <div class="row mb-3">
						                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="password" class="form-control" name="studentPw" id="studentPw" placeholder="비밀번호를 입력해주세요">
						                      </div>
						                    </div>
						
						                    <div class="row mb-3">
						                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">이름</label>
						                      <div class="col-md-8 col-lg-9">
						                        <input type="text" class="form-control" name="studentName" id="studentName" placeholder="이름을 입력해주세요">
						                      </div>
						                    </div>
						
						                    <div class="text-center">
					                    	  <button type="button" class="btn btn-primary text-right" id="idck">아이디 중복확인</button>
						                      <button type="button" class="btn btn-primary" id="addBtn">등록</button>
						                    </div>
						                  </form><!-- End Change Password Form -->
	                                    <hr>
	                                    아이디는 중복확인 후 등록해주세요!
	                                </div>
	                            </div>
	                        </div>
										
	                        <div class="col-xl-8 col-lg-7">
	                            <!-- Area Chart -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">학생목록</h6>
	                                </div>
	                                <div class="card-body">
                               			<form method="get" action="${pageContext.request.contextPath}/employee/studentList" id="serachForm" class="mb-3">
		                                	<div class="row">
			                                	<div class="col-sm-6 col-md-6 ">
				                                	<div class="dataTables_length">
				                                		<label>
						                                	<select name="rowPerPage" id="rowPerPage" class="custom-select custom-select-sm form-control form-control-sm">
							                                	<option value="10">10</option>
							                                	<option value="25">25</option>
							                                	<option value="50">50</option>
							                                	<option value="100">100</option>
						                                	</select>
				                                		</label>
				                                	</div>
			                                	</div>
			                                	<div class="col-sm-6 col-md-6  ">
				                                	<div class="dataTables_filter d-sm-flex justify-content-end">
					                                	<label>
					                                		<input class="form-control form-control-sm" type="text" name="word" id="word" placeholder="학생 이름 검색" value="${word}">
					                                	</label>
					                                	<button type="button" class="btn btn-primary " id="search">검색</button>
				                                	</div>
			                                	</div>
		                                	</div>
		                                </form> 
	                                
	                                	<div class="table-responsive">
							                <table class="table align-items-center justify-content-center">
							                  <thead>
							                    <tr>
							                      <th class="text-uppercase">ID</th>
							                      <th class="text-uppercase">NAME</th>
							                      <th class="text-uppercase align-middle text-center">Delete</th>
							                    </tr>
							                  </thead>
							                  <tbody>
								                  <c:forEach var="s" items="${list}">
								                    <tr>
								                      <td>
							                            <h6 class="mb-0 text-sm">${s.studentId}</h6>
								                      </td>
							                          <td>
						                          		<h6 class="mb-0 text-sm">${s.studentName}</h6>
								                      </td>
								                      <td class="align-middle text-center">
							                      		<a href="${pageContext.request.contextPath}/employee/removeStudent?studentNo=${s.studentNo}" class="btn btn-danger btn-circle btn-sm" id="remove">
					                                        <i class="fas fa-trash"></i>
					                                    </a>
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
									                <a  class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage-1}&word=${word}&rowPerPage=${rowPerPage}" >
									                	Previous
									                </a>
								              	</li>
							              	 	<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
									              	 <li class="paginate_button page-item ${currentPage == i ? "active" : "" }" id="dataTable_current">
									              		<a class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${i}&word=${word}&rowPerPage=${rowPerPage}">${i}</a>
									              	</li>
												</c:forEach>
								              	<li class="paginate_button page-item next ${currentPage == lastPage ? "disabled" : "" }" id="dataTable_next">
									              	<a aria-controls="dataTable" class="page-link" href="${pageContext.request.contextPath}/employee/studentList?currentPage=${currentPage+1}&word=${word}&rowPerPage=${rowPerPage}">
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
			// 페이지네이션 active처리
		    const el = document.getElementById('rowPerPage');  //select box
		    const len = el.options.length; //select box의 option 갯수
		    //select box의 option 갯수만큼 for문 돌림
		    for (let i=0; i<len; i++){  
		  	  //select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
		      if(el.options[i].value == ${rowPerPage}){
		     	 el.options[i].selected = true;
		      }
		    }  
		    
		    // 검색, 페이지수 변경
			$('#rowPerPage').change(function() {
				$('#serachForm').submit();
			});
			$('#search').click(function() {
				$('#serachForm').submit();
			});
			
			// 아이디 중복 확인
			$('#idck').click(function() {
				$('#studentId').val('');
				if($('#id').val() == '') {
					alert('ID를 입력해주세요.');
					$('#id').focus();
					return;
				} else {
					$.ajax({
						url:'/online-test/employee/idCheck'
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
				}
			});
			
			// 폼 유효성 검사
			$('#addBtn').click(function() {
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
			});
		</script>
	</body>
</html>