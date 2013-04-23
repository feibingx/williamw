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
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<style>
.container {
	padding-top: 200px;
}

.message {
	
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
		<div>
			<a href="admin?start=${query_conf.nextstart}&limit=${query_conf.limit}">下一页</a>&nbsp;
			<a href="admin?start=${query_conf.perviousstart}&limit=${query_conf.limit}">上一页</a>
		</div>
		<div class="wrapper container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>中考报名号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>毕业学校</th>
						<th>当前状态
							<c:if test="${query_conf.sts!=null}">
								<a href="admin?sts=null">全部</a>
							</c:if>
						</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dtstudent" items="${dtstudentlist}">
						<tr>
							<!-- <div class="list-avatar"> -->
							<%-- 	<a href="?businessmanId=${dtstudent.id}"> --%>
							<%-- 		<img src="assets/img/user-icon.png"> <span> <b>${businessman.name}</b> --%>
							<!-- 	</span> </a> -->
							<!-- </div> -->
							<td>${dtstudent.pid}</td>
							<td>${dtstudent.name}</td>
							<td>${dtstudent.sex}</td>
							<td>${dtstudent.gradeschool}</td>
							<td>
								<c:if test="${dtstudent.sts!=null && fn:length(dtstudent.sts)>0}">
									<a href="admin?sts=${dtstudent.sts}">${dtstudent.sts}</a>
								</c:if>
								<c:if test="${dtstudent.sts==null || fn:length(dtstudent.sts)<1}">
									<a href="admin?sts=未审核">error</a>
								</c:if>
							</td>
							<td>
							<a href="detail/${dtstudent.id}" class="btn btn-info">审阅</a>
							<a href="detail/${dtstudent.id}" class="btn btn-success">通过</a>
							<a href="#${dtstudent.id}" class="btn btn-danger">拒绝</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script src="assets/js/jquery.js"></script>
</html>

