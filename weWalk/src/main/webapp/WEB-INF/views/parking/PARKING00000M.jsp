<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<title>prking Reservation</title>

<!-- Custom fonts for this template-->
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">

<link href="../resources/css/home.css" rel="stylesheet">
<script src="../resources/util/util.js" type="text/javascript"></script>

<script type="text/javascript">
	var openWin;
	function login() {
		
		openWin = window.open(
					"../user/loginPage",
					"new",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=900, left=0, top=0");
		
		openWin.onbeforeunload = function(){
			console.log("성공");
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "../parking/parkingList");
			
			var hiddenValue = document.createElement("input");
			hiddenValue.setAttribute("type", "hidden");
			hiddenValue.setAttribute("name", "keyWord");
			hiddenValue.setAttribute("value", " ");
			form.appendChild(hiddenValue);
			
			document.body.appendChild(form);
			form.submit();
	    };  
	}

	function search() {
		console.log("search 함수 호출");
		var session = '${sessionScope.loginId}';
		if(!sessionCheck(session)) return;
		
		var keyWord = $('#keyWord').val();
		
		if (keyWord == "") {
			alert("검색어를 입력 해주세요.");
			return;
		} else {
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "POST");
			form.setAttribute("action", "../parking/parkingList");
			
			var hiddenValue = document.createElement("input");
			hiddenValue.setAttribute("type", "hidden");
			hiddenValue.setAttribute("name", "keyWord");
			hiddenValue.setAttribute("value", keyWord);
			form.appendChild(hiddenValue);
			
			document.body.appendChild(form);
			form.submit();
		}
	}
	
	function customerService() {
		
	}
	
	

</script>



</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					PR share <sup>2</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<p class="nav-link" href="#">
					<i class="fas fa-fw fa-tachometer-alt"></i> 
					
					<c:choose>
						<c:when test="${empty sessionScope.loginId}">
							<span> 
								<a href="javascript:login();" style="color: white; font-size: 19px;">로그인</a> 하고 이용하기!
							</span>
						</c:when>
						
						<c:when test="${!empty sessionScope.loginId}">
							<span>${sessionScope.loginId} 님 환영합니다!</span>
						</c:when>
					</c:choose>
					
				</p>
			</li>

			
			
			<c:if test="${!empty sessionScope.loginId}">
				<!-- Divider -->
				<hr class="sidebar-divider">
				<!-- Heading -->
				<div class="sidebar-heading">INFOMATION</div>
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> 
						<i class="fas fa-fw fa-cog"></i> 
						<span>사용자 정보</span>
					</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">사용자 정보 관리:</h6>
							<a class="collapse-item" href="#">사용자 정보수정</a> 
							<a class="collapse-item" href="#">이용내역</a> 
							<a class="collapse-item" href="#">보유 포인트 확인</a>
						</div>
					</div>
				</li>
			</c:if>

			<!-- 기업회원 주차장 관리 -->
			<c:choose>
				<c:when test="${sessionScope.loginType eq '002'}">
					<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> 
					<i class="fas fa-fw fa-wrench"></i> 
					<span>주차장관리</span>
					</a>
						<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
							<div class="bg-white py-2 collapse-inner rounded">
								<h6 class="collapse-header">주차장 관리:</h6>
								<a class="collapse-item" href="#">주차장 정보수정</a> 
								<a class="collapse-item" href="#">예약 현황</a> 
								<a class="collapse-item" href="#">포인트확인</a> 
								<a class="collapse-item" href="#">포인트전환</a>
							</div>
						</div>
					</li>
				</c:when>
			</c:choose>

			<!-- Divider -->
			<hr class="sidebar-divider">
			<c:if test="${!empty sessionScope.loginId}">
					<!-- Heading -->
				<div class="sidebar-heading">Parking</div>
	
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
					<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> 
						<i class="fas fa-fw fa-folder"></i> 
						<span>parking sharing!</span>
					</a>
					<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">sharing menu</h6>
							<a class="collapse-item" href="#">share!</a> 
							<a class="collapse-item" href="#">예약현황</a> 
							<a class="collapse-item" href="#">공유 내역</a>
							<div class="collapse-divider"></div>
							<h6 class="collapse-header">share 커뮤 니티:</h6>
							<a class="collapse-item" href="#">공유 주차장</a> 
							<a class="collapse-item" href="#">예약 내역</a>
						</div>
					</div>
				</li>
			</c:if>
			

			<!-- Nav Item - Charts -->
			<li class="nav-item">
				<a class="nav-link" href="javascript:customerService();"> 
					<i class="fas fa-fw fa-chart-area"></i> 
					<span>고객 센터</span>
				</a>
			</li>

			<!-- Nav Item - Tables -->
			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<i class="fas fa-fw fa-table"></i> 
					<span>이벤트</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small" id="keyWord" name="keyWord" placeholder="Search for..." onkeypress="javascript:if(event.keyCode==13) {search()}" aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button"  onclick="search();">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none">
							<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<i class="fas fa-search fa-fw"></i>
							</a> 
							<!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</li>

						<!--  <div class="topbar-divider d-none d-sm-block"></div>  -->
						<c:if test="${!empty sessionScope.loginId}">
							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
									<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
								</a> 
								<!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											Logout
									</a>
								</div>
							</li>
						</c:if>
						
						
					</ul>
				</nav>
				<!-- End of Topbar -->


				<!-- CONTENT -->
				
		
				<c:choose>
					<c:when test="${pageId eq 'PARKING00000M'}">
						<jsp:include page="../parking/PARKING10000M.jsp" flush="true"/>
					</c:when>
				</c:choose>
				
				
				
				<!-- CONTENT -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃하러 갑시다!</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../user/logout">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/js/sb-admin-2.min.js"></script>

</body>

</html>
