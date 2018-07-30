<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head>
<style>
table { table-layout: fixed; }
table th, table td { overflow: hidden; }
td {
	white-space:pre
} 
</style>
</head>
<body>
<div class="container">
<br>

<ul id="comments" class="list-group">
<script id="commentTemplate" type="text/x-handlebars-template">
	{{#each .}}
	  <li class="list-group-item d-flex justify-content-between align-items-center">
		  <div class="row w-100">
		  	<div class="col-2">{{uid}}</div>
		  	<div class="col-8">{{name}}</div>
		  	<div class="col-2">{{prettifyDate updatedate}}</div>
		  </div>
	    <span class="badge badge-primary badge-pill">14</span>
	  </li>
	{{/each }}
</script>
</ul>

<div class="input-group">
	<button id="openForm" class="btn btn-info" data-toggle="collapse" data-target="#openNew">Add</button>&nbsp;
	<button id="golist" type="button" class="btn btn-success">List</button>
</div>
<form role="search" action="search" method="get">
	<input id="keywordInput" type="search" value="${cri.keyword}">
	<button type="button" id="searchBtn" class="btn btn-default">Search</button>
</form>

<nav>
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageMaker.startPage==1?'disabled':'' }"/>
      <a class="page-link">Previous</a>
    </li>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
		<li data-page="paging" class="page-item ${pageMaker.cri.getPage()==page?'active':'' }">
		<a class="page-link" onclick="getReplyPage(${page})"> ${page}</a>
		</li>
	</c:forEach>
    <li class="page-item ${pageMaker.endPage==pageMaker.startPage+4?'':'disabled'}">
      <a class="page-link">Next</a>
    </li>
  </ul>
</nav>

<div id="openNew" class="collapse bg-light">
	<form id="addForm" action="/mov/board/reply" method="POST">
		<div class="form-group">
	  		<label for="name">Name</label>
			<input id="name" class="form-control" name="word" type="text" style="width:50%">
		</div>
		<div class="form-group">
			<label for="reply">Reply</label>
			<input id="reply" rows=2 name="reply" class="form-control" type="text" style="width:50%">
		</div>
	</form>
	<button id="sendForm" type="submit" class="btn btn-info">Send</button>
	<button id="cancel" type="button" class="btn btn-warning" data-toggle="collapse" data-target="#openNew">Cancel</button>
</div>
<div class="bottom"></div>
</div>
</body>
<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
})
/* 신규 코멘트 등록 관련 */
$("#openForm").click(function() {
    $('html,body').animate({
    	scrollTop: $(".bottom").offset().top}, 
    	'slow');
});
/* var formObj = $("#addForm");
$("#sendForm").on("click", function(){
	formObj.submit();
}); */
$("#keywordInput").keydown(function(key){
	if(key.keyCode == 13) {
		$("#searchBtn").click();
		return false;
	}
})


/* 페이징 관련 */
getReplyPage(1);
var replyTemplate = $("#commentTemplate").html();
function getReplyPage(page){
	var perPageNum = 5;
	$.get("/mov/board/post/" + page, function(data){
		var template = Handlebars.compile(commentTemplate);
		$("#comments").html(template(data));
	})
};

$("li[data-page]").on("click", function(){
	$("li[data-page]").removeClass("active");
	$(this).addClass("active");
});

</script>
</html>
