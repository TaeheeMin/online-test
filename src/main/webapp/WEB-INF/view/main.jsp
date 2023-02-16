<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Online Quiz</title>
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
	  <div class="main-content position-relative max-height-vh-100 h-100">
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>
	    <div class="container-fluid py-4">
			<div class="row">
				<div class="col-12 mb-4">
					<div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">Test table</h6>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Test</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Date</th>
											<th class="text-secondary opacity-7"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="t" items="${list}">
											<tr>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${t.testTitle}</h6>
															<p class="text-xs text-secondary mb-0"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="9ff5f0f7f1dffcedfafeebf6e9fab2ebf6f2b1fcf0f2">[email&#160;protected]</a></p>
														</div>
													</div>
												</td>
												<td class="align-middle text-center">
													<span class="text-secondary text-xs font-weight-bold">${t.testDate}</span>
												</td>
												<td class="align-middle">
													<a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
														Edit
													</a>
												</td>
											</tr>
									 	</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				
	       <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
		          	<div class="card">
		            	<div class="card-header p-3 pt-2">
		              		<div class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
		                		<i class="material-icons opacity-10">weekend</i>
		              		</div>
	              		<div class="text-end pt-1">
		                	<p class="text-sm mb-0 text-capitalize">Today's Money</p>
		                	<h4 class="mb-0">$53k</h4>
		              	</div>
		            	</div>
		            	<hr class="dark horizontal my-0">
		            	<div class="card-footer p-3">
		             		<p class="mb-0"><span class="text-success text-sm font-weight-bolder">+55% </span>than last week</p>
		            	</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
			            <div class="card-header p-3 pt-2">
			              	<div class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
			                	<i class="material-icons opacity-10">person</i>
			             	</div>
			              	<div class="text-end pt-1">
			                	<p class="text-sm mb-0 text-capitalize">Today's Student</p>
				                <h4 class="mb-0">2,300</h4>
			              	</div>
			            </div>
			            <hr class="dark horizontal my-0">
			            <div class="card-footer p-3">
			              	<p class="mb-0"><span class="text-success text-sm font-weight-bolder">+3% </span>than last month</p>
			            </div>
		          	</div>
				</div>
	        
	        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
	          <div class="card">
	            <div class="card-header p-3 pt-2">
	              <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
	                <i class="material-icons opacity-10">person</i>
	              </div>
	              <div class="text-end pt-1">
	                <p class="text-sm mb-0 text-capitalize">New Clients</p>
	                <h4 class="mb-0">3,462</h4>
	              </div>
	            </div>
	            <hr class="dark horizontal my-0">
	            <div class="card-footer p-3">
	              <p class="mb-0"><span class="text-danger text-sm font-weight-bolder">-2%</span> than yesterday</p>
	            </div>
	          </div>
	        </div>
	        <div class="col-xl-3 col-sm-6">
	          <div class="card">
	            <div class="card-header p-3 pt-2">
	              <div class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
	                <i class="material-icons opacity-10">weekend</i>
	              </div>
	              <div class="text-end pt-1">
	                <p class="text-sm mb-0 text-capitalize">Sales</p>
	                <h4 class="mb-0">$103,430</h4>
	              </div>
	            </div>
	            <hr class="dark horizontal my-0">
	            <div class="card-footer p-3">
	              <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+5% </span>than yesterday</p>
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
	
	  <!-- Plugin for the charts, full documentation here: https://www.chartjs.org/ -->
	  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/chartjs.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/plugins/Chart.extension.js"></script>
	
	  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	  <script src="${pageContext.request.contextPath}/resources/dashboard/assets/js/material-dashboard.min.js"></script>
	  
	  <script>
	    var ctx = document.getElementById("chart-bars").getContext("2d");
	
	    new Chart(ctx, {
	      type: "bar",
	      data: {
	        labels: ["M", "T", "W", "T", "F", "S", "S"],
	        datasets: [{
	          label: "Sales",
	          tension: 0.4,
	          borderWidth: 0,
	          borderRadius: 4,
	          borderSkipped: false,
	          backgroundColor: "rgba(255, 255, 255, .8)",
	          data: [50, 40, 49, 52, 33, 28, 19],
	          maxBarThickness: 6
	        }, ],
	      },
	      options: {
	        responsive: true,
	        maintainAspectRatio: false,
	        plugins: {
	          legend: {
	            display: false,
	          }
	        },
	        interaction: {
	          intersect: false,
	          mode: 'index',
	        },
	        scales: {
	          y: {
	            grid: {
	              drawBorder: false,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: false,
	              borderDash: [5, 5],
	              color: 'rgba(255, 255, 255, .2)'
	            },
	            ticks: {
	              suggestedMin: 0,
	              suggestedMax: 500,
	              beginAtZero: true,
	              padding: 10,
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	              color: "#fff"
	            },
	          },
	          x: {
	            grid: {
	              drawBorder: false,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: false,
	              borderDash: [5, 5],
	              color: 'rgba(255, 255, 255, .2)'
	            },
	            ticks: {
	              display: true,
	              color: '#f8f9fa',
	              padding: 10,
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	        },
	      },
	    });
	
	
	    var ctx2 = document.getElementById("chart-line").getContext("2d");
	
	    new Chart(ctx2, {
	      type: "line",
	      data: {
	        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	        datasets: [{
	          label: "Mobile apps",
	          tension: 0,
	          borderWidth: 0,
	          pointRadius: 5,
	          pointBackgroundColor: "rgba(255, 255, 255, .8)",
	          pointBorderColor: "transparent",
	          borderColor: "rgba(255, 255, 255, .8)",
	          borderColor: "rgba(255, 255, 255, .8)",
	          borderWidth: 4,
	          backgroundColor: "transparent",
	          fill: true,
	          data: [50, 40, 300, 320, 500, 350, 200, 230, 500],
	          maxBarThickness: 6
	
	        }],
	      },
	      options: {
	        responsive: true,
	        maintainAspectRatio: false,
	        plugins: {
	          legend: {
	            display: false,
	          }
	        },
	        interaction: {
	          intersect: false,
	          mode: 'index',
	        },
	        scales: {
	          y: {
	            grid: {
	              drawBorder: false,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: false,
	              borderDash: [5, 5],
	              color: 'rgba(255, 255, 255, .2)'
	            },
	            ticks: {
	              display: true,
	              color: '#f8f9fa',
	              padding: 10,
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	          x: {
	            grid: {
	              drawBorder: false,
	              display: false,
	              drawOnChartArea: false,
	              drawTicks: false,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              color: '#f8f9fa',
	              padding: 10,
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	        },
	      },
	    });
	
	    var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");
	
	    new Chart(ctx3, {
	      type: "line",
	      data: {
	        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	        datasets: [{
	          label: "Mobile apps",
	          tension: 0,
	          borderWidth: 0,
	          pointRadius: 5,
	          pointBackgroundColor: "rgba(255, 255, 255, .8)",
	          pointBorderColor: "transparent",
	          borderColor: "rgba(255, 255, 255, .8)",
	          borderWidth: 4,
	          backgroundColor: "transparent",
	          fill: true,
	          data: [50, 40, 300, 220, 500, 250, 400, 230, 480],
	          maxBarThickness: 6
	
	        }],
	      },
	      options: {
	        responsive: true,
	        maintainAspectRatio: false,
	        plugins: {
	          legend: {
	            display: false,
	          }
	        },
	        interaction: {
	          intersect: false,
	          mode: 'index',
	        },
	        scales: {
	          y: {
	            grid: {
	              drawBorder: false,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: false,
	              borderDash: [5, 5],
	              color: 'rgba(255, 255, 255, .2)'
	            },
	            ticks: {
	              display: true,
	              padding: 10,
	              color: '#f8f9fa',
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	          x: {
	            grid: {
	              drawBorder: false,
	              display: false,
	              drawOnChartArea: false,
	              drawTicks: false,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              color: '#f8f9fa',
	              padding: 10,
	              font: {
	                size: 14,
	                weight: 300,
	                family: "Roboto",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	        },
	      },
	    });
	  </script>
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
