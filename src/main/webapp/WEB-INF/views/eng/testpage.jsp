<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<input type="text" id="name" />
<span id="display"></span><br>
<button type="button" onclick="doi();">dfdf</button>
</body>
<script>
$('#name').on("keyup change", function () {
	  $('#display').text($(this).val());
});
function doi(){
	console.log($('#name').val());
}
</script>
</html>