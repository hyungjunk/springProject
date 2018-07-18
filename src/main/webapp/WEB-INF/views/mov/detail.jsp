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
</style>
</head>
<body>

<c:forEach items="${list}" var="boardVO">
	<form class="form">
		<input class="form-control" name="contents" type="text" value="${boardVO.name}"><br>
		<input class="form-control" name="contents" type="text" value="${boardVO.contents}"><br>
		<input class="form-control" name="runtime" type="text" value="${boardVO.runtime}"><br>
		<input class="form-control" name="viewcnt" type="text" value="${boardVO.viewcnt}"><br>
	</form>
	<button type="button" class="btn btn-info">Close</button>
</c:forEach>
</body>
</html>