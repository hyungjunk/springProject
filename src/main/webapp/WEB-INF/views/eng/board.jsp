<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ include file="../include/header.jsp" %>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var msg = "${msg}";
if (msg=="SUCCESS") {
	alert("완료되었습니다.");
}
</script>
</head>
<body>
<div class="container">
<br>
<h2>English lines are under here</h2>
<h5>Click each row to modify</h5>
<br>
<table id="btable" class="bg-light table table-hover">
	<th class= "text-center">No</th>
	<th class= "text-center">Word</th>
	<th class= "text-center">Dialogue</th>
	<th class= "text-center">Practice</th>
	<c:forEach items="${list}" var="engboardVO">
	<tr>
		<td class="bid" data-name="bid">${engboardVO.bid}</td>
		<td class="word" data-name="word" data-editable>${engboardVO.word}</td>
		<td class="dialogue" data-name="dialogue" data-editable>${engboardVO.dialogue}</td>
		<td class="practice" data-name="practice" data-editable>${engboardVO.practice}</td>
	</tr>
	</c:forEach>
</table>

<div>
	<button type="button" class="btn btn-info" data-toggle="collapse" data-target="#openNew">Add</button>
	<nav>
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pageMaker.startPage==1?'disabled':'' }"/>
	      <a class="page-link" href="/eng/board?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.cri.getPerPageNum()}" tabindex="-1">Previous</a>
	    </li>
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
			<li class="page-item">
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

function validCheck(){
	var word = $('#word').val();
	var dialogue=$('#dialouge').val();
	var practice = $('#practice').val();
	if (word.length&&dialogue.length&&practice.length < 2){
		alert("모든 내용은 2글자 이상 입력해주세요");
		return;
	}
}
var formObj = $("#addForm");
$("#sendForm").on("click", function(){
	validCheck();
	formObj.submit();
});

$("table").on("click", "[data-editable]", function(){
	var $el = $(this);
	var $input = $('<textarea rows=5 style="width:500px"/>').val( $el.text() );
	var str = $el.text();
	$el.html($input); //$(this).html($input)[0]
	$input.focus();
	var field_name = $el.attr('data-name');
	var save = function(bid, newWord, newDialogue, newPractice){
		var $td = $input.val();
		$.ajax({
			type : "POST",
			url : "/tight",
			data : JSON.stringify({
				bid : bid,
				word : newWord,
				dialogue : newDialogue,
				practice : newPractice
			}),
			dataType: "json",
			success : function(msg){
				if (msg["status"] == 'success'){
					$input.replaceWith($td);
				} else {
					alert("Fail");
					$input.replaceWith($el);
				}
			},
			error : function(msg) {
				alert("ajax fail to get data from server");
			}
		});
	};
	$($input).blur(function(){
		var bid = $(this).closest('tr').find('td.bid').text();
		var newWord = $(this).closest('tr').find('td.word').text();
		var newDialogue = $(this).closest('tr').find('td.dialogue').text();
		var newPractice = $(this).closest('tr').find('td.practice').text();
		console.log(newPractice);
		console.log(newPractice);
		save(bid, newWord, newDialogue, newPractice)
	})
});
</script>
</html>
