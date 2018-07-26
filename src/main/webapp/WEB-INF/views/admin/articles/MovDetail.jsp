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
	<form role="form" action="/admin/edit/${list.mid}" method="post">
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
	      <input type="text" name="viewcnt" class="form-control" value="${list.viewcnt}">
	    </div>
	  </div>
	  </form>
	  <div class="form-row">
	    <div class="col-3">
	      <label>컨텐츠 최종 수정일</label>
	    </div>
	    <div class="col">
	      <fmt:formatDate var="updatedate" pattern="yyyy-MM-dd KK:mm:ss" value="${list.updatedate}"/>
	      <input id="updatedate" type="text" name="updatedate" class="form-control" value="${updatedate}">
	    </div>
	  </div>
	  <div class="form-row">
	    <div class="col-3">
	      <label>컨텐츠 등록일</label>
	    </div>
	    <div class="col">
	      <fmt:formatDate var="regdate" pattern="yyyy-MM-dd KK:mm:ss" value="${list.updatedate}"/>
	      <input id="regdate" type="text" name="regdate" class="form-control" value="${regdate}">
	    </div>
	  </div>
	<button id="submitBtn" type="submit" class="btn btn-info" >Submit</button>
	<button type="button" class="btn btn-info" onclick="history.back(-1)">Go Back</button>
</div>
<hr>
<h3>댓글</h3>
<div class="form-group">
<ul id="replies">
<script id="template" type="text/x-handlebars-template">
<form>
{{#each .}}
	<input type="text" class="form-group" value="{{rid}}">
	<input type="text" class="form-group" value="{{uname}}"> 
	<input type="text" class="form-group" value="{{utext}}"> 
{{/each }}
</form>
</script>
</ul>
</div>

</div>
</body>
<script>
getReplyList(mid);
var mid = ${list.mid};
function getReplyList(mid){
	var mid = ${list.mid};
	var str="";
	$.ajax({
		type : "get",
		url : "/mov/reply/"+mid,
		success : function(data){
			var source = $("#template").html();
			var template = Handlebars.compile(source);
			$("#replies").html(template(data));
		},
		error : function(data) {
			alert("error");
		}
	});
};

var source = $("#template").html();
var template = Handlebars.compile(source);
$("#replies2").html(template());

$("#submitBtn").click(function(){
	$("form[role='form']").submit();
});
</script>
</html>