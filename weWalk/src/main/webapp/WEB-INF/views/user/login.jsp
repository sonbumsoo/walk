<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prking Reservation - 주차장 예약하기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

<link href="../resources/css/login.css" rel="stylesheet">
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="../resources/util/util.js" type="text/javascript"></script>
</head>

<script type="text/javascript">

function login() {
	debugger;
	console.log("login 함수 호출");
	
	var checkList = ['id','password']; 
	
	if(!valueCheck(checkList)){
		return;
	}
	
	var id = $('#id').val();
	var password = $('#password').val();
	
	$.ajax({
		type : 'POST',
		url : '../user/login', 
		data : {
			"id" : id
			,"password" : password
		},
		success : function(data) {
			console.log(data);
			if(data == 002){
				document.getElementById('message').innerHTML = "비밀번호 혹은 아이디가 다릅니다.";
				return;
			} else {
				window.close();
			}
		},
		error : function() {
			
		}
	});	
	
}

</script>



<body>
  <form action="login" name="login-form" id="login-form" method="post">
      <h1>prking Reservation</h1>
      
      <div class="input-box">
          <input type="text" placeholder="Username" required="required" id="id" name="id">
      </div>

      <div class="input-box">
          <input type="password" placeholder="Password" required="required" id="password" name="password">
      </div>
      
      <div style="text-align: center;">
      	<h5 style="color: red;" id="message" >${message}</h5>
      </div>

      <button type="button" onclick="login()" class="login-btn">Login</button>

      <div class="bottom-links">
        <p>아이디가 없습니까? <a href="signUpTypePage">Sign up</a></p>
      </div>
  </form>
	
</body>
</html>