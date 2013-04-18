<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <title>Great Banker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <style type="text/css">
    body {padding-top: 20px; font-family: "Microsoft Yahei"}
    .page {margin: 0 auto; max-width: 1000px;}
    .logo {margin-bottom: 100px; }
    .wrapper {margin:auto; height: 160px; background: #FFF; padding: 20px; width: 400px; border-radius: 10px; box-shadow: 0px 2px 15px #666}
    .form-search-pad{ background-color: white; margin: 0 auto; width: auto;}
    .form-action {margin-bottom: 10px;margin-top: 0px;padding: 7px 109px 8px;}
    .form-btn {background-color: #79C3D4 !important;}
    .error {color: #B94A48;}
    .control-label{ width: 90px !important;}
    .controls {margin-left: 100px !important;;}
    .errmsg{ margin-left: 100px;}
    </style>
  </head>
<body>
<div class="page">
  <div class="logo">
    <img src="assets/img/logo.png">
  </div>
  <div class="wrapper">
<!--      <div class="row-fluid">-->
            <!-- login form begin -->
            <c:if test="${errmessage!=null && fn:length(errmessage)>0}">  
			    <div class="help-inline error"><fmt:message key="${errmessage}" /></div>
			</c:if>  
            
            <form class="form-horizontal" action="login" method="post">
				<div class="control-group">
					<label class="control-label" for="inputEmail">用户名</label>
					<div class="controls">
						 <input type="text" id="name" name="name" placeholder="请输入姓名" class="input-large">
					<span id="input01alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input type="password" id="password" name="password" placeholder="请输入密码" class="input-large">
					<span id="input02alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>				
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn">登录</button>
						<span class="help-inline hidden">nbsp;</span>
						<a href="register">注册</a>
						<span class="help-inline hidden">nbsp;</span>
						<a href="#">忘记密码</a>
					</div>
				</div>
			</form>
            <!-- login form end-->
   
<!--      </div>-->
    </div>

</div>

    <!-- Le javascript
    ================================================== -->
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
    <script>
        $(function(){
        $("form").submit(function(){
            if( $("#name").attr("value") == ""){
                $("#input01alert").removeClass("hidden");
                $("#input01alert").addClass("error");
                $("#input01alert").html("用户名不能为空");
                return false;
            }
            if( $("#password").attr("value") == ""){
                $("#input02alert").removeClass("hidden");
                $("#input02alert").addClass("error");
                $("#input02alert").html("密码不能为空");
                return false;
            }
            return true;
        });

        
    });
    </script>

  </body>
</html>
