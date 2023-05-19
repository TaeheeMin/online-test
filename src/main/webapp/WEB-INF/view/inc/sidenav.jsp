<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">GOODEE</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <c:choose>
				<c:when test="${loginStudent != null}">
               		<a class="nav-link" href="${pageContext.request.contextPath}/student/testListByStudent">
						<i class="fa-sharp fa-solid fa-house"></i>
		                <span>Home</span>
		            </a>
               	</c:when>
               	<c:when test="${loginTeacher != null}">
               		<a class="nav-link" href="${pageContext.request.contextPath}/teacher/testList">
               			<i class="fa-sharp fa-solid fa-house"></i>
		                <span>Home</span>
		            </a>
               	</c:when>
               	<c:when test="${loginEmp != null}">
		            <a class="nav-link" href="${pageContext.request.contextPath}/employee/main">
		                <i class="fa-sharp fa-solid fa-house"></i>
		                <span>Home</span>
		            </a>
               	</c:when>
             </c:choose>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">


		<!-- Heading -->
        <div class="sidebar-heading">
            시험
        </div>

        <!-- Nav Item - 학생 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                <i class="fa-solid fa-file"></i>
                <span>학생 시험 목록</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">시험: </h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/student/testListByStudent">시험 목록</a>
                    <a class="collapse-item" href="#">시험 결과</a>
                </div>
            </div>
        </li>

        <!-- Nav Item 선생님 -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/teacher/testList">
                <i class="fas fa-fw fa-file"></i>
                <span>선생님 시험 목록</span>
            </a>
        </li>
		
		
		 <!-- Divider -->
        <hr class="sidebar-divider">
		

        <!-- Heading -->
        <div class="sidebar-heading">
            개인정보
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>내 페이지</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">프로필</h6>
                    <c:choose>
  						<c:when test="${loginStudent != null}">
                    		<a class="collapse-item" href="${pageContext.request.contextPath}/student/modifyStudentPw">학생 비밀번호 변경</a>
                    	</c:when>
                    	<c:when test="${loginTeacher != null}">
                    		<a class="collapse-item" href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">강사 비밀번호 변경</a>
                    	</c:when>
                    	<c:when test="${loginEmp != null}">
                    		<a class="collapse-item" href="${pageContext.request.contextPath}/employee/modifyEmpPw">직원 비밀번호 변경</a>
                    	</c:when>
                    </c:choose>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>관리자</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">관리자 기능:</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/employee/empList">직원목록</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/employee/teacherList">선생님 목록</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/employee/studentList">학생목록</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- End of Sidebar -->

	
