<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ include file="../include/header.jsp" %>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</script>
<script>
var msg = "${msg}";
if (msg=="SUCCESS") {
	alert("완료되었습니다.");
}
</script>
<style>
td {
	white-space:pre
} 
</style>
</head>
<body>
<div class="container">
<br>
<h2>English lines are under here</h2>
<h5>Click each row to modify</h5>
<br>
<table id="btable" class="bg-light table table-hover" >
	<th class= "text-center" width="10%">No</th>
	<th class= "text-center" width="10%">Word</th>
	<th class= "text-center" width="40%">Dialogue</th>
	<th class= "text-center" width="40%">Practice</th>
	<c:forEach items="${list}" var="engboardVO">
	<tr>
		<td class="bid text-center" data-name="bid" style="width:10%">${engboardVO.bid}</td>
		<td class="word text-center" data-name="word" data-editable style="width:10%">${engboardVO.word}</td>
		<td class="dialogue" data-name="dialogue" data-editable style="width:40%">${engboardVO.dialogue}</td>
		<td class="practice" data-name="practice" data-editable style="width:40%">${engboardVO.practice}</td>
	</tr>
	</c:forEach>
</table>

<div>
<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#openNew">Add</button>
<form role="search" action="search" method="get">
	<input id="keywordInput" type="search">
	<button type="button" id="searchBtn" class="btn btn-default">Search</button>
</form>
<br>
	<nav>
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pageMaker.startPage==1?'disabled':'' }"/>
	      <a class="page-link" href="/eng/board?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.cri.getPerPageNum()}" tabindex="-1">Previous</a>
	    </li>
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
			<li class="page-item ${pageMaker.cri.getPage()==page?'active':'' }">
			<a class="page-link" href="/eng/board?page=${page}&perPageNum=${pageMaker.cri.getPerPageNum()}"> ${page}</a>
			</li>
		</c:forEach>
	    <li class="page-item">
	      <a class="page-link" href="/eng/board?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.cri.getPerPageNum()}">Next</a>
	    </li>
	  </ul>
	</nav>
</div>
<div id="openNew" class="collapse bg-light">
	<form id="addForm" action="/eng/board" method="POST">
		<div class="form-group">
	  		<label for="word">Word</label>
			<input id="word" class="form-control" name="word" type="text" style="width:30%">
		</div>
		<div class="form-group">
			<label for="dialogue">Dialogue</label>
			<textarea id="dialogue" rows=2 name="dialogue" class="form-control" type="text" style="width:30%"></textarea>
		</div>
		<div class="form-group">
	  		<label for="practice">Practice</label>
			<input id="practice" class="form-control" name="practice" type="text" style="width:30%">
		</div>
	</form>
	<button id="sendForm" type="button" class="btn btn-info">Send</button>
	<button id="cancel" type="button" class="btn btn-warning" data-toggle="collapse" data-target="#openNew">Cancel</button>
</div>
<div class="bottom"/>
</div>
</body>
<script>

$(".btn-info").click(function() {
    $('html,body').animate({
        scrollTop: $(".bottom").offset().top},
        'slow');
});

var formObj = $("#addForm");
$("#sendForm").on("click", function(){
	formObj.submit();
});

$("table").on("click", "[data-editable]", function(){
	var $clicked = $(this);
	if ($clicked.find("textarea").length)
	      return;
	var $oldstr = $clicked.text();
	var width = $clicked.attr('data-name') == "word"?"width:100px" : "width:450px";
	var $newinput = $("<textarea rows=3 style='"+width+"'/>").val( $clicked.text() );
	$clicked.html($newinput);
	$newinput.focus();
	var field_name = $clicked.attr('data-name');
	var save = function(bid, newWord, newDialogue, newPractice){
		var $td = $newinput.val();
		$.ajax({
			type : "POST",
			url : "/modify/"+bid,
			headers : {"Content-Type" : "application/json"},
			data : JSON.stringify({
				bid : bid,
				word : newWord,
				dialogue : newDialogue,
				practice : newPractice
			}),
			dataType: "text",
			success : function(msg){
				if (msg == "SUCCESS"){
					$newinput.replaceWith($td);
				} else {
					alert("FAIL");
					$newinput.replaceWith($oldstr);
				}
			},
			error : function(msg){
				alert("에러가 발생했습니다.");
				$newinput.replaceWith($oldstr);
			}
		});
	};
	$($newinput).blur(function(){
        var row = $(this).closest("tr");
        var bid = row.find("td.bid").text();
        var newWord = $clicked.attr("data-name") == "word" ? row.find("td.word textarea").val() : row.find("td.word").text();
        var newDialogue = field_name == "dialogue" ? row.find("td.dialogue textarea").val() : row.find("td.dialogue").text();
        var newPractice = field_name == "practice" ? row.find("td.practice textarea").val() : row.find("td.practice").text();
        save(bid, newWord, newDialogue, newPractice)
    }); 
});

$("#searchBtn").on("click", function(){
	console.log($(this));
	self.location="search"
		+'${pageMaker.pageBuilder(1)}'
		+"&searchType=t"+"&keyword=" + $('#keywordInput').val();
	console.log(self.location);
});

</script>
</html>
