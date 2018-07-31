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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div class="container">
<div>
<h3>Contents Detail</h3>
</div>
<hr>
<div class="form-group">
	<form id="movieForm" role="form" action="/admin/edit/${list.mid}" method="post">
	  <div class="form-row">
	    <div class="col-3">
	      <label>영화명</label>
	    </div>
	    <div class="col">
	      <input type="text" name="name" class="form-control" value="${list.name}">
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
			  	<option value="-">-</option>
			</select>
		</div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>내용</label>
	    </div>
	    <div class="col">
	      <textarea name="contents" class="form-control" rows="10">${list.contents}</textarea>
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>상영시간</label>
	    </div>
	    <div class="col">
	      <input type="text" name="runtime" class="form-control" value="${list.runtime}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>조회수</label>
	    </div>
	    <div class="col">
	      <input type="text" name="viewcnt" class="form-control" readonly value="${list.viewcnt}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>장르</label>
	    </div>
	    <div class="col">
	      <input type="text" name="genre" class="form-control" value="${list.genre}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>대표이미지 (540x795)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpath" class="form-control" value="${list.imgpath}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>카드 내 대형 이미지(800x450)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpathInnerBig" class="form-control" value="${list.imgpathInnerBig}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>카드 내 소형 이미지 (160x230)</label>
	    </div>
	    <div class="col">
	      <input type="text" name="imgpathInnerSmall" class="form-control" value="${list.imgpathInnerSmall}">
	    </div>
	  </div>
	  </form>
	  <div class="form-row">
	    <div class="col-3">
	      <label>컨텐츠 최종 수정일</label>
	    </div>
	    <div class="col">
	      <fmt:formatDate var="updatedate" pattern="yyyy-MM-dd KK:mm:ss" value="${list.updatedate}"/>
	      <input id="updatedate" type="text" name="updatedate" class="form-control" readonly value="${updatedate}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>컨텐츠 등록일</label>
	    </div>
	    <div class="col">
	      <fmt:formatDate var="regdate" pattern="yyyy-MM-dd KK:mm:ss" value="${list.updatedate}"/>
	      <input id="regdate" type="text" name="regdate" class="form-control" readonly value="${regdate}">
	    </div>
	  </div>
	<button id="submitBtn" type="submit" class="btn btn-info" >Submit</button>
	<button type="button" class="btn btn-info" onclick="javascript:self.location='/admin'">List</button>
</div>
<hr>
</div>
</body>
<script>
$("#submitBtn").on("click", function(){
	$.post("/admin/edit/"+${list.mid}, $("#movieForm").serialize())
	.done(function(data){
		console.log($("movieForm").serialize());
		alert("완료되었습니다");
		self.location="/admin";
	});
})
</script>
</html>