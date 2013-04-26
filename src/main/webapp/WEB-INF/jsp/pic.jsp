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

<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<link rel="shortcut icon" href="assets/ico/favicon.ico">
<style>
.fileinput {
	border: medium none;
	background: none repeat scroll 0% 0% transparent;
	outline: medium none;
	position: static;
	opacity: 0;
	width: 75px;
	height: 25px;
	left: 0px;
	top: 0px;
	overflow: hidden;
}
.fileinput{
	width: 35px;
}
.picform{
	border-radius: 5px;
	width: 105px;
	height: 125px;
}
.upbtn{
	text-align: center;
	margin: 20px 15px 0 ;
}
</style>
</head>
<body>
	<div id="content" class="picform">
		<c:if test="${imgpath != null}">
			<img src="${imgpath}" />
		</c:if>
		<form name="form" action="pic" method="POST" enctype="multipart/form-data">
			<input id="fileToUpload" class="fileinput" name="fileToUpload" type="file" onchange="readURL(this);">
			<input class="upbtn btn" type="button" value="上传图片" onClick="javascript:document.getElementById('fileToUpload').click();"/>
		</form>
	</div>

	<script src="assets/js/jquery.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				$('form').submit();
			}
		}
		$(document).ready(function() {
			if($.browser.msie){
				$('form').append("<div id=\"filename\"> </div>");
				$('form').append("<input style=\"margin: 5px 30px ;\" type=\"submit\" value=\"提交\" >");

			}
			else{
				$('#content').append();
				$("#fileToUpload").addClass("fileinput");
			}
		});
	</script>

</body>
</html>
