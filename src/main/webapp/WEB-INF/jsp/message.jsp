<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>大同中学自主招生系统</title>
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
</head>
<style>
.container{
	padding-top: 200px;
}
.message{

}
</style>
<body>
	<div class="page">
		<div class="logo">
		<img class="pull-left" src="assets/img/logo.png">
		<div class="pull-left title">自主招生系统</div>
		<div>
			<a href="logout" class="pull-right">注销</a>
		</div>
	</div>
		<div class="wrapper container">
			<div class="hero-unit">
				<c:if test="${errmessage!=null && fn:length(errmessage)>0}">
					<div class="help-inline error">
						<fmt:message key="${errmessage}" />
					</div>
				</c:if>
			</div>
			<div>	
					<c:if test="${fn:startsWith(errmessage, \"search_\")}"><a href="admin">返回</a></c:if>
					<c:if test="${fn:startsWith(errmessage, \"search\")== false}"><a href="fillin">返回</a>
					</c:if></div>
		</div>
		<script src="assets/js/jquery.js"></script>
</html>

