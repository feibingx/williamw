<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
body {
	padding-top: 20px;
	font-family: "Microsoft Yahei"
}

.page {
	margin: 0 auto;
	max-width: 1000px;
}

.logo {
	margin-bottom: 100px;
}

.wrapper {
	margin: auto;
	height: auto;
	background: #FFF;
	padding: 20px;
	width: 800px;
	font-size: 16px;
	line-height: 18px;
}

.wrapperbak {
	border-radius: 10px;
	box-shadow: 0px 2px 15px #666;
}

.form-btn {
	background-color: #79C3D4 !important;
}

.error {
	color: #B94A48;
}

.control-label {
	width: 90px !important;
}

.controls {
	margin-left: 100px !important;;
}

.wrapper tr td {
	padding: 1px 2px;
	margin: 2px;
	text-align: left;
	border: solid 1px #999999 !important;
}

.wrapper table {
	width: 790px;
}

.wrapper div {
	text-align: center;
	margin: 2px auto;
}

.input-xsmall {
	width: 50px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="page">
		<div class="logo">
			<img src="assets/img/logo.png">
		</div>
		<div class="wrapper">
			<!-- form begin -->
			<form class="form-horizontal" action="fillin" id="fillform"
				method="post">
				<table>
					<tr>
						<td>姓名</td>
						<td><input type="text" id="name" name="name"
							value="${dtstudent.name}" placeholder="请输入" class="input">
						</td>
						<td>性别</td>
						<td><select class="span1" id="sex" name="sex" required>
								<option <c:if test="${dtstudent.sex=='男' }"> selected </c:if>>男</option>
								<option <c:if test="${dtstudent.sex=='女' }"> selected </c:if>>女</option>
						</select>
						</td>
						<td>政治面貌</td>
						<td><input type="text" id="policy" name="policy"
							placeholder="请输入" class="input" value="${dtstudent.policy}">
						</td>
					</tr>

					<tr>
						<td>出生年月</td>
						<td colspan="3">
						<select class="span2" id="birthyear" name="birthyear">
								<option value="1996" <c:if test="${dtstudent.birthyear=='1996' }"> selected </c:if>>1996</option>
								<option value="1997" <c:if test="${dtstudent.birthyear=='1997' }"> selected </c:if>>1997</option>
								<option value="1998" <c:if test="${dtstudent.birthyear=='1998' }"> selected </c:if>>1998</option>
								<option value="1999" <c:if test="${dtstudent.birthyear=='1999' }"> selected </c:if>>1999</option>
								<option value="2000" <c:if test="${dtstudent.birthyear=='2000' }"> selected </c:if>>2000</option>
						</select> 年 
						<select class="span1" id="birthmonth" name="birthmonth">
								<c:forEach var="x" begin="1" end="12" step="1">
									<option value="${x} }"
										<c:if test="${dtstudent.birthmonth==x }"> selected </c:if>>${x}</option>
								</c:forEach>
						</select> 月 <select class="span1" id="birthday" name="birthday">
								<c:forEach var="x" begin="1" end="31" step="1">
									<option value="${x} }"
										<c:if test="${dtstudent.birthday==x }"> selected </c:if>>${x}</option>
								</c:forEach>
						</select> 日</td>
						<td>身体状况</td>
						<td><input type="text" id="healthy" name="healthy"
							placeholder="请输入" class="input"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>户口所在地</td>
						<td><input id="city" name="city" type="text"
							class="input-xxlarge"></td>
					</tr>
					<tr>
						<td>家庭住址</td>
						<td><input id="address" name="address" type="text"
							class="input-xxlarge"></td>
					</tr>
					<tr>
						<td>邮政编码</td>
						<td><input id="addcode" name="addcode" type="text"
							class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="6"></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input id="phone" name="phone" type="text"
							class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21"></td>
					</tr>
					<tr>
						<td>手机</td>
						<td><input id="cell" name="cell" type="text"
							class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21"></td>
					</tr>
					<tr>
						<td>身份证号码</td>
						<td><input id="pid" name="pid" type="text"
							class="input-large" maxlength="18"></td>
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
							class="input-small"></td>
						<td><input id="daddyname" name="daddyname" type="text"
							class="input-small"></td>
						<td><input id="daddyjob" name="daddyjob" type="text"
							class="input-xlarge"></td>
						<td><input id="daddyphone" name="daddyphone" type="text"
							class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21"></td>
					</tr>
					<tr>
						<td><input id="mummy" name="mummy" type="text"
							class="input-small"></td>
						<td><input id="mummyname" name="mummyname" type="text"
							class="input-small"></td>
						<td><input id="mummyjob" name="mummyjob" type="text"
							class="input-xlarge"></td>
						<td><input id="mummyphone" name="mummyphone" type="text"
							class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21"></td>
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
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
					</tr>
					<tr>
						<td>第二次</td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
						<td><input id="" name="" type="text" class="input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5"></td>
					</tr>
				</table>
				<table id="tblLevel">
					<tr>
						<td style="text-align: center;" colspan="5">
							初中阶段参加各类比赛获奖情况（市级及以上奖项名称、等第、获奖时间、颁奖单位） <a class="btn pull-right"
							onclick="addlevel()">+</a>
						</td>
					</tr>
					<tr>
						<td>级别</td>
						<td>名称</td>
						<td>等第</td>
						<td>获奖时间</td>
						<td>颁奖单位</td>
					</tr>
					<tr>
						<td><input id="lev0" name="lev0" type="text"
							class="input-small">
						</td>
						<td><input id="pname0" name="pname0" type="text"
							class="input"></td>
						<td><input id="plev0" name="plev0" type="text"
							class="input-small"></td>
						<td><input id="ptime0" name="ptime0" type="text"
							class="input-small"></td>
						<td><input id="pcell0" name="pcell0" type="text"
							class="input"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td style="text-align: center;" colspan="4">初中阶段主要获得的荣誉称号</td>
					</tr>
					<tr>
						<td colspan="4"><textarea name="prices" id="prices"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4">初中阶段主要社会经历（包括社会实践、社会活动等非学科学习经历）</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4"><textarea
								name="history" id="history"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4">申请理由</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4"><textarea
								name="reason" id="reason"></textarea>
						</td>
					</tr>
				</table>
				<div>
					我保证以上信息真实有效 <input type="checkbox" name="allright" id="allright" />
				</div>
				<div>
					<input type="submit" value="提交" class="btn btn-primary btn-large">
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
	<script src="assets/js/editor_config.js"></script>
	<script src="assets/js/editor_all.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#fillform").validate({
				rules : {
					name : "required",
					policy : "required",
					city : "required",
					address : "required",
					cell : "required",
					allright : "required"
				},
				messages : {
					name : "必填",
					policy : "必填",
					city : "必填",
					address : "必填",
					cell : "必填",
					allright : "请确认所填信息真实有效"
				}
			});
		});
		var initlevel = 1;

		var editor = new UE.ui.Editor();
		editor.render("prices");
		var editor2 = new UE.ui.Editor();
		editor2.render("history");
		new UE.ui.Editor().render("reason");
		function addlevel() {
			$("#tblLevel")
					.append(
							"<tr>"
									+ "<td>"
									+ "<input id=\"lev"+initlevel+"\" name=\"lev"+initlevel+"\" type=\"text\" class=\"input-small\"></td>"
									+ "<td>"
									+ "<input id=\"pname"+initlevel+"\" name=\"pname"+initlevel+"\" type=\"text\" class=\"input\"></td>"
									+ "<td>"
									+ "<input id=\"plev"+initlevel+"\" name=\"plev"+initlevel+"\" type=\"text\" class=\"input-small\"></td>"
									+ "<td>"
									+ "<input id=\"ptime"+initlevel+"\" name=\"ptime"+initlevel+"\" type=\"text\" class=\"input-small\"></td>"
									+ "<td><input id=\"pcell"+initlevel+"\" name=\"pcell"+initlevel+"\" type=\"text\" class=\"input\"></td>"
									+ "</tr>");
		}
	</script>
</body>
</html>