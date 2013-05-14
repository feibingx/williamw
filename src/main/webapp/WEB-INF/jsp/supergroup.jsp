<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
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
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
	<style>
.statusbar{
	padding: 12px 0;
}
</style>
<body>
	<div class="page">
		
		<jsp:include page="/logo" />
		<div class="wrapper container">
			<div >
				<fmt:message key="${interview}" />
				<a href="${pageContext.request.contextPath}/supertable" class="pull-right">返回</a>
			</div>
				<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>中考报名号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>毕业学校</th>
						<th>确认</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="resultTbody">
					<c:forEach var="dtstudent" items="${dtstudentlist}">
						<tr>
							<td width="2%">${dtstudent.nid}</td>
							<td width="12%">${dtstudent.pid}</td>
							<td width="16%">${dtstudent.name}</td>
							<td width="8%">${dtstudent.sex}</td>
							<td width="32%">${dtstudent.gradeschool}</td>
							<td width="8%">
								<c:if test="${dtstudent.feedback == 'yes'}">
						 			<img src="${pageContext.request.contextPath}/assets/img/ok.png" alt="已反馈" style="width:20px"/>
								</c:if>
							</td>
							<td width="12%">
								<a href="../detail/${dtstudent.id}" class="btn btn-info" target="_blank">审阅</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="result"></div>
		</div>
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap-alert.js"></script>
		<script src="assets/js/bootstrap-modal.js"></script>
	</html>