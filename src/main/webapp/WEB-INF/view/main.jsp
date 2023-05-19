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
	    <link
	        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	        rel="stylesheet">
	
	    <!-- Custom styles for this template-->
	    <link href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.min.css" rel="stylesheet">
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
	                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
	                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
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
	
	                    <div class="row">
	
	                        <!-- Area Chart -->
	                        <div class="col-xl-12 col-lg-7">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
	                                    <div class="dropdown no-arrow">
	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
	                                        </a>
	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
	                                            aria-labelledby="dropdownMenuLink">
	                                            <div class="dropdown-header">Dropdown Header:</div>
	                                            <a class="dropdown-item" href="#">Action</a>
	                                            <a class="dropdown-item" href="#">Another action</a>
	                                            <div class="dropdown-divider"></div>
	                                            <a class="dropdown-item" href="#">Something else here</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-area">
	                                        <canvas id="myAreaChart"></canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Pie Chart -->
	                        <div class="col-xl-4 col-lg-5">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div
	                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
	                                    <div class="dropdown no-arrow">
	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
	                                        </a>
	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
	                                            aria-labelledby="dropdownMenuLink">
	                                            <div class="dropdown-header">Dropdown Header:</div>
	                                            <a class="dropdown-item" href="#">Action</a>
	                                            <a class="dropdown-item" href="#">Another action</a>
	                                            <div class="dropdown-divider"></div>
	                                            <a class="dropdown-item" href="#">Something else here</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-pie pt-4 pb-2">
	                                        <canvas id="myPieChart"></canvas>
	                                    </div>
	                                    <div class="mt-4 text-center small">
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-primary"></i> Direct
	                                        </span>
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-success"></i> Social
	                                        </span>
	                                        <span class="mr-2">
	                                            <i class="fas fa-circle text-info"></i> Referral
	                                        </span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	
	                    <!-- Content Row -->
	                    <div class="row">
	
	                        <!-- Content Column -->
	                        <div class="col-lg-6 mb-4">
	
	                            <!-- Project Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
	                                </div>
	                                <div class="card-body">
	                                    <h4 class="small font-weight-bold">Server Migration <span
	                                            class="float-right">20%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
	                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Sales Tracking <span
	                                            class="float-right">40%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
	                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Customer Database <span
	                                            class="float-right">60%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar" role="progressbar" style="width: 60%"
	                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Payout Details <span
	                                            class="float-right">80%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
	                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Account Setup <span
	                                            class="float-right">Complete!</span></h4>
	                                    <div class="progress">
	                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
	                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <!-- Color System -->
	                            <div class="row">
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-primary text-white shadow">
	                                        <div class="card-body">
	                                            Primary
	                                            <div class="text-white-50 small">#4e73df</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-success text-white shadow">
	                                        <div class="card-body">
	                                            Success
	                                            <div class="text-white-50 small">#1cc88a</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-info text-white shadow">
	                                        <div class="card-body">
	                                            Info
	                                            <div class="text-white-50 small">#36b9cc</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-warning text-white shadow">
	                                        <div class="card-body">
	                                            Warning
	                                            <div class="text-white-50 small">#f6c23e</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-danger text-white shadow">
	                                        <div class="card-body">
	                                            Danger
	                                            <div class="text-white-50 small">#e74a3b</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-secondary text-white shadow">
	                                        <div class="card-body">
	                                            Secondary
	                                            <div class="text-white-50 small">#858796</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-light text-black shadow">
	                                        <div class="card-body">
	                                            Light
	                                            <div class="text-black-50 small">#f8f9fc</div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-lg-6 mb-4">
	                                    <div class="card bg-dark text-white shadow">
	                                        <div class="card-body">
	                                            Dark
	                                            <div class="text-white-50 small">#5a5c69</div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	
	                        </div>
	
	                        <div class="col-lg-6 mb-4">
	
	                            <!-- Illustrations -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
	                                </div>
	                                <div class="card-body">
	                                    <div class="text-center">
	                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
	                                            src="img/undraw_posting_photo.svg" alt="...">
	                                    </div>
	                                    <p>Add some quality, svg illustrations to your project courtesy of <a
	                                            target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
	                                        constantly updated collection of beautiful svg images that you can use
	                                        completely free and without attribution!</p>
	                                    <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
	                                        unDraw &rarr;</a>
	                                </div>
	                            </div>
	
	                            <!-- Approach -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
	                                </div>
	                                <div class="card-body">
	                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
	                                        CSS bloat and poor page performance. Custom CSS classes are used to create
	                                        custom components and custom utility classes.</p>
	                                    <p class="mb-0">Before working with this theme, you should become familiar with the
	                                        Bootstrap framework, especially the utility classes.</p>
	                                </div>
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
	                        <span>Copyright &copy; Your Website 2021</span>
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
	
	    <!-- Logout Modal-->
	    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">Logout</a>
	                </div>
	            </div>
	        </div>
	    </div>
		<body class="g-sidenav-show  bg-gray-200">
		   <!-- SideNav -->
			<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
		  <div class="main-content position-relative max-height-vh-100 h-100">
			<!-- Navbar -->
			<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
		    <div class="container-fluid py-4">
				<div class="row">
					<div class="col-12 mb-4">
						<div class="card my-4">
							<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
								<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
									<h6 class="text-white text-capitalize ps-3">Quiz</h6>
								</div>
							</div>
							<div class="card-body px-0 pb-2">
								<div class="table-responsive mx-3">
									<table class="table align-items-center mb-4">
										<thead>
											<tr>
												<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Title</th>
												<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Date</th>
												<c:if test="${loginTeacher != null}">
													<th class="text-secondary opacity-7"></th>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="t" items="${list}">
												<tr>
													<td>
														<div class="d-flex px-2 py-1">
															<div class="d-flex flex-column justify-content-center">
																<h6 class="mb-0 text-sm">${t.testTitle}</h6>
															</div>
														</div>
													</td>
													<td class="align-middle text-center">
														<span class="text-secondary text-xs font-weight-bold">${t.testDate}</span>
													</td>
													<c:if test="${loginTeacher != null}">
														<td class="align-middle">
															<a href="${pageContext.request.contextPath}/teacher/testOne?testNo=${t.testNo}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
																Edit
															</a>
														</td>
													</c:if>
												</tr>
										 	</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			
		      <div class="row">
		        <div class="col-lg-4 col-md-6 mt-4 mb-4">
		          <div class="card z-index-2 ">
		            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
		              <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
		                <div class="chart">
		                  <canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
		                </div>
		              </div>
		            </div>
		            <div class="card-body">
		              <h6 class="mb-0 ">Website Views</h6>
		              <p class="text-sm ">Last Campaign Performance</p>
		              <hr class="dark horizontal">
		              <div class="d-flex ">
		                <i class="material-icons text-sm my-auto me-1">schedule</i>
		                <p class="mb-0 text-sm"> campaign sent 2 days ago </p>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="col-lg-4 col-md-6 mt-4 mb-4">
		          <div class="card z-index-2  ">
		            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
		              <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
		                <div class="chart">
		                  <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
		                </div>
		              </div>
		            </div>
		            <div class="card-body">
		              <h6 class="mb-0 "> Daily Sales </h6>
		              <p class="text-sm "> (<span class="font-weight-bolder">+15%</span>) increase in today sales. </p>
		              <hr class="dark horizontal">
		              <div class="d-flex ">
		                <i class="material-icons text-sm my-auto me-1">schedule</i>
		                <p class="mb-0 text-sm"> updated 4 min ago </p>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="col-lg-4 mt-4 mb-3">
		          <div class="card z-index-2 ">
		            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
		              <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
		                <div class="chart">
		                  <canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas>
		                </div>
		              </div>
		            </div>
		            <div class="card-body">
		              <h6 class="mb-0 ">Completed Tasks</h6>
		              <p class="text-sm ">Last Campaign Performance</p>
		              <hr class="dark horizontal">
		              <div class="d-flex ">
		                <i class="material-icons text-sm my-auto me-1">schedule</i>
		                <p class="mb-0 text-sm">just updated</p>
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

	    <!-- Bootstrap core JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Core plugin JavaScript-->
	    <script src="${pageContext.request.contextPath}/resources/assets//vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for all pages-->
	    <script src="${pageContext.request.contextPath}/resources/assets//js/sb-admin-2.min.js"></script>
	
	</body>

</html>


