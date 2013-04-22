<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>大同中学自主招生系统</title>
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
input {
	border: 0px #000000 !important;
	font-family: "FangSong";
	font-size: 14px;
}

.wrapper tr td {
	padding: 1px 2px;
	margin: 2px;
	text-align: left;
	border: solid 1px #888888 !important;
}

.wrapper table {
	width: 790px;
}

.wrapper div {
	text-align: center;
	margin: 2px auto;
}

.inputfield {
	font-family: "FangSong";
	font-size: 14px;
}

.inputfield p {
	font-family: "FangSong";
	font-size: 14px;
}

.mynav {
	margin: auto;
	font-size: 16px;
	line-height: 18px;
	background-color: #eeeeee;
	background-repeat: repeat-x;
	background-image: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5),
		color-stop(100%, #eeeeee) );
	background-image: -webkit-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	background-image: -ms-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	background-image: -o-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	filter: progid : DXImageTransform.Microsoft.gradient (   startColorstr =
		'#f5f5f5', endColorstr = '#eeeeee', GradientType = 0 );
	background-image: linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0, 0, 0, .1);
	-moz-box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0, 0, 0, .1);
	box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0, 0, 0, .1);
	filter: progid : DXImageTransform.Microsoft.gradient ( enabled = false );
}

.center {
	width: auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<!--startprint-->
	<div class="navbar navbar-fixed-top ">
		<div class="mynav">
			<span class="center"> <a href="detail/${dtstudent.id}"
				class="btn btn-large btn-success">通过</a> <a href="../admin"
				class="btn btn-large btn-warning">待定</a> <a href="#${dtstudent.id}"
				class="btn btn-large btn-danger">拒绝</a> <a href="../admin"
				class="btn btn-large btn-info">返回</a> </span>
		</div>
		<span class="pull-right"> <a href="javascript:;"
			onClick="doPrint()" class="btn">打印</a> <a href="logout" class="btn">注销</a>
		</span>

	</div>
	<div class="page">
		<!-- 		<div class="logo"> -->
		<!-- 			<img class="pull-left" src="assets/img/logo.png"> -->
		<!-- 			<div class="pull-left title">自主招生系统</div> -->
		<!-- 		</div> -->

		<div class="wrapper">
			<!-- form begin -->
			<!--startprint-->
			<table>
				<tr>
					<td>姓名</td>
					<td class="inputfield">${dtstudent.name}</td>
					<td>性别</td>
					<td class="inputfield">${dtstudent.sex}</td>
					<td>政治面貌</td>
					<td class="inputfield">${dtstudent.policy}</td>
				</tr>
				<tr>
					<td>毕业学校</td>
					<td class="inputfield">${dtstudent.gradeschool}</td>
					<td>毕业区县</td>
					<td class="inputfield">${dtstudent.gradesection}</td>
					<td>中考报名号</td>
					<td class="inputfield">${dtstudent.number</td>
				</tr>
				<tr>
					<td>出生年月</td>
					<td colspan="3" class="inputfield">${dtstudent.birthyear}
						年${dtstudent.birthmonth }月 ${dtstudent.birthday}日</td>
					<td>身体状况</td>
					<td class="inputfield">${dtstudent.city}</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>户口所在地</td>
					<td class="inputfield">${dtstudent.city}"</td>
				</tr>
				<tr>
					<td>家庭住址</td>
					<td class="inputfield">${dtstudent.address}</td>
				</tr>
				<tr>
					<td>邮政编码</td>
					<td class="inputfield">${dtstudent.addcode}"></td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td class="inputfield">${dtstudent.phone}></td>
				</tr>
				<tr>
					<td>手机</td>
					<td class="inputfield">${dtstudent.cell}></td>
				</tr>
				<tr>
					<td>身份证号码</td>
					<td class="inputfield">${dtstudent.pid}</td>
				</tr>
			</table>
			<table>
				<tr>
					<td style="text-align: center;" colspan="4">家庭成员和主要社会关系</td>
				</tr>
				<tr>
					<td style="text-align: center;">称谓</td>
					<td style="text-align: center;">姓名</td>
					<td style="text-align: center;">工作单位</td>
					<td style="text-align: center;">联系电话</td>
				</tr>
				<tr>
					<td class="inputfield">${dtstudent.daddy}</td>
					<td class="inputfield">${dtstudent.daddyname}"</td>
					<td class="inputfield">${dtstudent.daddyjob}"</td>
					<td class="inputfield">${dtstudent.daddyphone}"</td>
				</tr>
				<tr>
					<td class="inputfield">${dtstudent.mummy}</td>
					<td class="inputfield">"${dtstudent.mummyname}</td>
					<td class="inputfield">${dtstudent.mummyjob}"</td>
					<td class="inputfield">${dtstudent.mummyphone}</td>
				</tr>
			</table>
			<table style="align: center;">
				<tr>
					<td style="text-align: center;" colspan="8">区统考成绩</td>
				</tr>
				<tr>
					<td style="text-align: center;">&nbsp;</td>
					<td style="text-align: center;">语文</td>
					<td style="text-align: center;">数学</td>
					<td style="text-align: center;">英语</td>
					<td style="text-align: center;">物理</td>
					<td style="text-align: center;">化学</td>
					<td style="text-align: center;">总分</td>
					<td style="text-align: center;">定位分（或区排名）</td>
				</tr>
				<tr>
					<td>第一次</td>
					<td class="inputfield">${dtstudent.yuwem1}</td>
					<td class="inputfield">${dtstudent.shuxue1}</td>
					<td class="inputfield">${dtstudent.yingyu1}</td>
					<td class="inputfield">${dtstudent.wuli1}</td>
					<td class="inputfield">${dtstudent.huaxue1}</td>
					<td class="inputfield">${dtstudent.zongfen1}</td>
					<td class="inputfield">${dtstudent.paiping1}</td>
				</tr>
				<tr>
					<td>第二次</td>
					<td class="inputfield">${dtstudent.yuwem2}</td>
					<td class="inputfield">${dtstudent.shuxue2}</td>
					<td class="inputfield">${dtstudent.yingyu2}</td>
					<td class="inputfield">${dtstudent.wuli2}</td>
					<td class="inputfield">${dtstudent.huaxue2}</td>
					<td class="inputfield">${dtstudent.zongfen2}</td>
					<td class="inputfield">${dtstudent.paiping2}</td>
				</tr>
			</table>
			<table id="tblLevel">
				<tr>
					<td style="text-align: center;" colspan="2">初中阶段主要获得的荣誉称号</td>
				</tr>
				<tr>
					<td>级别</td>
					<td>名称</td>
				</tr>
				<tr>
					<td class="inputfield">${plev0}</td>
					<td class="inputfield">${pname0}"</td>
				</tr>
			</table>
			<table>
				<tr>
					<td style="text-align: center;" colspan="4">初中阶段参加各类比赛获奖情况（市级及以上奖项名称、等第、获奖时间、颁奖单位）</td>
				</tr>
				<tr>
					<td colspan="4" class="inputfield">${dtstudent.honors}</td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="4">初中阶段主要社会经历（包括社会实践、社会活动等非学科学习经历）</td>
				</tr>
				<tr>
					<td colspan="4" class="inputfield">${dtstudent.history}</td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="4">申请理由</td>
				</tr>
				<tr>
					<td class="inputfield" colspan="4">${dtstudent.reason}</td>
				</tr>
			</table>
			<!--endprint-->
			<!-- form end-->
		</div>
	</div>
	<!--endprint-->

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
	</script>
</body>
</html>