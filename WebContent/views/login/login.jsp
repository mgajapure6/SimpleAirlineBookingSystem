<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Indian Airline</title>
<!-- FONT  -->
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<!-- BASE CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/login-style.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<div class="loading-div">
		<jsp:include page="../util/loading.jsp"></jsp:include>
	</div>
	<div class="container-fluid full-height">
		<div class="row row-height">
			<div class="col-lg-8 content-left">
				<div class="content-left-wrapper">
					<a href="javascript:;" id="logo">
						<img src="assets/img/logo.png" alt="" width="49" height="35">
					</a>
					<div id="social">
						<ul>
							<li>
								<a href="javascript:;">
									<i class="icon-facebook"></i>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<i class="icon-twitter"></i>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<i class="icon-google"></i>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<i class="icon-linkedin"></i>
								</a>
							</li>
						</ul>
					</div>
					<!-- /social -->
					<div class="copy hide" style="color: #040404;">© 2019 - present by indian Airline</div>
				</div>
				<!-- /content-left-wrapper -->
			</div>
			<!-- /content-left -->
			<div class="col-lg-4 content-right" id="start">
				<div style="width: 100%">
					<!-- /top-wizard -->
					<form id="wrapped" method="POST" class="" id="loginForm">
						<h2 style="font-weight: 700;">Indian Airline</h2>
						<h3 class="main_question">Log in to your account</h3>
						<hr>
						<div class="form-group">
							<label class="">Role</label>
							<div class="styled-select clearfix">
								<select class="form-control required" name="role" id="selectRoleL">
									<option value="customer">Customer</option>
									<option value="manager">Manager</option>
									<option value="admin">Admin</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="">Username</label>
							<input type="text" id="usernameL" name="first_name" class="form-control required" placeholder="Username" >
						</div>
						<div class="form-group">
							<label class="">Password</label>
							<input class="form-control required" type="password" id="passwordL" name="passwordL" placeholder="Password" >
						</div>
						<div class="text-right mt-2">
							<a href="javascript:;" class="fp">Forgot Password?</a>
						</div>
						<div id="bottom-wizard">
							<button type="button" name="process" class="btn btn-info" style="width: 100% !important;" onclick="processLoginForm();">Submit</button>
						</div>
						<hr>
						<p class="mt-8" style="font-size: 1.1rem;">
							Need an account?
							<a href="javascript:;" style="font-weight: 600;">Create an account</a>
						</p>
						<div id="alert-div" style="margin-top: 15px;"></div>
					</form>
				</div>
				<!-- /Wizard container -->
				<div class="copy" style="color: #040404; padding-left: 50px;">© 2019 - present by indian Airline</div>
			</div>
			<!-- /content-right-->
		</div>
		<!-- /row-->
	</div>
	<!-- /container-fluid -->
	<script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function validateLoginForm(){
			if($('#usernameL').val()=="" && $('#passwordL').val()==""){
				$("#alert-div").empty().html('<div class=" alert alert-danger alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Please enter username and password !</strong></div>').show();
				$("#alert-div").fadeOut(2000);
				$('#usernameL').focus();
				return false;
			}else if($('#usernameL').val()==""){
				$("#alert-div").empty().html('<div class=" alert alert-danger alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Please enter username !</strong></div>').show();
				$("#alert-div").fadeOut(2000);
				$('#usernameL').focus();
				return false;
			}else if($('#passwordL').val()==""){
				$("#alert-div").empty().html('<div class=" alert alert-danger alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Please enter password !</strong></div>').show();
				$("#alert-div").fadeOut(2000);
				$('#passwordL').focus();
				return false;
			}else{
				return true;
			}
		}
		function processLoginForm(){
			var postParameters = {
					"role" : $('#selectRoleL').val(),
					"username" : $('#usernameL').val(),
					"password" : $('#passwordL').val()
			}
			console.log('postParameters:',postParameters)
			if(validateLoginForm()){
				$.ajax({
					url : "${pageContext.request.contextPath }/login",
					method : "post",
					data : {
						role : $('#selectRoleL').val(),
						username : $('#usernameL').val(),
						password : $('#passwordL').val()
					},
					success : function(resp){
						console.log('resp:',resp);
						if(resp.status=="success"){
							$("#alert-div").empty().html('<div class=" alert alert-success alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Login Success !</strong></div>').show();
							window.location.href = "${pageContext.request.contextPath }/"+resp.path;
						}else{
							
							$("#alert-div").empty().html('<div class=" alert alert-danger alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Invalid username or password !</strong></div>').show();
							$("#alert-div").fadeOut(2000);
						} 
					},
					error : function(){
						alert("Internal Server error.")
					}
				});
			}
		}
	</script>
</body>
</html>