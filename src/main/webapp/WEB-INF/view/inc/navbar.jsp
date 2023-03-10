<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm">
            	<a class="opacity-5 text-dark" href="">
            		<c:choose>
            			<c:when test="${loginEmp != null}">
            				Employee
            			</c:when>
            			<c:when test="${loginTeacher != null}">
            				Teacher
            			</c:when>
            			<c:when test="${loginStudent != null}">
            				Student
            			</c:when>
            			<c:otherwise>
            				Main
            			</c:otherwise>
            		</c:choose>
            	</a>
            </li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">
            	<span class="font-weight-bolder mb-0">Dashboard</span>
            </li>
          </ol>
          
        </nav>
          <ul class="navbar-nav  justify-content-end">
	          <c:choose>
          			<c:when test="${loginStudent != null || loginTeacher != null || loginEmp != null}">
			          	<li class="nav-item px-1 d-flex align-items-center">
							<c:choose>
			           			<c:when test="${loginEmp != null}">
			           				<span class="text-dark">${loginEmp.empName}님</span>
			           			</c:when>
			           			<c:when test="${loginTeacher != null}">
			           				<span class="text-dark">${loginTeacher.teacherName}님</span>
			           			</c:when>
			           			<c:when test="${loginStudent != null}">
			           				<span class="text-dark">${loginStudent.studentName}님</span>
			           			</c:when>
			           		</c:choose>
						</li>
			          	<li class="nav-item px-1 d-flex align-items-center">
							<a class="btn btn-outline-primary btn-sm mb-0 me-3" href="${pageContext.request.contextPath}/logout">Logout</a>
						</li>
          			</c:when>
          			<c:when test="${loginStudent == null && loginTeacher == null && loginEmp == null}">
		            	<li class="nav-item px-1 d-flex align-items-center">
			              <a href="${pageContext.request.contextPath}/loginEmp" class="nav-link text-body font-weight-bold px-0">
			                <i class="fa fa-user me-sm-1"></i>
			                <span class="d-sm-inline d-none">Employee</span>
			              </a>
			            </li>
			            <li class="nav-item px-1 d-flex align-items-center">
			              <a href="${pageContext.request.contextPath}/loginTeacher" class="nav-link text-body font-weight-bold px-0">
			                <i class="fa fa-user me-sm-1"></i>
			                <span class="d-sm-inline d-none">Teacher</span>
			              </a>
			            </li>
			            <li class="nav-item px-1 d-flex align-items-center">
			              <a href="${pageContext.request.contextPath}/loginStudent" class="nav-link text-body font-weight-bold px-0">
			                <i class="fa fa-user me-sm-1"></i>
			                <span class="d-sm-inline d-none">Student</span>
			              </a>
			            </li>
          			</c:when>
	          </c:choose>
          </ul>
        </div>
    </nav>
    <!-- End Navbar -->
