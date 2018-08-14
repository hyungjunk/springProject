<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<title>Insert title here</title>
<style>
textarea {
	white-space : pre;
}
iframe {
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
</head>
<body>
<div class="container">
<div>
<h3>Contents Detail</h3>
</div>
<hr>
<div class="form-group">
<form id="form1" action="/uploadForm" method="post" enctype="multipart/form-data" target="zeroFrame">
	  <div class="form-row">
	    <div class="col-3"><input type="text" name="name" class="form-control"></div>
	    <div class="col"><input type="file" name="file" class="form-control"></div>
	  </div>
	<button id="submitBtn" type="submit" class="btn btn-info" >Submit</button>
</form>
<iframe name="zeroFrame"></iframe>
<script>
function addFilePath(msg){
	alert(msg);
	document.getElementById("form1").reset();
}
</script>
</div>
</div>
</body>
<script>
</script>
</html>