<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/popper.js"></script>
<title>Insert title here</title>
<style>
textarea {
	white-space : pre;
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
<form role="form" action="/admin/mov/create" method="post">
	  <div class="form-row">
	    <div class="col-3">
	      <label>영화명</label>
	    </div>
	    <div class="col">
	      <input type="text" data-toggle="tooltip" data-placement="top" title="TOPTOOLTIP" name="name" class="form-control">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>티어</label>
	    </div>
    	<div class="col">
	    	<select name="tier" class="custom-select">
			  	<option value="top">Top</option>
			  	<option value="mid">Mid</option>
			  	<option value="-">None</option>
			</select>
		</div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>내용</label>
	    </div>
	    <div class="col">
	      <textarea rows="10" name="contents" class="form-control"></textarea>
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>상영시간</label>
	    </div>
	    <div class="col">
	      <input type="text" name="runtime" class="form-control">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>대표 이미지 (540 x 795)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpath" class="form-control">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>장르</label>
	    </div>
	    <div class="col">
	      <input type="text" name="genre" class="form-control">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>카드 내 대형 이미지 (800 x 450)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpathInnerBig" class="form-control">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>카드 내 소형 이미지 (160 x 230)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpathInnerSmall" class="form-control">
	    </div>
	  </div><br>
	<button id="submitBtn" type="submit" class="btn btn-info" >Submit</button>
</form>
</div>
</div>

</body>
<script>
</script>
</html>