<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>大同中学自主招生系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Author: William Wang -->
<!--  www.zhiweiwang.com  -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<link rel="shortcut icon" href="assets/ico/favicon.ico">
<style>
.fileinput {
	border: medium none;
	background: none repeat scroll 0% 0% transparent;
	outline: medium none;
	opacity: 0;
	overflow: hidden;
}
.fileinput-ie {
	border: medium none;
	background: none repeat scroll 0% 0% transparent;
	outline: medium none;
	margin: 20px 15px;
	width: 35px;
	height: 25px;
	left: 0px;
	top: 0px;
}
.picform{
	border-radius: 5px;
	width: 100px;
	height: 150px;
	border: 1px dashed #DFDFDF;
	margin: 5px;
}
.upbtn{
	text-align: center;
	margin: 40px 8px 0 ;
}
.delbtn{
	margin: -70px 23px 0;
	opacity: 0.5;
}
.submitbtn{
	margin: 20px 28px 0;
}
.imgclass{
	width: 100px;
	height: 150px;
}
body{
  padding: 0 !important;
}
</style>
</head>
<body>
	<div id="content" class="picform">
		<form name="form" action="pic" method="POST" enctype="multipart/form-data">
			<c:if test="${imgpath != null}">
				<img class="imgclass" src="${imgpath}" />
			</c:if>
			<c:if test="${imgpath == null}">
				<input class="pull-right" id="fileToUpload" name="fileToUpload" type="file" onchange="readURL(this);">
				<input id="onclickbtn" class="upbtn btn" type="button" value="上传图片"/>
				<input type="hidden" value="add" id="action" name="action" >
				<input type="submit" value="提交" id="submitbtn" class="btn submitbtn"  name="submitbtn" />
			</c:if>
			<c:if test="${imgpath != null}">
				<input class="delbtn btn" id="delbtn" name="delbtn" type="submit" value="删除"/>
				<input type="hidden" value="del" id="action" name="action" >
			</c:if>
			
		</form>

	</div>

	<script src="assets/js/jquery.js"></script>
	<script type="text/javascript">
		var filetype = new Array('jpg','jpeg','gif','png');
		function readURL(input) {
			if(input.files && input.files[0]){
				var file = input.files[0];
				for(var tp in filetype){
					var ftype = file.name.substring(file.name.lastIndexOf(".")+1).toLowerCase();
					if(filetype[tp] == ftype){
		            	$('form').submit();
		            	return;	
					}
				}
				alert("只能上传JPG、PNG、GIF文件");
			}
		}
		$(document).ready(function() {
			if($.browser.msie){
				$("#onclickbtn").addClass("hidden");
				$("#fileToUpload").addClass("fileinput-ie");
			}
			else{
				$("#fileToUpload").addClass("fileinput");
				$("#submitbtn").addClass("hidden");
				$("#onclickbtn").bind("click", function(){
					document.getElementById('fileToUpload').click();
				});
				$("#delbtn").mouseover(function(){
					this.style.opacity=1;
				}).mouseout(function(){
					this.style.opacity=0.5;
				});
			}
		});
	</script>

</body>
</html>
