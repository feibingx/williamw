<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <title>大同中学自荐招生系统</title>
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
			<div class="pull-left title">自荐招生系统</div>
		</div>
  <div class="centerw wrapper">
<!--      <div class="row-fluid">-->
            <!-- form begin -->
            <form class="form-horizontal" action="register" id="theform" method="post">
            	<div class="control-group">
            		欢迎注册
            	</div>
				<div class="control-group">
					<label class="control-label" for="inputEmail">用户名</label>
					<div class="controls">
						 <input type="text" id="username" name="username" placeholder="请输入姓名" class="input-large" title="请使用真实姓名加身份证号码后四位为用户名" data-content="如：王小明1234" data-placement="right" data-toggle="popover" rel="popover" >
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
					}
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
					   }
				}
			});
    });

        //$('#username').focus(function(){
            $('#username').popover();
        //});
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
