<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
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
	box-shadow: 0 5px 10px rgba(0, 0, 0, .5);
	transition: .5s;
}

.box:hover {
	transform: translateY(-10px);
	box-shadow: 0 20px 20px rgba(0, 0, 0, .5);
}

.box .imgBox {
	position: relative;
}

.box .imgBox img {
	position: relative;
	transition: .5s;
}

.box:hover .imgBox img {
	opacity: .5;
	transform: translateY(-40);
}

.box .content {
	position: absolute;
	width: 100%;
	height: 100%;
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

.box .content .description {
	position: absolute;
	width: 100%;
	height: 30%;
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
	height: 400px;
	background-repeat: no-repeat;
	background-size: cover;
}

.inner-small-cut {
	background-size: contain;
	padding: 1% 2%
}

.inner-small-cut img {
	width: 100%;
}
</style>
</head>
<body class="bg-light" style="height:1000px">

<div class="container">
<div class="row"><h3>Recommended lists</h3></div><br>
<div class="row">
	<div class="card-deck">
	<c:forEach var="list" items="${list}" varStatus="status" end="4">
		<div class="card" data-toggle="modal" data-target="#Content" onclick="getMovieInfo(${list.mid})">
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
	
	
	
	
	<div id="Content" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="padding:0px;">
					<img style="width:100%" id="imgpathInnerBig">
				    <button style="position:absolute; top:20px; right:20px;" type="button" class="close" data-dismiss="modal">&times;</button>
			    </div>
				<div class="modal-body">
					<div>
						<div class="row" style="color: black">
							<div class="col-2 text-center"></div>
							<div class="col-2 text-center">
								<div><span class="badge badge-primary">예상별점</span>	</div>
								<div><span>4.0</span></div>
							</div>
							<div class="col-2 text-center">
								<div><span class="badge badge-primary">예매율</span></div>
								<div><span>55%</span></div>
							</div>
							<div class="col-2 text-center">
								<div><span class="badge badge-primary">누적관객수</span></div>
								<div><span>3,305,827명</span></div>
							</div>
							<div class="col-2 text-center">
								<div><span class="badge badge-primary">개봉일</span></div>
								<div><span>D+2</span></div>
							</div>
							<div class="col-2 text-center"></div>
						</div><hr>
						<div id="movieContent">
							<script id="movieModal" type="text/x-handlebars-template">
							<div class="bg-gray row" style="width:100%;">
							<div class="col-3 inner-small-cut">
							  <img src="{{imgpathInnerSmall}}">
							</div>
                            <br>
							<div class="col-9">
							<h3><strong>{{name}}</strong></h3>
							<small> 상영시간 : {{runtime}} 분</small><br>
							<small> 조회수 : {{viewcnt}}</small><br><br>
							{{contents}}<br><br><br>
							</div>
							</div>
						</script>
						</div>
						<div class="row">
						<div id="movieReplyInput" class="col-8 bg-light">
							<h5>Reply <strong> [ ]</strong></h5>
							<div class="input-group">
							  <input type="hidden" id="mid">
							  <input type="text" id="uname" class="form-control">
							  <input type="text" id="utext" class="form-control">
							  <span class="input-group-btn">
							    <button class="btn btn-default" type="button" onclick="addReply('${login.uid}')">Go!</button>
							  </span>
							</div>
							<div id="movieReply">
							<script id="replyModal" type="text/x-handlebars-template">
						    {{#each .}}
						     <li class="replyLi">
					    	{{uname}} :: {{utext}}
						    </li>
						    {{/each }}
							</script>
							</div>
						</div>
						<div class="col-4">
							Youtube Embed<br>
						</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</div>
</body>
<script>
var infoTemplate = $("#movieModal").html();
var replyTemplate = $("#replyModal").html();

function getMovieInfo(mid) {
	$.ajax({
		type : "get",
		url : "/mov/board/detail/" + mid,
		data : "application/json",
		success : function(data) {
			$("#imgpathInnerBig").attr("src", data.imgpathInnerBig);
			var template = Handlebars.compile(infoTemplate);
			$("#movieContent").html(template(data));
			getReply(mid);
		},
		error : function(data) {
			alert("영화 정보를 가져오는데 오류가 발생했습니다.");
			location.reload();
		}
	});
};

function getReply(mid) {
	$("#mid").val(mid);
	$.ajax({
		type : "get",
		url : "/mov/reply/" + mid,
		data : "application/json",
		success : function(data) {
			var template = Handlebars.compile(replyTemplate);
			$("#movieReply").html(template(data));
		},
		error : function(data) {
			alert("댓글 목록을 가져오는 중에 오류가 발생했습니다.");
		}
	});
};

function addReply(uname) {
	var mid = $("#mid").val();
	var uname = uname;
	var utext = $("#utext").val();
	$.ajax({
		type : "POST",
		url : "/mov/reply/" + mid,
		headers: { 
		      "Content-Type": "application/json",
		      "X-HTTP-Method-Override": "POST" },
		data : JSON.stringify({
			mid : mid,
			uname : uname,
			utext : utext
		}),
		success : function(data) {
			alert("등록 완료");
			getReply(mid);
		},
		error : function(data) {
			alert("댓글을 등록하는 중에 오류가 발생했습니다.");
		}
	});
};

$("#searchBtn").on("click", function(){
	self.location = "/mov/search"
	+ "${pageMaker.pageBuilder(1)}"
	+ "&keyword=" + $('#keyword').val()
	+ "&searchType=" + $("select option:selected").val()
	+ "&genre=" + "${genre}"
});

</script>
</html>