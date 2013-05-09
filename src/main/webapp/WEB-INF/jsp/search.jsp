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
		<div class="logo">
			<img class="pull-left" src="assets/img/logo.png">
			<div class="pull-left title">自荐招生系统</div>
			<div>
				<a href="logout" class="pull-right">注销</a>
			</div>
		</div>

		<div class="wrapper container">

			<form id="form" class="form-horizontal" action="search" method="POST" id="searchForm">
				<fieldset>
					<legend>输入搜索条件
						<a class="pull-right btn" href="admin" >返回列表</a>
					</legend>
					<div class="control-group">
						<label for="name" class="control-label">姓名</label>
						<div class="controls">
							<input type="text" id="name" name="name" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label for="number" class="control-label">中考报名号</label>
						<div class="controls">
							<input type="text" id="number" name="number" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label for="pid" class="control-label">身份证号码</label>
						<div class="controls">
							<input type="text" id="pid" name="pid" class="input-xlarge">
						</div>
					</div>
					<div class="control-group">
						<label for="gradeschool" class="control-label">毕业院校</label>
						<div class="controls">
							<input type="text" id="gradeschool" name="gradeschool" class="input-xlarge">
						</div>
					</div>
					<span id="inputAlert"  class="help-inline hidden"></span>
					<div class="form-actions">
						<button class="btn btn-primary" type="submit">查询</button>
						<!-- <a class="btn btn-primary" id="ajaxbtn">ajax查询</a> -->
					</div>
				</fieldset>
			</form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>中考报名号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>毕业学校</th>
						<th>当前状态</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="resultTbody">
					<c:forEach var="dtstudent" items="${dtstudentlist}">
						<tr>
							<td>${dtstudent.pid}</td>
							<td>${dtstudent.name}</td>
							<td>${dtstudent.sex}</td>
							<td>${dtstudent.gradeschool}</td>
							<td>
								<fmt:message key="${dtstudent.sts}" />
							</td>
							<td>
								<a href="detail/${dtstudent.id}" class="btn btn-info" target="_blank">审阅</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="result"></div>
		</div>
		<div data-backdrop="false" tabindex="-1" class="modal fade hide in model-size" id="winModal" >
			<form action="pass" method="post">
				<input type="hidden" value="sts_pass" id="action" name="action">
				<input type="hidden" id="id" name="id">
				<div class="modal-header">
					<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
					<h3 id="myModalLabel">设定面试时间</h3>
				</div>
				<div class="modal-body">
					<input type="text" class="input-xlarge" id="interview" name="interview"></div>
				<div class="modal-footer">
					<button aria-hidden="true" data-dismiss="modal" class="btn" type="button">取消</button>
					<input type="submit" value="提交" class="btn btn-primary"></div>
			</form>
		</div>
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/jquery.validate.js"></script>
		<script src="assets/js/bootstrap-alert.js"></script>
		<script src="assets/js/bootstrap-modal.js"></script>
		<script  type="text/javascript">
		$(function() {
		    $("form").submit(function() {
		        alert($("#name").attr("value"));
		        if ($("#name").attr("value") == "" && $("#number").attr("value") == "" && $("#pid").attr("value") == "" && $("#gradeschool").attr("value") == "") {
		            $("#inputAlert").removeClass("hidden");
		            $("#inputAlert").addClass("error");
		            $("#inputAlert").html("请起码输入一个查询条件");
		            return false;
		        }
		        var reg = new RegExp("[@/'\"#$%&^*]+");
		        if (reg.test($("#name").attr("value"))||reg.test($("#number").attr("value"))||reg.test($("#pid").attr("value"))||reg.test($("#gradeschool").attr("value"))
		        	) {
		            $("#inputAlert").removeClass("hidden");
		            $("#inputAlert").addClass("error");
		            $("#inputAlert").html("请不要输入特殊字符[@/'\"#$%&^*]+");
		            return false;
		        }
	
		    });
		});
		< /script>
	</html>