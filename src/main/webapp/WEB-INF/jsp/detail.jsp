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
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/docs.css" rel="stylesheet">
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
.mynav{
    margin: auto;
    font-size: 16px;
    line-height: 18px;
    background-color: #eeeeee;
	background-repeat: repeat-x;
	background-image: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f5f5f5), color-stop(100%,#eeeeee));
	background-image: -webkit-linear-gradient(top, #f5f5f5 0%,#eeeeee 100%);
	background-image: -ms-linear-gradient(top, #f5f5f5 0%,#eeeeee 100%);
	background-image: -o-linear-gradient(top, #f5f5f5 0%,#eeeeee 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f5f5', endColorstr='#eeeeee',GradientType=0 );
	background-image: linear-gradient(top, #f5f5f5 0%,#eeeeee 100%);
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0,0,0,.1);
	-moz-box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0,0,0,.1);
	box-shadow: inset 0 1px 0 #fff, 0 1px 5px rgba(0,0,0,.1);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
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
				<span class="center">
					<a href="detail/${dtstudent.id}" class="btn btn-large btn-success">通过</a>
					<a href="../admin" class="btn btn-large btn-warning">待定</a>
					<a href="#${dtstudent.id}" class="btn btn-large btn-danger">拒绝</a>
					<a href="../admin" class="btn btn-large btn-info">返回</a>
				</span>
			</div>
				<span class="pull-right">
					<a href="javascript:;" onClick="doPrint()" class="btn">打印</a>
					<a href="logout" class="btn">注销</a>
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
						<td><input type="text" id="name" name="name"
							value="${dtstudent.name}" placeholder="请输入姓名"
							class="uneditable-input"></td>
						<td>性别</td>
						<td class="inputfield">${dtstudent.sex}</td>
						<td>政治面貌</td>
						<td><input type="text" id="policy" name="policy"
							placeholder="请输入" class="uneditable-input"
							value="${dtstudent.policy}"></td>
					</tr>
					<tr>
						<td>毕业学校</td>
						<td><input type="text" id="gradeschool" name="gradeschool"
							value="${dtstudent.gradeschool}" placeholder="请输入"
							class="uneditable-input"></td>
						<td>毕业区县</td>
						<td><input type="text" id="gradesection" name="gradesection"
							value="${dtstudent.gradesection}" placeholder="请输入"
							class="uneditable-input input-small"></td>
						<td>中考报名号</td>
						<td><input type="text" id="number" name="number"
							placeholder="请输入" class="uneditable-input"
							value="${dtstudent.number}"></td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td colspan="3" class="inputfield">${dtstudent.birthyear}
							年${dtstudent.birthmonth }月 ${dtstudent.birthday}日</td>
						<td>身体状况</td>
						<td><input type="text" id="healthy" name="healthy"
							placeholder="请输入" class="uneditable-input"
							value="${dtstudent.city}"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>户口所在地</td>
						<td><input id="city" name="city" value="${dtstudent.city}"
							type="text" class="uneditable-input input-xxlarge"></td>
					</tr>
					<tr>
						<td>家庭住址</td>
						<td><input id="address" name="address" type="text"
							value="${dtstudent.address}"
							class="uneditable-input input-xxlarge"></td>
					</tr>
					<tr>
						<td>邮政编码</td>
						<td><input id="addcode" name="addcode" type="text"
							value="${dtstudent.addcode}" class="uneditable-input input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="6">
						</td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input id="phone" name="phone" type="text"
							value="${dtstudent.phone}" class="uneditable-input input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="21">
						</td>
					</tr>
					<tr>
						<td>手机</td>
						<td><input id="cell" name="cell" type="text"
							value="${dtstudent.cell}" class="uneditable-input input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="21">
						</td>
					</tr>
					<tr>
						<td>身份证号码</td>
						<td><input id="pid" name="pid" type="text"
							value="${dtstudent.pid}" class="uneditable-input input-large"
							maxlength="18"></td>
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
						<td><input id="daddy" name="daddy" type="text"
							value="${dtstudent.daddy}" class="uneditable-input input-small">
						</td>
						<td><input id="daddyname" name="daddyname" type="text"
							value="${dtstudent.daddyname}"
							class="uneditable-input input-small"></td>
						<td><input id="daddyjob" name="daddyjob" type="text"
							value="${dtstudent.daddyjob}"
							class="uneditable-input input-xlarge"></td>
						<td><input id="daddyphone" name="daddyphone" type="text"
							value="${dtstudent.daddyphone}"
							class="uneditable-input input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="21">
						</td>
					</tr>
					<tr>
						<td><input id="mummy" name="mummy" type="text"
							value="${dtstudent.mummy}" class="uneditable-input input-small">
						</td>
						<td><input id="mummyname" name="mummyname" type="text"
							value="${dtstudent.mummyname}"
							class="uneditable-input input-small"></td>
						<td><input id="mummyjob" name="mummyjob" type="text"
							value="${dtstudent.mummyjob}"
							class="uneditable-input input-xlarge"></td>
						<td><input id="mummyphone" name="mummyphone" type="text"
							value="${dtstudent.mummyphone}"
							class="uneditable-input input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="21">
						</td>
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
						<td><input id="yuwem1" name="yuwem1" type="text"
							value="${dtstudent.yuwem1}" class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="shuxue1" name="shuxue1" type="text"
							value="${dtstudent.shuxue1}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="yingyu1" name="yingyu1" type="text"
							value="${dtstudent.yingyu1}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="wuli1" name="wuli1" type="text"
							value="${dtstudent.wuli1}" class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="huaxue1" name="huaxue1" type="text"
							value="${dtstudent.huaxue1}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="zongfen1" name="zongfen1" type="text"
							value="${dtstudent.zongfen1}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="paiping1" name="paiming1" type="text"
							value="${dtstudent.paiping1}"
							class="uneditable-input input-small"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
					</tr>
					<tr>
						<td>第二次</td>
						<td><input id="yuwem2" name="yuwem2" type="text"
							value="${dtstudent.yuwem2}" class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="shuxue2" name="shuxue2" type="text"
							value="${dtstudent.shuxue2}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="yingyu2" name="yingyu2" type="text"
							value="${dtstudent.yingyu2}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="wuli2" name="wuli2" type="text"
							value="${dtstudent.wuli2}" class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="huaxue2" name="huaxue2" type="text"
							value="${dtstudent.huaxue2}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="zongfen2" name="zongfen2" type="text"
							value="${dtstudent.zongfen2}"
							class="uneditable-input input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5">
						</td>
						<td><input id="paiping2" name="paiming2" type="text"
							value="${dtstudent.paiping2}"
							class="uneditable-input input-small" maxlength="5"></td>
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
						<td>${plev0}</td>
						<td><input id="pname0" name="pname0" type="text"
							class="uneditable-input input-xxlarge" value="${pname0}">
						</td>
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
			bdhtml=window.document.body.innerHTML; 
			sprnstr="<!--startprint-->"; 
			eprnstr="<!--endprint-->"; 
			prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
			prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
			window.document.body.innerHTML=prnhtml;
			window.print();
		}
	</script>
</body>
</html>