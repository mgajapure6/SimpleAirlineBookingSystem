<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sidebar template</title>
<link rel='stylesheet' href='assets/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.13/css/all.css'>
<link rel="stylesheet" href="assets/css/dashboard-style.css">
<style type="text/css">
.sidebar-wrapper .sidebar-header .user-pic {
	height: 60px !important;
}

.sidebar-footer a>i {
	margin: 10px;
}

.sidebar-footer a>span {
	margin-top: 6px;
	margin-left: -10px;
}
</style>
</head>
<body>
	<div class="loading-div">
		<jsp:include page="../util/loading.jsp"></jsp:include>
	</div>
	<!-- partial:index.partial.html -->
	<div class="page-wrapper chiller-theme toggled">
		<a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
			<i class="fas fa-bars"></i>
		</a>
		<nav id="sidebar" class="sidebar-wrapper">
			<div class="sidebar-content">
				<div class="sidebar-brand">
					<a href="#">Indian Airline</a>
					<div id="close-sidebar">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div class="sidebar-header">
					<div class="user-pic">
						<img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg" alt="User picture">
					</div>
					<div class="user-info">
						<span class="user-name">
							Jhon
							<strong>Smith</strong>
						</span>
						<span class="user-role">Administrator</span>
						<span class="user-status">
							<i class="fa fa-circle"></i>
							<span>Online</span>
						</span>
					</div>
				</div>
				<!-- sidebar-header  -->
				<div class="sidebar-search">
					<div>
						<div class="input-group">
							<input type="text" class="form-control search-menu" placeholder="Search...">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="fa fa-search" aria-hidden="true"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
				<!-- sidebar-search  -->
				<div class="sidebar-menu">
					<ul>
						<li class="header-menu">
							<span>General</span>
						</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="fa fa-tachometer-alt"></i>
								<span>Dashboard</span>
								<span class="badge badge-pill badge-warning">New</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="#">
											Dashboard 1
											<span class="badge badge-pill badge-success">Pro</span>
										</a>
									</li>
									<li>
										<a href="#">Dashboard 2</a>
									</li>
									<li>
										<a href="#">Dashboard 3</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="fa fa-shopping-cart"></i>
								<span>E-commerce</span>
								<span class="badge badge-pill badge-danger">3</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="#">Products </a>
									</li>
									<li>
										<a href="#">Orders</a>
									</li>
									<li>
										<a href="#">Credit cart</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="far fa-gem"></i>
								<span>Components</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="#">General</a>
									</li>
									<li>
										<a href="#">Panels</a>
									</li>
									<li>
										<a href="#">Tables</a>
									</li>
									<li>
										<a href="#">Icons</a>
									</li>
									<li>
										<a href="#">Forms</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="fa fa-chart-line"></i>
								<span>Charts</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="#">Pie chart</a>
									</li>
									<li>
										<a href="#">Line chart</a>
									</li>
									<li>
										<a href="#">Bar chart</a>
									</li>
									<li>
										<a href="#">Histogram</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="sidebar-dropdown">
							<a href="#">
								<i class="fa fa-globe"></i>
								<span>Maps</span>
							</a>
							<div class="sidebar-submenu">
								<ul>
									<li>
										<a href="#">Google maps</a>
									</li>
									<li>
										<a href="#">Open street map</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="header-menu">
							<span>Extra</span>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-book"></i>
								<span>Documentation</span>
								<span class="badge badge-pill badge-primary">Beta</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-calendar"></i>
								<span>Calendar</span>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="fa fa-folder"></i>
								<span>Examples</span>
							</a>
						</li>
					</ul>
				</div>
				<!-- sidebar-menu  -->
			</div>
			<!-- sidebar-content  -->
			<div class="sidebar-footer">
				<a href="#">
					<i class="fa fa-bell"></i>
					<span class="badge badge-pill badge-warning notification">3</span>
				</a>
				<a href="#">
					<i class="fa fa-envelope"></i>
					<span class="badge badge-pill badge-success notification">7</span>
				</a>
				<a href="#">
					<i class="fa fa-cog"></i>
					<span class="badge-sonar"></span>
				</a>
				<a href="${pageContext.request.contextPath }/logout">
					<i class="fa fa-power-off"></i>
				</a>
			</div>
		</nav>
		<!-- sidebar-wrapper  -->
		<main class="page-content">
		<div class="container-fluid">
			<h2>Indian Airline</h2>
			<hr>
			<div class="row">
				<div class="form-group col-md-12">
					<p>This is a responsive sidebar template with dropdown menu based on bootstrap 4 framework.</p>
					<p>
						You can find the complete code on
						<a href="javascript:;"> Github</a>
						, it contains more themes and background image option
					</p>
				</div>
			</div>
		</div>
		</main>
		<!-- page-content" -->
	</div>
	<!-- page-wrapper -->
	<!-- partial -->
	<script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/esm/popper.js'></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var user = JSON.parse(JSON.stringify(${user}));
		console.log('user', user);
		if(user.name.indexOf(' ')!=-1){
			$('.user-name').empty().html(user.name.split(' ')[0] +' <strong>'+user.name.split(' ')[1]+'</strong>')
		}else{
			$('.user-name').empty().html(' <strong>'+user.name+'</strong>')
		}
		

		$(".sidebar-dropdown > a").click(function() {
			$(".sidebar-submenu").slideUp(200);
			if ($(this).parent().hasClass("active")) {
				$(".sidebar-dropdown").removeClass("active");
				$(this).parent().removeClass("active");
			} else {
				$(".sidebar-dropdown").removeClass("active");
				$(this).next(".sidebar-submenu").slideDown(200);
				$(this).parent().addClass("active");
			}
		});

		$("#close-sidebar").click(function() {
			$(".page-wrapper").removeClass("toggled");
		});
		$("#show-sidebar").click(function() {
			$(".page-wrapper").addClass("toggled");
		});
	</script>
</body>
</html>