<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
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
/* .row{
    overflow: hidden; 
}

[class*="col-"]{
    margin-bottom: -99999px;
    padding-bottom: 99999px;
} */
</style>
</head>
<body class="bg-light" style="height: 1000px">

	<div class="col bg-dark text-white"
		style="width: 100%; padding-left: 0px; overflow: hidden">
		<img src="https://dummyimage.com/2000x250/078736/fff.png">
		<div class="card-img-overlay">
			<h5 class="card-title">Card title</h5>
			<p class="card-text">This is a wider card with supporting text
				below as a natural lead-in to additional content. This content is a
				little bit longer.</p>
			<p class="card-text">Last updated 3 mins ago</p>
		</div>
	</div>

	<div class="container">
		<!-- Movie Curation Text Header -->
		<div class="row">
			<p>
			<h5>Yolo world</h5>
			</p>
		</div>
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
				<div class="card" style="height: 600px; background-color: green;">
					<h5>현재 랭킹 순위</h5>
					<br>
					<div class="list-group">
						<c:forEach items="${rank}" var="movBoardVO" varStatus="status">
							<a href="#" class="list-group-item list-group-item-action">${status.count}.
								${movBoardVO.name}</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content"
						onclick="getMovieInfo(${top[0].mid})">
						<img class="card-img-top"
							src="http://img.cgv.co.kr/Movie/Thumbnail/Poster/000080/80793/80793_1000.jpg">
						<div class="content">
							<div class="description" style="background-color: white">
								<h3 class="text-center align-middle">${top[0].name}</h3>
								<hr>
								<p class="text-center">Hahaha</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content"
						onclick="getMovieInfo(${top[1].mid})">
						<img class="card"
							src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1529024278/wre0ikxt1tucs9nujmn2.jpg">
						<div class="content">
							<div class="description" style="background-color: white">
								<h5 class="text-center align-middle"><strong>${top[1].name}</strong></h5>
								<hr>
								<p class="text-center">Hahaha</p>
							</div>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="imgBox" data-toggle="modal" data-target="#Content"
						onclick="getMovieInfo(5)">
						<img class="card" id="${top[2].mid}"
							src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1529024278/wre0ikxt1tucs9nujmn2.jpg"
							styel="width:100%">
						<div class="content">
							<div class="description" style="background-color: white">
								<h5 class="text-center"><strong>${top[2].name}</strong></h3>
									<hr>
									<p class="text-center">Hahaha</p>
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
				<p class="text-center">장르별 탐색</p>
				<hr>
				<div class="list-group">
					<a href="/mov/recommendation?genre=thrill"
						class="list-group-item list-group-item-action">스릴러</a> <a
						href="/mov/recommendation?genre=drama"
						class="list-group-item list-group-item-action">드라마</a> <a
						href="/mov/recommendation?genre=romance"
						class="list-group-item list-group-item-action">로맨스</a> <a
						href="/mov/recommendation?genre=action"
						class="list-group-item list-group-item-action">액션</a> <a
						href="/mov/recommendation?genre=horror"
						class="list-group-item list-group-item-action">호러</a> <a
						href="/mov/recommendation?genre=adult"
						class="list-group-item list-group-item-action">성인</a>
				</div>
			</div>
			<div class="col-9">
				<div class="row bg-dark">
					<div id="carouselExampleControls" class="carousel slide"
						data-interval="false" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row  bg-light justify-content-center">
									<div class="col-6">
										<img class="d-block"
											src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1531362451/faj2bznbcurkzeo6u7hc.jpg"
											alt="First slide">
									</div>
									<div class="col-6">
										<img class="d-block"
											src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1531362451/faj2bznbcurkzeo6u7hc.jpg"
											alt="First slide">
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row">
									<div class="col-6">
										<img class="d-block"
											src="https://dummyimage.com/650x400/083236/fff.png"
											alt="Second slide">
									</div>
									<div class="col-6">
										<img class="d-block"
											src="https://dummyimage.com/650x400/083236/fff.png"
											alt="Second slide">
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row">
									<div class="col-6">
										<img class="d-block"
											src="https://dummyimage.com/650x400/083236/fff.png"
											alt="Second slide">
									</div>
									<div class="col-6">
										<img class="d-block"
											src="https://dummyimage.com/650x400/083236/fff.png"
											alt="Second slide">
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
			<h3>Comments</h3>
			<hr>
		</div>
		<div class="row bg-dark" style="height: 300px">보드보드보드</div>


	</div>
	<div id="Content" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header inner-big-cut"
					style="background-image: url(https://dummyimage.com/650x400/083236/fff.png)">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div>
						<div class="row bg-dark" style="color: white">
							<div class="col-2 text-center"></div>
							<div class="col-2 text-center">
								<div>
									<span class="badge badge-primary">예상별점</span>
								</div>
								<div>
									<span>4.0</span>
								</div>
							</div>
							<div class="col-2 text-center">
								<div>
									<span class="badge badge-primary">예매율</span>
								</div>
								<div>
									<span>55%</span>
								</div>
							</div>
							<div class="col-2 text-center">
								<div>
									<span class="badge badge-primary">누적관객수</span>
								</div>
								<div>
									<span>3,305,827명</span>
								</div>
							</div>
							<div class="col-2 text-center">
								<div>
									<span class="badge badge-primary">개봉일</span>
								</div>
								<div>
									<span>D+2</span>
								</div>
							</div>
							<div class="col-2 text-center"></div>
						</div>
						<div id="movieContent">
						<script id="movieModal" type="text/x-handlebars-template">
							<div class="bg-gray row" style="width:100%;">
							<div class="col-3 inner-small-cut">
								<img src="https://dummyimage.com/200x270/024236/fff.png">
							</div>
							<div class="col-9">
							<br>
							<h5>{{name}}</h5>
							<small> 상영시간 : {{runtime}} 분</small><br>
							<small> 조회수 : {{viewcnt}}</small><br><br>
							{{contents}}<br><br><br>
							</div>
							</div>
						</script>
						</div>
						<div id="movieComment">
						<script id="commentModal" type="text/x-handlebars-template">
						<div class="row">
						<div id="movieComments" class="col-8 bg-light">
						<h5>Comment <strong> [ ]</strong></h5>
						<div class="input-group">
						  <input type="text" class="form-control">
						  <span class="input-group-btn">
						    <button class="btn btn-default" type="button" onclick="addReply()">Go!</button>
						  </span>
						</div>
						{{#each .}}
						 <li class="replyLi">
						{{rid}} ::: {{uname}}::: {{utext}}
						</li>
						{{/each }}
						</div>
						<div class="col-4">
						유튜브 임베드<br>
						여기에 또 Modal 넣어서 유튜브 영상 뜨도록~~~
						</div>
						</div>
				</script>
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
var infoTemplate = $("#movieModal").html();
var commentTemplate = $("#commentModal").html();

function getMovieInfo(mid) {
	console.log("movieinfo called");
	$.ajax({
		type : "get",
		url : "/mov/board/detail/" + mid,
		data : "application/json",
		success : function(data) {
			var template = Handlebars.compile(infoTemplate);
			$("#movieContent").html(template(data));
			getComments(mid);
		},
		error : function(data) {
			alert("영화 정보를 가져오는데 에러가 발생했습니다.");
			location.reload();
		}
	});
};

function getComments(mid) {
	console.log(mid);
	console.log("comments called");
	$.ajax({
		type : "get",
		url : "/mov/reply/" + mid,
		data : "application/json",
		success : function(data) {
			var template = Handlebars.compile(commentTemplate);
			$("#movieComment").html(template(data));
		},
		error : function(data) {
			alert("댓글 목록을 가져오는 중에 에러가 발생했습니다.");
		}
	});
};

function addReply(mid) {
	console.log("add reply called");
	$.ajax({
		type : "POST",
		url : "/mov/reply/" + mid,
		data : "text/html",
		success : function(data) {
			if (data == "success") {
				alert("등록 완료");
				getComments();
			}
		},
		error : function(data) {
			alert("댓글을 등록하는 중에 발생했습니다.");
		}
	});
};
</script>
</html>