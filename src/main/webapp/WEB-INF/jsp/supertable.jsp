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
.statusbar {
	padding: 12px 0;
}
</style>
<body>
	<div class="page">
		<div class="logo"><a href="login" class="titlea">
			<img class="pull-left" src="assets/img/logo.png"></a>
			<div class="pull-left title">自荐招生系统</div>
			<div><a href="logout" class="pull-right">注销</a></div>
		</div>

		<div class="wrapper container">
			<div class="row">
			<c:forEach var="timetable" items="${timetablelist}">
				<div class="span4">
					<a href="supertable" >${timetable.title}</a>					
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>姓名</th>
							</tr>
						</thead>
						<tbody id="resultTbody">
							<c:forEach var="dtstudent" items="${timetable.dtstuentlist}">							
								<tr>
									<td>${dtstudent.nid}</td>
									<td>${dtstudent.name}</td>
									<td>${dtstudent.sts}</td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
					
				</div>
			</div>
			</c:forEach>

			<div id="result"></div>
		</div>
	</div>
</body>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery.validate.js"></script>
<script src="assets/js/bootstrap-alert.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
</html>