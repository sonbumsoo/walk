<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prking Reservation - 이용자 회원가입!</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

<!-- Custom styles for this template-->
<link href="../resources/css/user.css" rel="stylesheet">

</head>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/util/util.js" type="text/javascript"></script>

<script>
	//중복확인용 변수
	var checkUnload = false;
	var pwCheck = false;
	
	// 중복 확인을 한 아이디가 아닐시 다시 중복확인을 위한 아이디 저장
	var originId = "";
	
	// 아이디 중복확인 
	function idOverlap() {
		console.log("idOverlap 함수 호출");
		var id = $('#id').val();
		
		if (id == "") {
			alert("아이디를 입력 해주세요.");
			return;
		} else {
			$.ajax({
				type : 'POST',
				url : 'idOverlap', 
				data : {
					id : id
				},
				success : function(data) {
					if (data == 1) {
						originId = id;
						alert("사용 가능한 아이디입니다.");
						checkUnload = true;
					} else {
						alert("사용 할 수 없는 아이디 입니다.");
					}
				},
				error : function() {
					alert("아이디 중복확인 ajax 실패");
				}
			});
		}
	}

	function pwConfirm(id) {
		var pw = document.getElementById(id).value; //비밀번호

		if (pw.length == 0) {
			document.getElementById(id + 'Message').innerHTML = "";
			return;
		}

		if (pw_check(pw)) {
			document.getElementById(id + 'Message').innerHTML = "";
		} else {
			document.getElementById(id + 'Message').innerHTML = "영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.";
		}
	}

	function pwConfirm_check(id) {
		var pw = document.getElementById(id).value; //비밀번호
		var pw1 = document.getElementById("password").value; //비밀번호

		if (pw.length == 0) {
			document.getElementById(id + 'Message').innerHTML = "";
			return;
		}

		if (pw_check(pw)) {
			document.getElementById(id + 'Message').innerHTML = "";
			if (pw1 == pw) {
				document.getElementById(id + 'Message').innerHTML = "";
				pwCheck = true;
			} else {
				document.getElementById(id + 'Message').innerHTML = "비밀번호가 다릅니다";
			}
		} else {
			document.getElementById(id + 'Message').innerHTML = "영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.";
		}

	}
	
	//가입버튼
	function signUser() {
		var checkList = ['id','password','passwordConfirm','email','name','phone_front','phone_mid','phone_end','addr1','addr2','addr3']; 
		
		if(!valueCheck(checkList)){
			return;
		}
		
		if (!pwCheck) {
			alert("비밀번호 학인");
			return;
		}
		
		var id = $('#id').val();

		if(id != originId){
			checkUnload = false;
			originId = "";
		}
		
		if (!checkUnload) {
			alert("아이디 중복확인 하세요");
			return;
		}
		
		signUserForm.submit();
	}
</script>


<body>

	<div id="signUser">
		<h1>사용자 회원가입</h1>

		<form name="signUserForm" id="signUserForm" action="signUser" method="post">
			<input type="hidden" name="member_type_cd" value="001">
			<table style="margin: auto;">
				<tr style="height: 70px;">
					<td>
						<div class="input-box">
							<input type="text" placeholder="userId" required="required"id="id" name="id" style="width: 270px;">
						</div>
					</td>

					<td colspan="2"><input type="button" class="btn " style="margin-left: 20px; height: 35px; width: 100px;" onclick="idOverlap()" value="중복확인"></td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="password" placeholder="password" onblur="pwConfirm('password')" required="required" id="password" name="password" style="width: 400px;">
						</div>
						<div id="passwordMessage" style="font-size: 11px; color: red;"></div>
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="password" placeholder="passwordConfirm" onblur="pwConfirm_check('passwordConfirm')" required="required" id="passwordConfirm" name="passwordConfirm" style="width: 400px;">
						</div>
						<div id="passwordConfirmMessage" style="font-size: 11px; color: red;"></div>
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td colspan="3">
						<div class="input-box">
							<input type="text" placeholder="email@gmail.com" required="required" id="email" name="email" style="width: 400px;">
						</div> <small>* 인증 이메일 주소로 입력해주세요.</small>
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
							<input type="text" placeholder="010" maxlength="3" required="required" id="phone_front" name="phone_front" style="width: 123px;">

						</div>
					</td>

					<td>
						<div class="input-box">
							<input type="text" placeholder="1234" maxlength="4"
								required="required" id="phone_mid" name="phone_mid"
								style="width: 123px;">
						</div>
					</td>

					<td>
						<div class="input-box">
							<input type="text" placeholder="5678" maxlength="4"
								required="required" id="phone_end" name="phone_end"
								style="width: 123px;">
						</div>
					</td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="input-box">
							<input type="text" placeholder="우편번호" required="required"
								id="addr1" name="addr1" style="width: 270px;">
						</div>
					</td>

					<td colspan="2"><input type="button" class="btn "
						style="margin-left: 20px; height: 35px; width: 100px;"
						onclick="exePostCode()" value="찾기"></td>
				</tr>
			</table>

			<table style="margin: auto;">
				<tr>
					<td>
						<div class="input-box">
							<input type="text" required="required" id="addr2" name="addr2"
								style="width: 190px;">
						</div>
					</td>

					<td colspan="2">
						<div class="input-box">
							<input type="text" placeholder="상세주소" required="required"
								id="addr3" name="addr3" style="width: 190px;">
						</div>
					</td>
				</tr>
			</table>

			<input type="button" class="btn " style="margin-left: 170px; height: 35px; width: 100px;" onclick="signUser()" value="가입하기">
		</form>

		<div class="bottom-links">
			<p>
				<a href="../user/signUpTypePage">타입 선택으로 돌아가기</a>
			</p>
		</div>

	</div>
</body>
</html>