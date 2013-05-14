<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>大同中学自荐招生系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/docs.css"
	rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<style type="text/css">
body{
	padding:0;
}

tr td {
	padding: 5px;
	margin: 2px;
	text-align: left;
	border: solid 1px #888888 !important;
}

table {
	width: 790px;
	max-width: 790px;
}

p{max-width: 780px;}
.wrapper div {
	text-align: center;
	margin: 2px auto;
}

.model-size{
	width: 320px;
	margin:-200px 0 0 -160px;
}
.wrapper{
	padding: 120px 20px 20px 20px;
}

</style>
</head>
<body>	

	<div class="page">
		<div class="logo">
			<a href="login" class="titlea"><img class="pull-left title" src="assets/img/logo.png"></a>
			<div class="pull-left title">自荐招生系统</div>
			<a href="logout" class="pull-right">注销</a>
		</div>
		<div class="wrapper">
			<div class="btn-banner">
				<a href="result/${dtstudent.id}" class="btn btn-large btn-primary">查看审核结果</a>
			</div>			
			<!--startprint-->
			<a class="btn pull-right print-btn" href="print/${dtstudent.id}">打印</a>
			<table>
					<tr>
						<td style="width:15%">姓名</td>
						<td>${dtstudent.name}</td>
						<td>性别</td>
						<td> ${dtstudent.sex} </td>
						<td>政治面貌</td>
						<td>${dtstudent.policy}</td>
						<td rowspan="5" style="width:110px;">
							<iframe src="pic/${dtstudent.id}" width="110" height="160" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
						</td>
					</tr>
					<tr>
						<td>毕业区县</td>
						<td>${dtstudent.gradesection}</td>
						<td>身体状况</td>
						<td>${dtstudent.healthy}</td>
						<td>中考报名号</td>
						<td>${dtstudent.number}</td>
					</tr>
					<tr>
						<td>毕业学校</td>
						<td colspan="5">${dtstudent.gradeschool}</td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td colspan="5">${dtstudent.birthyear}年${dtstudent.birthmonth}月${dtstudent.birthday}日</td>
					</tr>					
					<tr>
						<td>户口所在地</td>
						<td colspan="5">${dtstudent.city}</td>
					</tr>				
				</table>
				<table>
					<tr>
						<td style="width:15%">家庭住址</td>
						<td colspan="5">${dtstudent.address}</td>
					</tr>
					<tr>
						<td>邮政编码</td>
						<td style="width:33%">${dtstudent.addcode}</td>
						<td rowspan="2"  style="width:10%">联系方式</td>
						<td colspan="1"  style="width:7%">电话</td>
						<td >${dtstudent.phone}</td>
					</tr>
					<tr>
						<td>身份证号码</td>
						<td>${dtstudent.pid}</td>
						<td>手机</td>
						<td>${dtstudent.cell}</td>
					</tr>
				</table>
			<!-- form end-->
		</div>
	</div>


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-transition.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-alert.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-modal.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-dropdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-scrollspy.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-tab.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-tooltip.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-popover.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-button.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-collapse.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap-typeahead.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/application.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/editor_config.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/editor_all.js"></script>
	<script type="text/javascript">
		function doPrint() {
			bdhtml = window.document.body.innerHTML;
			sprnstr = "<!--startprint-->";
			eprnstr = "<!--endprint-->";
			prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
			prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
			window.document.body.innerHTML = prnhtml;
			window.print();
		}

		function setDatetime(){
				$('#winModal').modal({
					backdrop:true,
					keyboard:true,
					show:true
				});
		}
	</script>
</body>
</html>