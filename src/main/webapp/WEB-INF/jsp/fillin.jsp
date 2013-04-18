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
            <form class="form-horizontal" action="fillin" method="post">
                <table class="table">
                    <tbody>
                        <tr></tr>
                </tbody>
                </table>
			</form>
            <!-- form end-->
   
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
            if( $("#username").attr("value") == ""){
                $("#input01alert").removeClass("hidden");
                $("#input01alert").addClass("error");
                $("#input01alert").html("用户名不能为空");
                return false;
            }
            
            if( $("#passwd").attr("value") == ""){
                $("#input02alert").removeClass("hidden");
                $("#input02alert").addClass("error");
                $("#input02alert").html("密码不能为空");
                return false;
            }
            if( $("#passwd").attr("value").length < 1){
                $("#input02alert").removeClass("hidden");
                $("#input02alert").addClass("error");
                $("#input02alert").html("请输入6位以上密码");
                return false;
            }
            if( $("#passwd").attr("value")!=$("#passwd2").attr("value") ){
           	 $("#input03alert").removeClass("hidden");
                $("#input03alert").addClass("error");
                $("#input03alert").html("两次输入的密码不一致");
                return false;
           }
            if( $("#email").attr("value") == ""){
                $("#input04alert").removeClass("hidden");
                $("#input04alert").addClass("error");
                $("#input04alert").html("Email不能为空");
                return false;
            }

            
            return isvalid;
        });

        $('#username').blur(function() {
    		
        	$.get("./getUser", {username: $("#username").attr("value") }, function (data, textStatus){
                if(data=="true"){
                	$("#input01alert").removeClass("hidden");
                    $("#input01alert").addClass("error");
                    $("#input01alert").html("用户名已存在，请重新选择一个");
                    $("#submitbtn").addAttr("disabled");
                    userexist = true;
                }else if($("#input01alert").hasClass("error")){
                	$("#input01alert").removeClass("error");
                	$("#input01alert").html("该用户名可以使用");
                	$("#input01alert").addClass("alert");
                	userexist = false;
                	if($('#readed').attr("checked")==null)
                 		$("#submitbtn").addAttr("disabled");
                 	else
                 		$("#submitbtn").removeAttr("disabled");
                }
            });
		});
		
        $('#readed').bind('click', function() {
        	if($('#readed').attr("checked")!="checked")
        		$("#submitbtn").addAttr("disabled");
        	else if(userexist == false)
        		$("#submitbtn").removeAttr("disabled");
		});
    });
    </script>

  </body>
</html>
