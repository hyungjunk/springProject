<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<!-- Logo -->
	<nav class="navbar navbar-fixed-top navbar-dark bg-dark">
		<div class="navbar-header pull-left">
			<a class="navbar-brand" href="/mov/board"><h3>CopCha</h3></a> 
			<c:if test="${login.uid == 'admin'}">
				<a href="/admin"> Admin </a>
			</c:if>
		</div>
		<div class="navbar-header pull-right">
		  <c:if test="${login == null}">
		  	<button type="button" class="btn btn-primary btn-small" data-toggle="modal" data-target="#myModal">Login</button>
		  </c:if>
		  <c:if test="${login != null}">
		  	<button type="button" class="btn btn-primary btn-small" onclick="self.location='user/mypage'">
		  	<span class="fa fa-user"></span>
		  	My Page
		  	</button>
		  	<button type="button" class="btn btn-primary btn-small" onclick="self.location='/user/logout'">
		  	<span class="fa fa-sign-out"></span>
		  	Logout</a>
		  	</button>
		  </c:if>
		</div>
	</nav>
	<!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Login to Your Account</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        	<form role="form" action="/user/loginPost" method="post">
            <div class="form-group">
              <label for="ID"><span class="fa fa-user"></span> Username</label>
              <input type="text" class="form-control" name ="uid" placeholder="Enter ID">
            </div>
            <div class="form-group">
              <label for="Password"><span class="fa fa-eye"></span> Password</label>
              <input type="password" class="form-control" name ="upw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="fa fa-sign-in"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
</body>
</html>