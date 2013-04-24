<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <style type="text/css">
    .wrapper {margin:auto; height: auto 220px; background: #FFF; width: 400px; }
    .error {color: #B94A48;}
    .control-label{ width: 90px !important;}
    .controls {margin-left: 100px !important;;}
    </style>
  </head>
<body>
<div class="page">
  <div class="logo">
			<img class="pull-left title" src="assets/img/logo.png">
			<div class="pull-left title">自主招生系统 管理后台</div>
			<a href="login" class="pull-right">普通登录</a>
		</div>
  <div class="centerw wrapper">
<!--      <div class="row-fluid">-->
            <!-- form begin -->
            <c:if test="${errmessage!=null && fn:length(errmessage)>0}">
					<div class="help-inline error">
						<fmt:message key="${errmessage}" />
					</div>
			</c:if>
            <form class="form-horizontal" action="superadmin" id="theform" method="post">
            	<div class="control-group">
            		本后台用于管理员将普通用户设置为审核员
            	</div>
				<div class="control-group">
					<label class="control-label" for="username">用户名</label>
					<div class="controls">
						 <input type="text" id="username" name="username" placeholder="请输入" class="input-large">
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="role">真实姓名</label>
					<div class="controls">
						<input type="role" id="role" name="role" placeholder="请输入" class="input-large">
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="inputPassword">身份</label>
					<div class="controls">
						<input type="radio" id="action" name="action" value="enable" class="input-large"> 设置为审核员
						<input type="radio" id="action" name="action" value="unable" class="input-large"> 设置为普通用户
					</div>
				</div>		
				<div class="control-group">					
					<div class="controls">
						<button id="submitbtn" type="submit" class="btn">设置</button>
					</div>
				</div>
			</form>
            <!-- form end-->
    </div>
</div>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
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
    <script>
    $(document).ready(function() {
			$("#theform").validate({
				rules : {
					username : "required",
					role: "required",
					action:"required"
				},
				messages : {
					username : "必填",
					role: "必填",
					action:"必选"
				}
			});
    });

    $('#username').blur(function() {
		
    	$.get("./getUser", {username: $("#username").attr("value") }, function (data, textStatus){
            if(data=="false"){
            	$("#input01alert").removeClass("hidden");
                $("#input01alert").addClass("error");
                $("#input01alert").html("用户名不存在，无法设置该用户");
                $("#submitbtn").addAttr("disabled");
            }else if($("#input01alert").hasClass("error")){
            	$("#input01alert").addClass("hidden");
            	$("#submitbtn").removeAttr("disabled");
            }
        });
	});
 
    </script>

  </body>
</html>
