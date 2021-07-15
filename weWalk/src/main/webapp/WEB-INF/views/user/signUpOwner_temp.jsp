<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prking Reservation - 사장님 회원 가입~</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
	charset="utf-8"></script>

<!-- Custom styles for this template-->
<link href="../resources/css/user.css" rel="stylesheet">

</head>

<script>
	function signUpUserAction() {
		location.href = "signUpUser";
	}
	function signUpOwnerAction() {
		location.href = "signUpOwner";
	}
</script>
<body>

	<div id="signUser">
		<h1>사용자 회원가입</h1>

		<form name="joinUserForm" id="joinUserForm" action="joinUserAction" method="post">

			<table style="margin: auto;">
				<tr style="height: 70px;">
					<td>
						<div class="input-box">
							<input type="text" placeholder="Username" required="required"
								id="id" name="id" style="width: 270px;">
						</div>
					</td>
					
					<td colspan="2"><input type="button" class="btn "style="margin-left: 20px; height: 35px; width: 100px;" onclick="idOverlap()" value="중복확인">
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="password" placeholder="password" required="required" id="password" name="password" style="width: 400px;">
						</div>
					</td>
				</tr>
			</table>
			
			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="password" placeholder="passwordConfirm" required="required" id="passwordConfirm" name="passwordConfirm" style="width: 400px;">
						</div>
					</td>
				</tr>
			</table>			

			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="text" placeholder="name" required="required" id="name" name="name" style="width: 400px;">
						</div>
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="input-box">
							<input type="text" placeholder="010" required="required" id="phone_front" name="phone_front" style="width: 123px;">
						</div>
					</td>
					
					<td>
						<div class="input-box">
							<input type="text" placeholder="1234" required="required" id="phone_mid" name="phone_mid" style="width: 123px;">
						</div>
					</td>
					
					<td>
						<div class="input-box">
							<input type="text" placeholder="5678" required="required" id="phone_end" name="phone_end" style="width: 123px;">
						</div>
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="input-box">
							<input type="text" placeholder="우편번호" required="required" id="addr1" name="addr1" style="width: 270px;">
						</div>
					</td>
					
					<td colspan="2"><input type="button" class="btn "style="margin-left: 20px; height: 35px; width: 100px;" onclick="exePostCode()" value="찾기">
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="input-box">
							<input type="text" required="required" id="addr2" name="addr2" style="width: 190px;">
						</div>
					</td>
					
					<td colspan="2">
						<div class="input-box">
							<input type="text" placeholder="상세주소" required="required" id="addr3" name="addr3" style="width: 190px;">
						</div>
					</td>
				</tr>
			</table>	
			
			<input type="submit" class="btn "style="margin-left: 170px; height: 35px; width: 100px;" value="가입하기">
		</form>

		<div class="bottom-links">
			<p>
				<a href="../user/signUpTypeAction">타입 선택으로 돌아가기</a>
			</p>
		</div>

	</div>
</body>
</html>