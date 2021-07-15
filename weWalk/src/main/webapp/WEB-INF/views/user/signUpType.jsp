<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prking Reservation - 주차장 예약하기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

<!-- Custom styles for this template-->
<link href="../resources/css/user.css" rel="stylesheet">

</head>

<script>
	function signUpUserAction() {
		location.href = "signUpUserPage";
	}
	function signUpOwnerAction() {
		location.href = "signUpOwnerPage";
	}
</script>
<body>
      
      
      <div id="joinType">
      	<h1>회원 타입 선택</h1>
	      <div style="width: 450px; height: 60px;">
	        <button type="button" class="typebtn" onclick="signUpUserAction()" style=" float: left;">사용자</button>
      		<button type="button" class="typebtn" onclick="signUpOwnerAction()" style=" float: right;">기업</button>
	      </div>
	      
	       <div class="bottom-links">
        	<p>이미 회원 이십니까?  <a href="loginPage">로그인</a></p>
      	  </div>
	      
      </div>     
</body>
</html>