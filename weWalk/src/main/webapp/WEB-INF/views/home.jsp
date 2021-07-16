
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<title>prking Reservation</title>

<!-- Custom fonts for this template-->
<link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./resources/css/sb-admin-2.min.css" rel="stylesheet">

<link href="./resources/css/home.css" rel="stylesheet">

<script type="text/javascript">
	function login() {
		window.open(
				"./user/loginPage",
				"new",
				"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=900, left=0, top=0");
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
					<span> 
						<a href="javascript:login();" style="color: white; font-size: 19px;">로그인</a> 하고 이용하기!
					</span>
				</p>
			</li>

			<!-- Nav Item - Charts -->
			<li class="nav-item">
				<a class="nav-link" href="#"> 
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
							<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
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
							</div></li>

						<!--  <div class="topbar-divider d-none d-sm-block"></div>  -->

						<!-- Nav Item - User Information -->
						

					</ul>

				</nav>
				<!-- End of Topbar -->

				<div id="map" style="width: 95%; height: 90%; margin: auto; position: relative; z-index: 0;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8562e9b0d0ed2cdc824566d1eae42485"></script>
				
				<script>
				var lat;
				var lon;
			
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.49846454396237, 126.86528924290542), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨 
				};
			
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
					// GeoLocation을 이용해서 접속 위치를 얻어옵니다
					navigator.geolocation.getCurrentPosition(function(position) {
						lat = position.coords.latitude, // 위도
						lon = position.coords.longitude; // 경도
			
						var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
						message = '<div style="padding:5px; ">Are you here?!</div>'; // 인포윈도우에 표시될 내용입니다
						// 마커와 인포윈도우를 표시합니다
						displayMarker(locPosition, message);
					});
			
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			
					var locPosition = new kakao.maps.LatLng(37.49846454396237,
							126.86528924290542), message = 'geolocation을 사용할수 없어요..'
					displayMarker(locPosition, message);
				}
			
				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition, message) {
			
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : locPosition
					});
			
					var iwContent = message, // 인포윈도우에 표시할 내용
					iwRemoveable = true;
			
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});
			
					// 인포윈도우를 마커위에 표시합니다 
					infowindow.open(map, marker);
			
					// 지도 중심좌표를 접속위치로 변경합니다
					map.setCenter(locPosition);
				}
			
				var positions = new Array();
				<c:forEach items="${parkList}" var="pk">
					var pkmk = {
						prk_plc_cd : '${pk.prk_plc_cd}'
						,prkplceno : '${pk.prkplceno}'
						,latlng : new daum.maps.LatLng('${pk.latitude}','${pk.hardness}')
						,content : 
						'<div class="wrap">' + 
					    '    <div class="info">' + 
					    '        <div class="title">' + 
					    '            ${pk.prkplcenm}' +
					    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
					    '        </div>' + 
					    '        <div class="body">' + 
					    '            <div class="img">' +
					    '                <img src="./resources/img/placeImages/${pk.parkimg}" width="100" height="90">' +
					    '           </div>' + 
					    '            <div class="desc">' + 
					    '                <div class="ellipsis">${pk.rdnmadr}</div>' + 
					    '                <div class="jibun ellipsis">하루요금 : ${pk.daycmmtkt}</div>' + 
					    '                <div><a href="javascript:openPopup(${pk.prkplceno});">상세보기</a></div>' + 
					    '            </div>' + 
					    '        </div>' + 
					    '    </div>' +    
					    '</div>'			
						
					}
					positions.push(pkmk);
				</c:forEach>
				
				var marker;
			
				for (var i = 0; i < positions.length; i++) {
			
					var imageSrc;
			
					if (positions[i].prk_plc_cd === "001") {
						imageSrc = "./resources/img/marker/mk2.png";
					} else if (positions[i].prk_plc_cd === "002") {
						imageSrc = "./resources/img/marker/mk1.png";
					} else {
						imageSrc = "./resources/img/marker/mk3.png";
					}
			
					var imageSize = new daum.maps.Size(40, 45);
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
					var marker = new daum.maps.Marker({
						map : map, // 마커를 표시할 지도
						position : positions[i].latlng, // 마커를 표시할 위치
						image : markerImage, // 마커 이미지 
						prkplceno : positions[i].prkplceno,
					});
			
					var pkno = positions[i].prkplceno;
					var content = positions[i].content;
					var position = positions[i].latlng;
			
					daum.maps.event.addListener(marker, 'click', openOverlay(pkno, content, position));
			
				}
			
				function openOverlay(pkno, content, position) {
					return function() {
						overlay.setPosition(position);
						overlay.setContent(content);
						overlay.setMap(map);
					}
				}
			
				var overlay = new kakao.maps.CustomOverlay({
					content : content,
					map : map,
					position : position
				});
			
				function closeOverlay() {
					overlay.setMap(null);
				}
			
				function openPopup(prkplceno) {
					window.open(
								"./parking/parkingDtl?pkno=" + prkplceno,
								"new",
								"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=900, left=0, top=0");
			
				}
			</script>



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


	<!-- Bootstrap core JavaScript-->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="./resources/js/sb-admin-2.min.js"></script>

</body>

</html>
