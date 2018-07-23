<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Board Admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
<h3>컨텐츠 관리</h3>
<hr>
<span><button type="button" onclick="self.location='/admin/mov/create'">컨텐츠 등록하기</button></span>
<table class="bg-light table" style="overflow:hidden">
	<th class="text-center" style="width:5%">번호</th>
	<th class="text-center" style="width:5%">영화명</th>
	<th class="text-center" style="width:35%; overflow:hidden">내용</th>
	<th class="text-center" style="width:15%">최종 수정시각</th>
	<th class="text-center" style="width:15%">관리</th>
	<c:forEach items="${list}" var="boardVO">
	<tr>
		<input type="hidden" var="mid" value="${boardVO.mid}">
		<td>${boardVO.mid}</td>
		<td>${boardVO.name}</td>
		<td>${boardVO.contents}</td>
		<fmt:formatDate var="moddate" pattern="yyyy-MM-dd KK:mm:ss" value="${boardVO.moddate}"/>
		<td>${moddate}</td>
		<td>
			<button type="button" onclick="self.location='admin/edit/'+'${boardVO.mid}'">수정하기</button>
			<button type="button" onclick="deleteContent('${boardVO.mid}')">삭제하기</button>
		</td>
	</tr>
	</c:forEach>
</table>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${pageMaker.prev == true?'':'disabled'}">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
    <li class="page-item"><a class="page-link" href="/admin?page=${page}">${page}</a></li>
    </c:forEach>
    <li class="page-item ${pageMaker.next == true?'':'disabled'}">
      <a class="page-link" href="/admin?page=${pageMaker.endPage+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>

</div>
</body>
<script>
var msg = "${msg}";
if (msg=="success"){
	alert("완료되었습니다");
}

function deleteContent(mid){
	if (confirm("삭제하시겠습니까?")==true){
		$.ajax({
			type : "DELETE",
			url : "admin/delete/" + mid,
			dataType : "text",
			success : function(msg){
				if (msg=="success"){
					alert("삭제가 완료되었습니다.");
					location.reload();
				}
			},
			error : function(){
				alert("서버로부터 응답이 없습니다.");
			}
		})	
	}
}

</script>
</html>