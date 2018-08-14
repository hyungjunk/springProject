<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
</head>
<body>

<h3> Ajax File Upload</h3>

<div class="fileDrop"></div>

<div class="uploadedList"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});
$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	/* dataTransfer.files는 전달 된 파일 데이터를 가져온다 */
	var files = event.originalEvent.dataTransfer.files;
	var file = files[0];
	// console.log(file);
	var formData = new FormData();
	formData.append("file", file);
	$.ajax({
		url: "/uploadajax",
		type: "POST",
		data: formData,
		dataType: "text",
		processData: false,
		contentType: false,
		success: function(data){
			alert(data);
		}
	})
});
</script>

</body>
</html>