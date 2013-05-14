<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>大同中学自荐招生系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/docs.css"
	rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<style type="text/css">
.wrapper{
	padding: 120px 20px 20px 20px;
}
.resultx{
	margin: 40px 0;
	background: #EFEFF2; 
	padding: 30px;  
	width: 800px; 
	border-radius: 7px; 
	box-shadow: 0px 0px 10px #AAA;
	min-height: 80px;
	font-size: 24px;
	line-height: 32px;
	font-family: "KaiTi";
}
</style>
</head>
<body>

	<div class="page">
		<div class="logo">
			<a href="login" class="titlea">
			<img class="pull-left title" src="${pageContext.request.contextPath}/assets/img/logo.png">
			</a>
			<div class="pull-left title">自荐招生系统</div>
			<a href="${pageContext.request.contextPath}/logout" class="pull-right">注销</a>
		</div>
		<div class="wrapper">
			<div class="resultx">
					<p><fmt:message key="${dtstudent.resultmsg}" /></p>
					<c:if test="${dtstudent.sts == 'sts_pass' || dtstudent.sts == 'sts_echo'}">
						<p> 面试时间：<fmt:message key="${dtstudent.interviewtime}" /></p>						 
					</c:if>
					<c:if test="${dtstudent.sts == 'sts_pass' && dtstudent.feedback==null}">
					<form action="../result/${dtstudent.id}" method="post">
						<input type="submit" class="btn btn-primary btn-large" value="我会准时参加面试" />
					</form>						
					</c:if>					
			</div>
		</div>
	</div>


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-transition.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-alert.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-modal.js"></script>

	</body>
</html>