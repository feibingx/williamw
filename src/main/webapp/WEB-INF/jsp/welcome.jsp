<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">
<head>
<meta charset="utf-8">
<title>Great Banker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
	<div class="page">
		<div class="logo">
			<img src="assets/img/logo.png">
		</div>
		<div class="wrapper container-fluid">
			<div class="row-fluid result">
				<div class="dialog panel pull-left">
					<div class="maininfo">
						<div class="welcome-info">
							<!-- welcome begin -->
							<h2>
								欢迎光临! <strong>大银行家</strong>
							</h2>
							<h3>在这里你可以实现你的财富梦想，缔造自己的财富王国</h3>
							<h3>赶快来体验吧！</h3>
							<img class="pull-right" src="assets/img/welcomegirl.png">
							<!-- welcome end -->
						</div>
					</div>
				</div>

				<jsp:include page="/businessman/applying" />
			</div>
			<jsp:include page="/banker/${sessionScope.banker.id}" />

			<!-- Le javascript ============================================ -->
			<!-- Placed at the end of the document so the pages load faster -->
			<script src="assets/js/jquery.js"></script>
			<script src="assets/js/bootstrap-transition.js"></script>
			<script src="assets/js/bootstrap-alert.js"></script>
			<script src="assets/js/bootstrap-modal.js"></script>
			<script src="assets/js/bootstrap-dropdown.js"></script>
			<script src="assets/js/bootstrap-scrollspy.js"></script>
			<script src="assets/js/bootstrap-tab.js"></script>
			<script src="assets/js/bootstrap-tooltip.js"></script>
			<script src="assets/js/bootstrap-popover.js"></script>
			<script src="assets/js/bootstrap-button.js"></script>
			<script src="assets/js/bootstrap-collapse.js"></script>
			<script src="assets/js/bootstrap-carousel.js"></script>
			<script src="assets/js/bootstrap-typeahead.js"></script>
			<script src="assets/js/application.js"></script>
</body>
</html>
