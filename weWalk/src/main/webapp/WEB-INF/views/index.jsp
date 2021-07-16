<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="./resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "POST");
	form.setAttribute("action", "./parking/parkingList");
	
	var hiddenValue = document.createElement("input");
	hiddenValue.setAttribute("type", "hidden");
	hiddenValue.setAttribute("name", "keyWord");
	hiddenValue.setAttribute("value", " ");
	form.appendChild(hiddenValue);
	
	document.body.appendChild(form);
	form.submit();
});
</script>

<body>

</body>
</html>