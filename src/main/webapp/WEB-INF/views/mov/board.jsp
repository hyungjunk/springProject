<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Board</title>
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
<body class="bg-light" style="height: 1000px">

	<div class="col bg-dark text-white"	style="width: 100%; height:300px; padding: 0px; overflow: hidden">
		<img style="width:100%; padding:0px" src="https://coverfiles.alphacoders.com/460/46067.jpg">
		<div class="card-img-overlay">
			<h2 class="card-title">CopCha에 오신 것을 환영합니다</h2>
		</div>
	</div>

	<div class="container">
		<!-- Movie Curation Text Header -->
		<br><br>
		<div class="row">
			<p>	<h3>What's going on?</h3> </p>
		</div> <br>
		<!-- Movie Curation -->

		<!-- 
		부트스트랩의 modal을 활용한 Overlay이다.
		클릭하면 내용이 나오는데 약점이 있다.
		HandleBars는 한 번 렌더링 하면 데이터가 그대로 남기 때문에, 첫번째는 데이터를 잘 불러오지만 두번째부터는 에러가 난다.
		따라서 본래 컴파일이 되지 않은 template을 전역변수로 미리 정의해 놓았다 (안좋은 기법)
		그래서 페이지 내 Modal을 컴파일한 뒤 데이터가 그대로 남아있도록 하는 것이 아니라
		전역변수로 저장해놓은 빈 페이지를 가져와서 컴파일 하는 격이 된다.  	
		 -->
		<div class="row">
			<div class="col-3">
				<div class="card bg-light" style="border:none; height:100%">
					<h5 class="text-center">현재 랭킹 순위</h5>
					<br>
					<div class="list-group">
						<c:forEach items="${rank}" var="movBoardVO" varStatus="status">
							<li class="list-group-item list-group-item-action" style="border:none; color:white; background-color:red">
							${status.count}. ${movBoardVO.name}</li>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content" onclick="getMovieInfo(${top[0].mid})">
						<img class="card-img-top" src="${top[0].imgpath}">
						<div class="content">
							<div class="description" style="background-color: white">
								<h3 class="text-center align-middle">${top[0].name}</h3>
								<hr>
								<div class="row">
									<div class="col-2"></div>
									<div class="col-8 text-center">${top[0].name}</div>
									<div class="col-2"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content"
						onclick="getMovieInfo(${top[1].mid})">
						<img class="card" src="${top[1].imgpathInnerSmall}">
						<div class="content">
							<div class="description" style="background-color: white">
								<h5 class="text-center align-middle">
									<strong>${top[1].name}</strong>
								</h5>
								<hr>
								<div class="row">
									<div class="col-2"></div>
									<div class="col-8 text-center">${top[1].name}</div>
									<div class="col-2"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content"
						onclick="getMovieInfo(${top[2].mid})">
						<img class="card" src="${top[2].imgpathInnerSmall}">
						<div class="content">
							<div class="description" style="background-color: white;">
								<h5 class="text-center">
									<strong>${top[2].name}</strong>
								</h5>
								<hr>
								<div class="row">
									<div class="col-2"></div>
									<div class="col-8 text-center">${top[2].name}</div>
									<div class="col-2"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Carousel이라는 것이 이미지 슬라이드 가능하게 해주는 거고 data-interval false로 자동슬라이드 안되게 함. 
row를 추가하고 6씩 col을 줘서 이미지가 두개씩 슬라이드 되게 함.
-->
		<br>
		<h3>Popular Now</h3>
		<br>
		<div class="row">
			<div class="col-3">
				<p class="text-center"><strong>장르별 탐색</strong></p>
				<hr>
				<div class="list-group">
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=thrill', '_blank')">스릴러</a>
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=drama', '_blank')">드라마</a>
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=romance', '_blank')">로맨스</a>
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=action', '_blank')">액션</a>
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=horror', '_blank')">호러</a>
					<a class="list-group-item list-group-item-action" style="cursor:pointer" onclick="javascript:window.open('/mov/search?genre=adult', '_blank')">성인</a>
				</div>
			</div>
			<div class="col-9">
				<div class="row bg-dark">
					<div id="carouselExampleControls" class="carousel slide" data-interval="3000" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row bg-light justify-content-center">
									<div class="col-4">
										<img class="d-block" src="${mid[0].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[1].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[2].imgpathInnerSmall}" alt="movieCard">
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row bg-light justify-content-center">
									<div class="col-4">
										<img class="d-block" src="${mid[3].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[4].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[5].imgpathInnerSmall}" alt="movieCard">
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row bg-light justify-content-center">
									<div class="col-4">
										<img class="d-block" src="${mid[6].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[7].imgpathInnerSmall}" alt="movieCard">
									</div>
									<div class="col-4">
										<img class="d-block" src="${mid[8].imgpathInnerSmall}" alt="movieCard">
									</div>
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleControls"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<br>
		<div class="row">
			<h3>Comments </h3>
			<hr>
		</div>
		<div class="row" style="height: 300px">
		<%@ include file="commentSection.jsp" %>
		</div>
	</div>
	
	<!-- MODAL BOX -->
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
							<h5>Reply</h5>
							<div class="input-group">
							  <input type="hidden" id="mid">
							  <input type="text" id="uname" class="form-control" value="${login.uid}" readonly>
							  <input type="text" id="utext" class="form-control">
							  <span class="input-group-btn">
							    <button class="btn btn-default" type="button" onclick="addReply('${login.uid}')">Go!</button>
							  </span>
							</div>
							<div id="movieReply">
							<script id="replyModal" type="text/x-handlebars-template">
						    {{#each .}}
						     <li class="replyLi">
					    	{{uname}} ::: {{utext}}
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
</body>
<script>

if ("${msg}"=="FAIL"){
	alert("로그인에 실패했습니다.");
}

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
	console.log("add reply called");
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
</script>
</html>