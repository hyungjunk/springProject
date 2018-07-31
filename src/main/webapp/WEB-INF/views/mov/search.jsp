<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find your taste!</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');
body {
	margin: 0px;
	padding: 0px;
	font-family: 'Roboto Condensed', sans-serif !important;
}
.box {
	position: relative;
	width: 100%;
	overflow: hidden;
	border-radius: 10px;
	background: #000;
	box-shadow: 0 5px 10px rgba(0,0,0,.5);
	transition: .5s;
}
.box:hover {
	transform : translateY(-10px); 
	box-shadow: 0 20px 20px rgba(0,0,0,.5);
}
.box .imgBox {
	position:relative;
}
.box .imgBox img {
	position:relative;
	transition: .5s;
}
.box:hover .imgBox img {
	opacity: .5;
	transform: translateY(-40);
}
.box .content {
	position: absolute;
	width:100%;
	height:100%;
	top: 0;
	left: 0;
	padding: 2%;
	transition: .5s;
	opacity: 0;
}
.box .content:hover {
	bottom: 50;
	cursor: pointer;
	opacity: 1;
}
.box .content .description{
	position: absolute;
	width:100%;
	height:30%;
	top: 70%;
	left: 0;
}
.box .content h3 {
	font-size: 36px;
	color: #000;
	font-weight: 700;
}
.box .content p {
	font-size: 18px;
	color: #000;
	font-weight: 400;
}
.inner-big-cut {
	height:400px;
	background-repeat:no-repeat;
	background-size: cover;
}
.inner-small-cut {
	background-size: contain;
	padding : 1% 2%
}
.inner-small-cut img{
	width:100%;
}
</style>
</head>
<body class="bg-light" style="height:1000px">

<div class="container">
<div class="row"><h3>Recommended lists</h3></div><br>
<div class="row">
	<div class="card-deck">
	<c:forEach var="list" items="${list}" varStatus="status" end="4">
		<div class="card">
	    <img class="card-img-top" src="${list.imgpath}" alt="Card image cap">
	    <div class="card-body">
	      <p class="card-text"><c:out value="${list.name}"/></p>
	    </div>
	  </div>
	</c:forEach>
	</div>
<br>
</div>

	<div>
		<div class="input-group">
			<select name="searchType">
				<option value="nc" <c:out value="${cri.searchType == null?'selected':''}"/>>All</option>
				<option value="n" <c:out value="${cri.searchType eq 'n'?'selected':''}"/>>Name</option>
				<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>Content</option>
			</select>
		   <input id="keyword" type="text">
		   <span class="input-group-btn">
		        <button id="searchBtn" class="btn btn-default" type="button">Go!</button>
		   </span>
		</div>
	</div>
	<br>
	<nav>
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pageMaker.startPage==1?'disabled':'' }"/>
	      <a class="page-link">Previous</a>
	    </li>
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
				<li data-page="paging" class="page-item">
				<a class="page-link" href="/mov/search${pageMaker.makeSearch(page)}&genre=${genre}"> ${page}</a>
				</li>
			</c:forEach>
	    <li class="page-item ${pageMaker.endPage==pageMaker.startPage+4?'':'disabled'}">
	      <a class="page-link">Next</a>
	    </li>
	  </ul>
	</nav>
	

</div>
</body>
<script>
$("#searchBtn").on("click", function(){
	self.location = "/mov/search"
	+ "${pageMaker.pageBuilder(1)}"
	+ "&keyword=" + $('#keyword').val()
	+ "&searchType=" + $("select option:selected").val()
	+ "&genre=" + "${genre}"
});

</script>
</html>