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
			<div class="statusbar">
				<a href="?sts=sts_pass" class="alert alert-success">通过: ${totalcount.sts_pass}</a> 
				<a  class="alert alert-info" href="?sts=sts_unprove">未审核：${totalcount.sts_unprove}</a>
				<a  class="alert"  href="?sts=sts_wait">待定：${totalcount.sts_wait}</a>
				<a  class="alert alert-error"  href="?sts=sts_reject">拒绝：${totalcount.sts_reject}</a>
				<span class="pull-right">
					<c:if test="${query_conf.sts!=null}">
						<a href="admin?sts=clear">全部</a>
					</c:if>
					<c:if test="${query_conf.start > 0}">
						<a href="admin?start=${query_conf.perviousstart}&limit=${query_conf.limit}">上一页</a>
					</c:if>&nbsp;
					<c:if test="${query_conf.listsize >= query_conf.limit}">
						<a href="admin?start=${query_conf.nextstart}&limit=${query_conf.limit}">下一页</a>
					</c:if>
					<a href="search" class="btn">精确搜索</a>
				</span>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width:1%">#</th>
						<th style="width:15%">身份证号</th>
						<th style="width:9%">姓名</th>
						<th style="width:8%">性别</th>
						<th style="width:20%">毕业学校</th>
						<th style="width:10%">状态</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dtstudent" items="${dtstudentlist}">
						<tr>
							<td>${dtstudent.nid}</td>
							<td>${dtstudent.pid}</td>
							<td>${dtstudent.name}</td>
							<td>${dtstudent.sex}</td>
							<td>${dtstudent.gradeschool}</td>
							<td>
									<fmt:message key="${dtstudent.sts}" />
							</td>
							<td>
							<a href="detail/${dtstudent.id}" class="btn btn-info">审阅</a>
							<a href="#" onClick="setDatetime(${dtstudent.id});" class="btn btn-success">通过</a>
							<a href="reject?id=${dtstudent.id}" class="btn btn-danger">拒绝</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
	      <input type="text" class="input-xlarge" id="interview" name="interview">
	    </div>
	    <div class="modal-footer">
	      <button aria-hidden="true" data-dismiss="modal" class="btn" type="button">取消</button>
	      <input type="submit" value="提交" class="btn btn-primary">
	    </div>
  	</form>
</div>
		<script src="assets/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap-alert.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap-modal.js"></script>
		<script  type="text/javascript">		
		function setDatetime(id){
			$('#id').attr("value",id);
			$('#winModal').modal({
				backdrop:true,
				keyboard:true,
				show:true
			});
	}</script>
</html>

