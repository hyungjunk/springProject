<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
.card {
	margin : 5px;
}
.container{
  max-width: none !important;
  width: 970px;
}
#overlay {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0,0,0,0.5);
    z-index: 2;
}
</style>
</head>
<body style="height:1000px">


<div class="col bg-dark text-white" style="width:100%; padding-left:0px; overflow:hidden">
	<img src="https://dummyimage.com/2000x250/078736/fff.png">
	<div class="card-img-overlay">
		<h5 class="card-title"> Card title</h5>
		<p class="card-text">This is a wider card with supporting text
			below as a natural lead-in to additional content. This content is a
			little bit longer.</p>
		<p class="card-text">Last updated 3 mins ago</p>
	</div>
</div>

<div class="container">
<!-- Movie Curation Text Header -->
<div class="row">
<p><h5>Yolo world</h5></p>
</div>
<!-- Movie Curation -->
<div style="overflow:hidden">
	<div class="row">
		<div class="col-3">
			<div class="card" style="height:600px; background-color:green;">
			Ranking<br>
			<c:forEach items= "list" var="RankVO">
			Some ranking goes here.
			</c:forEach>
			</div>
		</div>
		<div class="col-6">
			<div class="card" id="${top[0].mid}" style="height:600px" onclick="openOverlay(${top[0].mid});">
			<img src="https://dummyimage.com/530x450/078736/fff.png">
				<div class="card-body bg-light">
			      <h5 class="card-title">${top[0].name}</h5>
			      <p class="card-text">${top[0].contents}</p>
			    </div>
			</div>
		</div>
		<div class="col-3">
			<div class="card"><img class="poster" id="${top[1].mid}" src="${top[1].contents}" width="100%" onclick="openOverlay(${top[1].mid})"></div>
			<div class="card"><img class="poster" id="${top[2].mid}" src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1529024278/wre0ikxt1tucs9nujmn2.jpg" width="100%" onclick="openOverlay(${top[2].mid})"></div>
		</div>
	</div>
</div>
<br>

<!-- Text -->
<h3>Popular Now</h3>
<!-- Secondary Line up -->
<div class="card-deck">
  <div class="card-body" id="${mid[0].mid}">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body" id="${mid[1].mid}">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body" id="${mid[2].mid}">
    <img class="card-img-top"src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
</div>
  <h3>Watch Now</h3>
<div class="card-deck">
  <div class="card-body" id="${mid[3].mid}">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body" id="${mid[4].mid}">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body" id="${mid[5].mid}">
    <img class="card-img-top"src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
</div>
<div id="overlay">
<div id="overlayform"></div>
</div>
<div id="openDiv" class="containter" style="width:50%; height:100%; top:20%; background-color:white; position:absolute; z-index:5; overflow:scroll">
	<form class="form">
		<input id="movName" class="form-control" name="contents" type="text" style="height:400px"><br>
		<label>줄거리</label>
		<input id="movContents" class="form-control" name="contents" type="text" style="height:300px"><br>
		<label>상영시간</label>
		<input id="movTime" class="form-control" name="runtime" type="text"><br>
		<label>조회 수</label>
		<input id="movView" class="form-control" name="viewcnt" type="text"><br>
		<button type="button" id="closeBtn" class="btn">Close</button>
	</form>
</div>
</body>
<script>

$("#openDiv").hide();
function openOverlay(mid){
	console.log(mid);
	$(this).on("click", function(){
		$("#overlay").css("display", "block");
		$("#openDiv").show();
		$.ajax({
			url : "board/detail/"+mid,
			type : "post",
			success : function(result){
				$("#movName").val(result.name);
				$("#movContents").val(result.contents);
				$("#movTime").val(result.runtime);
				$("#movView").val(result.viewcnt);
			},
			error : function(result){
				console.log("fail at all");
				alert("fail");
			}
		});
	});
}; 
$("#closeBtn").on("click", function(){
 	$("#overlay").css("display", "none");
	$("#openDiv").hide();
});
</script>
</html>