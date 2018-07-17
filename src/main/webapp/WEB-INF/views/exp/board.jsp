<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    cursor: pointer;
}

#overlayform{
 	width: 800px; 
 	height: 800px; 
 	background-color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    color: white;
    transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
}
</style>
</head>
<body style="height:1000px">
<div class="col bg-dark text-white" style="width:100%; padding-left:0px; overflow:hidden">
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
<p><h5>Yolo world</h5></p>
</div>
<!-- Movie Curation -->
<div style="overflow:hidden">
	<div class="row">
		<div class="col-3">
			<div class="card" style="height:600px; background-color:green;">
			Ranking<br>
			Some ranking goes here.
			</div>
		</div>
		<div class="col-6">
			<div class="card" style="height:600px">
			<img src="https://dummyimage.com/530x450/078736/fff.png">
			<div class="card-body bg-light">
		      <h5 class="card-title">Card title that wraps to a new line</h5>
		      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		    </div>
			</div>
		</div>
		<div class="col-3">
			<div class="card"><img class="poster" src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1529024278/wre0ikxt1tucs9nujmn2.jpg" width="100%"></div>
			<div class="card"><img class="poster" src="https://dhgywazgeek0d.cloudfront.net/watcha/image/upload/c_fill,h_400,q_80,w_280/v1529024278/wre0ikxt1tucs9nujmn2.jpg" width="100%"></div>
		</div>
	</div>
</div>
<br>

<!-- Text -->
<div>heeeeeeeeeeeeee</div>
<br>
<!-- Secondary Line up -->
<div class="card-deck">
  <div class="card-body">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body">
    <img class="card-img-top" src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
  <div class="card-body">
    <img class="card-img-top"src="https://dummyimage.com/277x200/078736/fff.png" alt="Card image cap">
  </div>
</div>
<div id="overlay">
	<div id="overlayform"></div>
	<div><button id="closeBtn">Close</button></div>
</div>
<button id="overlayBtn">Turn on overlay effect</button>
</body>
<script>

$("#overlayBtn").on("click", function(){
	$(this).hide();
	$("#overlay").css("display", "block");
	$("#overlayform").load("overlayPop");
    $.ajax({
    	type : "GET",
    	url : "/tight/getDetail",
    	data : "text",
    	success : function(msg){
    		if (msg == "SUCCESS"){
    			console.log(msg);
    		} else {
    			alert("fail");
    		}
    	}
    })
})
$("#closeBtn").on("click", function(){
	$("#overlay").css("display", "none");
	$("#overlayform").empty("overlayPop");
	$(overlayBtn).show();
})
</script>
</html>