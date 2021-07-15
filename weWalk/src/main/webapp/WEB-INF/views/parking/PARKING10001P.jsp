<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prking Reservation</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="colorlib.com">

	<!-- MATERIAL DESIGN ICONIC FONT -->
	<link rel="stylesheet" href="../resources/popup/fonts/material-design-iconic-font/css/material-design-iconic-font.css">

	<!-- DATE-PICKER -->
	<link rel="stylesheet" href="../resources/popup/vendor/date-picker/css/datepicker.min.css">

	<!-- STYLE CSS -->
	<link rel="stylesheet" href="../resources/popup/css/style.css">

</head>
<body>
	<div class="wrapper">
		<form action="" id="wizard" style="width: 100%; height: 788px;">
			<!-- SECTION 1 -->
			<h4></h4>
			<section >
				<h3>Parking Infomaiton</h3>
				<div align="center">
					<img alt="" src="../resources/img/placeImages/${parking_dt_info.parkimg}" style=" width: 64%; height: 250px; margin-bottom: 20px;">
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 관리자~ </label>
						<div class="form-holder">
							<i class="zmdi zmdi-account-o"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.id}">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 주차장 이름 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-edit"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.prkplcenm}">
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 주차장 유형 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-spellcheck"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.prk_plc_cd}">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 관리자 전화번호 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-smartphone-android"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.spcmnt}">
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 주차장 구분 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-spellcheck"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.prk_type_cd}">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 주차장 위치 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-pin"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.rdnmadr}">
						</div>
					</div>
				</div>
			</section>

			<!-- SECTION 2 -->
			<h4></h4>
			<section>
				<h3>RESERVATION INFOMATION</h3>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 기본예약시간 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-spellcheck"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.basictime} 분">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 기본요금  </label>
						<div class="form-holder">
							<i class="zmdi zmdi-spellcheck"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.basiccharge} 원">
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 하루 요금 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-email"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.rdnmadr} (하루예약은 현장에서 가능합니다 \)">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 관리자 전화번호 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-smartphone-android"></i> 
							<input type="text" class="form-control" disabled value="${parking_dt_info.rdnmadr}">
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 관리자 Email </label>
						<div class="form-holder">
							<i class="zmdi zmdi-email"></i> 
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="form-col">
						<label for=""> 관리자 전화번호 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-smartphone-android"></i> 
							<input type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 주차 할게요! </label>
						<div class="form-holder">
							<i class="zmdi zmdi-calendar"></i> 
							<input type="text" class="form-control datepicker-here" data-language='en' data-date-format="dd - mm - yyyy" id="dp1">
						</div>
					</div>
					
					<div class="form-col">
						<label for=""> 시간 선택 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-account-o"></i> <select name="" id="" class="form-control">
								<c:forEach var="time" items="${time_div_cd}">
									<option value="${time.code_dtl_val}" class="option">${time.code_dtl_nm}</option>
								</c:forEach>
							</select> <i class="zmdi zmdi-chevron-down"></i>
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> 안녕히 계세요~ </label>
						<div class="form-holder">
							<i class="zmdi zmdi-calendar"></i> 
							<input type="text" class="form-control datepicker-here" data-language='en' data-date-format="dd - mm - yyyy" id="dp2">
						</div>
					</div>
					
					<div class="form-col">
						<label for=""> 시간 선택 </label>
						<div class="form-holder">
							<i class="zmdi zmdi-account-o"></i> <select name="" id="" class="form-control">
								<c:forEach var="time" items="${time_div_cd}">
									<option value="${time.code_dtl_val}" class="option">${time.code_dtl_nm}</option>
								</c:forEach>
							</select> <i class="zmdi zmdi-chevron-down"></i>
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-col">
						<label for=""> County </label>
						<div class="form-holder">
							<i class="zmdi zmdi-pin"></i> 
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="form-col">
						<label for=""> Postcode / Zip </label>
						<div class="form-holder password">
							<i class="zmdi zmdi-eye"></i> 
							<input type="password" class="form-control">
						</div>
					</div>
				</div>
			</section>

			<!-- SECTION 3 -->
			<h4></h4>
			<section>
				<h3 style="margin-bottom: 37px;">What are you doing?</h3>
				<div class="grid">
					<div class="grid-item active">
						<div class="thumb">
							<img src="images/programming.jpg" alt="">
						</div>
						<div class="heading">Programming</div>
					</div>
					<div class="grid-item">
						<div class="thumb">
							<img src="images/sports.jpg" alt="">
						</div>
						<div class="heading">Sports</div>
					</div>
					<div class="grid-item">
						<div class="thumb">
							<img src="images/business.jpg" alt="">
						</div>
						<div class="heading">Business</div>
					</div>
					<div class="grid-item">
						<div class="thumb">
							<img src="images/tour-guide.jpg" alt="">
						</div>
						<div class="heading">Tour Guide</div>
					</div>
					<div class="grid-item">
						<div class="thumb">
							<img src="images/art-design.jpg" alt="">
						</div>
						<div class="heading">Art-Design</div>
					</div>
					<div class="grid-item">
						<div class="thumb">
							<img src="images/doctor.jpg" alt="">
						</div>
						<div class="heading">Doctor</div>
					</div>
				</div>
			</section>
		</form>
	</div>

	<script src="../resources/popup/js/jquery-3.3.1.min.js"></script>

	<!-- JQUERY STEP -->
	<script src="../resources/popup/js/jquery.steps.js"></script>

	<!-- DATE-PICKER -->
	<script src="../resources/popup/vendor/date-picker/js/datepicker.js"></script>
	<script src="../resources/popup/vendor/date-picker/js/datepicker.en.js"></script>

	<script src="../resources/popup/js/main.js"></script>

	<!-- Template created and distributed by Colorlib -->
</body>
</html>