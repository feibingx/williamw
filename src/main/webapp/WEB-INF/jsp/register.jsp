<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
    .wrapper {margin:auto; height: auto 220px; background: #FFF; padding: 20px; width: 400px; border-radius: 10px; box-shadow: 0px 2px 15px #666}
    .form-search-pad{ background-color: white; margin: 0 auto; width: auto;}
    .form-action {margin-bottom: 10px;margin-top: 0px;padding: 7px 109px 8px;}
    .form-btn {background-color: #79C3D4 !important;}
    .error {color: #B94A48;}
    .control-label{ width: 90px !important;}
    .controls {margin-left: 100px !important;;}
    </style>
  </head>
<body>
<div class="page">
  <div class="logo">
    <img src="assets/img/logo.png">
  </div>
  <div class="wrapper">
<!--      <div class="row-fluid">-->
            <!-- form begin -->
            <form class="form-horizontal" action="register" id="theform" method="post">
				<div class="control-group">
					<label class="control-label" for="inputEmail">用户名</label>
					<div class="controls">
						 <input type="text" id="username" name="username" placeholder="请输入姓名" class="input-large">
					<span id="input01alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="inputPassword">密码</label>
					<div class="controls">
						<input type="password" id="passwd" name="passwd" placeholder="请输入密码" class="input-large">
					<span id="input02alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="inputPassword">重复密码</label>
					<div class="controls">
						<input type="password" id="passwd2" name="passwd2" placeholder="请输入密码" class="input-large">
					<span id="input03alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>
				<div class="control-group">
			    	<label class="control-label" for="inputPassword">电子邮件</label>
					<div class="controls">
						<input type="email" id="email" name="email" placeholder="请输入电子邮件" class="input-large">
					<span id="input04alert"  class="help-inline hidden">不能为空</span>
					</div>
				</div>		
				<div class="control-group">
					
					<div class="controls">
						<input type="checkbox" id="readed" name="readed" />我已阅读xxx
						<span class="help-inline hidden" ></span>
						<button id="submitbtn" type="submit" class="btn">注册</button>
					</div>
				</div>
			</form>
            <!-- form end-->
   
<!--      </div>-->
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
					passwd : {required: true, minlength: 5},
					passwd2: {required:true, minlength: 5,equalTo: "#passwd"},
					email: {
					    required: true
					    ,email: true
					},
					readed: "required"
				},
				messages : {
					username : "必填",
					email: {
					    required: "请输入Email地址"
					    ,email: "请输入正确的email地址"
					},
					   passwd: {
					    required: "请输入密码",
					    minlength: jQuery.format("密码不能小于{0}个字 符")
					   },
					   passwd2: {
					    required: "请输入确认密码",
					    minlength: "确认密码不能小于5个字符",
					    equalTo: "两次输入密码不一致不一致"
					   },
					   readed: "请确认真实有效"
				}
			});
    });

        $('#username').blur(function() {
    		
        	$.get("./getUser", {username: $("#username").attr("value") }, function (data, textStatus){
                if(data=="true"){
                	$("#input01alert").removeClass("hidden");
                    $("#input01alert").addClass("error");
                    $("#input01alert").html("用户名已存在，请重新选择一个");
                    $("#submitbtn").addAttr("disabled");
                }else if($("#input01alert").hasClass("error")){
                	$("#input01alert").removeClass("error");
                	$("#input01alert").html("该用户名可以使用");
                	$("#input01alert").addClass("alert");
                	if($('#readed').attr("checked")==null)
                 		$("#submitbtn").addAttr("disabled");
                 	else
                 		$("#submitbtn").removeAttr("disabled");
                }
            });
		});
 
    </script>

  </body>
</html>
