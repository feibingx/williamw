<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- Author: William Wang -->
<!--  www.zhiweiwang.com  -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<style type="text/css">
input {
	border: 0px #000000 !important;
	font-family: "FangSong";
	font-size: 14px;
}
tr td {
    padding: 1px 2px;
    margin: 2px;
    text-align: left;
    border: solid 1px #888888 !important;
}

table {
    width: 790px;
}
.wrapper {
	padding-top:120px;
}
.wrapper div {
    text-align: center;
    margin: 2px auto;
}

.print-btn{
	margin: 90px -37px 0 0;
}
</style>
</head>
<body>


	<div class="page">
		<div class="logo">
			<a href="login" class="titlea"><img class="pull-left title" src="assets/img/logo.png"></a>
			<div class="pull-left title">自荐招生系统</div>
			<a href="logout" class="pull-right">注销</a>
			<a data-content="请务必先完成提交后，再进行打印" rel="popover" data-placement="left" class="btn pull-right print-btn" href="print/${dtstudent.id}" data-original-title="注意!">打印</a>
		</div>
		
		<div class="wrapper">
					<!-- form begin -->
			<!--startprint-->			
			<form class="form-horizontal" action="fillin" id="fillform" method="post">
				<table>
					<tr>
						<td style="width:15%">姓名</td>
						<td><input type="text" id="name" name="name"
							value="${dtstudent.name}" placeholder="请输入姓名" class="required input-small">
						</td>
						<td>性别</td>
						<td><select id="sex" style="width:50px" name="sex" required>
								<option <c:if test="${dtstudent.sex=='男' }">selected</c:if>>男
								</option>
								<option <c:if test="${dtstudent.sex=='女' }">selected</c:if>>女
								</option>
						</select></td>
						<td>政治面貌</td>
						<td><input type="text" id="policy" name="policy"
							placeholder="请输入" class="required input-small" value="${dtstudent.policy}">
						</td>
						<td rowspan="5" style="width:110px;">
							<iframe id="iframe" src="pic" width="110" height="160" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" title="双击浏览选择需要上传的照片" data-content="仅允许上传JPG、PNG、GIF文件<br>选择完毕后请点击提交" data-placement="top" data-toggle="popover" rel="popover" >	</iframe>
						</td>
					</tr>
					<tr>
						<td>毕业区县</td>
						<td><input type="text" id="gradesection" name="gradesection"
							value="${dtstudent.gradesection}" placeholder="请输入"
							class="required input-small">
						</td>
						<td>身体状况</td>
						<td><input type="text" id="healthy" name="healthy"
							placeholder="请输入" class="required input-small" value="${dtstudent.healthy}">
						</td>
						<td>中考报名号</td>
						<td><input type="text" id="number" name="number"
							placeholder="请输入" class="required input-small" value="${dtstudent.number}">
						</td>
					</tr>
					<tr>
						<td>毕业学校</td>
						<td colspan="5"><input type="text" id="gradeschool" name="gradeschool"
							value="${dtstudent.gradeschool}" placeholder="请输入" class="required input">
						</td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td colspan="5"><select style="width:100px" id="birthyear"
							name="birthyear">
								<option value="1996"
									<c:if test="${dtstudent.birthyear=='1996' }">selected</c:if>>1996
								</option>
								<option value="1997"
									<c:if test="${dtstudent.birthyear=='1997' }">selected</c:if>>1997
								</option>
								<option value="1998"
									<c:if test="${dtstudent.birthyear=='1998' }">selected</c:if>>1998
								</option>
								<option value="1999"
									<c:if test="${dtstudent.birthyear=='1999' }">selected</c:if>>1999
								</option>
								<option value="2000"
									<c:if test="${dtstudent.birthyear=='2000' }">selected</c:if>>2000
								</option>
						</select>年</span> <select style="width:55px" id="birthmonth" name="birthmonth">
								<c:forEach var="x" begin="1" end="12" step="1">
									<option value="${x}"
										<c:if test="${dtstudent.birthmonth==x }">selected</c:if>>${x}
									</option>
								</c:forEach>
						</select>月<select style="width:55px" id="birthday" name="birthday">
								<c:forEach var="x" begin="1" end="31" step="1">
									<option value="${x}"
										<c:if test="${dtstudent.birthday==x }">selected</c:if>>${x}
									</option>
								</c:forEach>
						</select>日</td>
					</tr>					
					<tr>
						<td>户口所在地</td>
						<td colspan="5"><input id="city" name="city" value="${dtstudent.city}"
							type="text" class="required input">
						</td>
					</tr>
					
				
				</table>
				<table>
					<tr>
						<td style="width:15%">家庭住址</td>
						<td colspan="5"><input id="address" name="address" type="text"
							value="${dtstudent.address}" class="required input-xxlarge">
						</td>
					</tr>
					<tr>
						<td>邮政编码</td>
						<td><input id="addcode" name="addcode" type="text"
							value="${dtstudent.addcode}" class="required input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="6">
						</td>
						<td rowspan="2">联系方式</td>
						<td colspan="1">电话</td>
						<td ><input id="phone" name="phone" type="text"
							value="${dtstudent.phone}" class="required input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21">
						</td>
					</tr>
					<tr>
						<td>身份证号码</td>
						<td><input id="pid" name="pid" type="text"
							value="${dtstudent.pid}" class="required input-large" maxlength="18">
						</td>
						<td>手机</td>
						<td><input id="cell" name="cell" type="text"
							value="${dtstudent.cell}" class="required input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21">
						</td>
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
							value="${dtstudent.daddy}" class="required input-small">
						</td>
						<td><input id="daddyname" name="daddyname" type="text"
							value="${dtstudent.daddyname}" class="required input-small">
						</td>
						<td><input id="daddyjob" name="daddyjob" type="text"
							value="${dtstudent.daddyjob}" class="required input-xlarge">
						</td>
						<td><input id="daddyphone" name="daddyphone" type="text"
							value="${dtstudent.daddyphone}" class="required input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21">
						</td>
					</tr>
					<tr>
						<td><input id="mummy" name="mummy" type="text"
							value="${dtstudent.mummy}" class="input-small">
						</td>
						<td><input id="mummyname" name="mummyname" type="text"
							value="${dtstudent.mummyname}" class="input-small">
						</td>
						<td><input id="mummyjob" name="mummyjob" type="text"
							value="${dtstudent.mummyjob}" class="input-xlarge">
						</td>
						<td><input id="mummyphone" name="mummyphone" type="text"
							value="${dtstudent.mummyphone}" class="input-large"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="21">
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
						<td style="text-align: center;">区定位分</td>
					</tr>
					<tr>
						<td>第一次</td>
						<td><input id="yuwem1" name="yuwem1" type="text"
							value="${dtstudent.yuwem1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="shuxue1" name="shuxue1" type="text"
							value="${dtstudent.shuxue1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="yingyu1" name="yingyu1" type="text"
							value="${dtstudent.yingyu1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="wuli1" name="wuli1" type="text"
							value="${dtstudent.wuli1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="huaxue1" name="huaxue1" type="text"
							value="${dtstudent.huaxue1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="zongfen1" name="zongfen1" type="text"
							value="${dtstudent.zongfen1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="paimin1" name="paimin1" type="text"
							value="${dtstudent.paimin1}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">%
						</td>
					</tr>
					<tr>
						<td>第二次</td>
						<td><input id="yuwem2" name="yuwem2" type="text"
							value="${dtstudent.yuwem2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="shuxue2" name="shuxue2" type="text"
							value="${dtstudent.shuxue2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="yingyu2" name="yingyu2" type="text"
							value="${dtstudent.yingyu2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="wuli2" name="wuli2" type="text"
							value="${dtstudent.wuli2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="huaxue2" name="huaxue2" type="text"
							value="${dtstudent.huaxue2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td><input id="zongfen2" name="zongfen2" type="text"
							value="${dtstudent.zongfen2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">
						</td>
						<td>
							<input id="paimin2" name="paimin2" type="text"
							value="${dtstudent.paimin2}" class="required input-xsmall"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							maxlength="5">%
						</td>
					</tr>
				</table>
				<table id="tblLevel">
					<tr>
						<td style="text-align: center;" colspan="2">
							初中阶段获得的主要荣誉称号<a class="btn pull-right"
							onclick="addlevel()">点此添加</a></td>
					</tr>
					<tr>
						<td>级别</td>
						<td>名称</td>
					</tr>
				<c:if test="${dtstudent.honorslist==null}">
					<tr>
						<td>
							<select class="span2" id="hlev0" name="hlev0">
								<option value="市级"
									<c:if test="${dtstudent.hlev0=='市级' }">selected</c:if>>市级
								</option>
								<option value="区级"
									<c:if test="${dtstudent.hlev0=='区级' }">selected</c:if>>区级
								</option>
								<option value="校级"
									<c:if test="${dtstudent.hlev0=='校级' }">selected</c:if>>校级
								</option>
							</select>
						</td>
						<td><input id="hname0" name="hname0" type="text"
							class="input-xxlarge" value="${dtstudent.hname0}">
						</td>
					</tr>
				</c:if>
				<c:if test="${dtstudent.honorslist!=null}">
					<c:forEach var="honor" items="${dtstudent.honorslist}">
						<tr>
							<td><select class="span2" id="hlev${honor.index}" name="hlev${honor.index}">
								<option value="市级"
									<c:if test="${honor.hlev=='市级' }">selected</c:if>>市级
								</option>
								<option value="区级"
									<c:if test="${honor.hlev=='区级' }">selected</c:if>>区级
								</option>
								<option value="校级"
									<c:if test="${honor.hlev=='校级' }">selected</c:if>>校级
								</option>
							</select></td>
							<td>
								<input id="hname${honor.index}" name="hname${honor.index}" type="text" class="input-xxlarge" value="${honor.hname}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<table id="tblhonor">
                    <tr>
                        <td style="text-align: center;" colspan="4">
                            初中阶段参加各类比赛获奖情况
                            <a class="btn pull-right" onclick="addhonor()">点此添加</a>
                        </td>
                    </tr>
                    <tr>
                    	<td>获奖时间</td>
                        <td>名称</td>
                        <td>级别</td>
                        <td>颁奖单位</td>
                    </tr>
                    <c:if test="${dtstudent.priceslist==null}">
	                    <tr>
	 						<td>
	                        	<select class="span1" id="ptime0" name="ptime0">
	                        		<option value="预初" <c:if test="${dtstudent.ptime0=='预初' }">selected</c:if>>预初</option>
	                        		<option value="初一" <c:if test="${dtstudent.ptime0=='初一' }">selected</c:if>>初一</option>
	                        		<option value="初二" <c:if test="${dtstudent.ptime0=='初二' }">selected</c:if>>初二</option>
	                        		<option value="初三" <c:if test="${dtstudent.ptime0=='初三' }">selected</c:if>>初三</option>
	                        	</select>
	                        </td>
	                        <td>
	                            <input id="pname0" name="pname0" type="text" class="input-large"></td>
	                        <td>
	                        	<select class="span1" id="plev0" name="plev0">
	                        		<option value="市级" <c:if test="${dtstudent.plev0=='市级' }">selected</c:if>>市级</option>
	                        		<option value="区级" <c:if test="${dtstudent.plev0=='区级' }">selected</c:if>>区级</option>
	                        		<option value="校级" <c:if test="${dtstudent.plev0=='校级' }">selected</c:if>>校级</option>
	                        	</select>
	                        </td>
	                        <td>
	                            <input id="pcell0" name="pcell0" type="text" class="input"></td>
	                    </tr>
                    </c:if>
                    <c:if test="${dtstudent.priceslist!=null}">
                    	<c:forEach var="price" items="${dtstudent.priceslist}">
						<tr>
							<td>
	                        	<select class="span1" id="ptime${price.index}" name="ptime${price.index}">
	                        		<option value="预初" <c:if test="${price.ptime=='预初' }">selected</c:if>>预初</option>
	                        		<option value="初一" <c:if test="${price.ptime=='初一' }">selected</c:if>>初一</option>
	                        		<option value="初二" <c:if test="${price.ptime=='初二' }">selected</c:if>>初二</option>
	                        		<option value="初三" <c:if test="${price.ptime=='初三' }">selected</c:if>>初三</option>
	                        	</select>
	                        </td>
	                        <td>
	                            <input id="pname${price.index}" name="pname${price.index}" value="${price.pname}" type="text" class="input-large"></td>
	                        <td>
	                        	<select class="span1" id="plev${price.index}" name="plev${price.index}">
	                        		<option value="市级" <c:if test="${price.plev=='市级' }">selected</c:if>>市级</option>
	                        		<option value="区级" <c:if test="${price.plev=='区级' }">selected</c:if>>区级</option>
	                        		<option value="校级" <c:if test="${price.plev=='校级' }">selected</c:if>>校级</option>
	                        	</select>
	                        </td>
	                        <td>
	                            <input id="pcell${price.index}" name="pcell${price.index}" value="${price.pcell}" type="text" class="input"></td>
						</tr>
					</c:forEach>
                	</c:if>
                </table>
				<table>
					<tr>
						<td style="text-align: center;" colspan="4">初中阶段主要社会经历<br/>（包括社会实践、社会活动、学生干部经历等非学科学习经历）</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4"><textarea
								name="history" id="history" >${dtstudent.history}</textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4">个人自述<br/>[至少包括以下内容：申请者自荐的优势分析；最近一年阅读过的课外书籍简单介绍；对自己成长影响比较大的书、人或事及其原因的介绍；做过的最让自己自豪的事或决定；最难忘的探究经历、实验操作或社会实践活动；自己对未来的展望等]</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="4"><textarea
								name="reason" id="reason">${dtstudent.reason}</textarea></td>
					</tr>
				</table><!--endprint-->
				<div>
					我已按照要求如实填写所有内容 <input type="checkbox" name="allright" id="allright" />
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

		$('#iframe').popover();
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
		<c:choose>
		   <c:when test="${dtstudent.pricessize !=null}">
		   var pricesLevel = ${dtstudent.pricessize};
		   </c:when>		   
		   <c:otherwise>
		   var pricesLevel = 1;
		   </c:otherwise>		  
		</c:choose>
		<c:choose>
		   <c:when test="${dtstudent.honorssize !=null}">
		   var honorlevel = ${dtstudent.honorssize};
		   </c:when>		   
		   <c:otherwise>
		   var honorlevel = 1;
		   </c:otherwise>		  
		</c:choose>
		var editor = new UE.ui.Editor();
		//editor.render("prices");
		var editor2 = new UE.ui.Editor();
		editor2.render("history");
		new UE.ui.Editor().render("reason");
		function addlevel() {
			$("#tblLevel")
					.append("<tr><td>"
							+"<select class=\"span2\" id=\"hlev"+honorlevel+"\" name=\"hlev"+honorlevel+"\">"
							+"<option value=\"市级\">市级</option>"
							+"<option value=\"区级\">区级</option>"
							+"<option value=\"校级\">校级</option>"
							+"</select></td>"
							+"<td><input id=\"hname"+honorlevel+"\" name=\"hname"+honorlevel+"\" type=\"text\" class=\"input-xxlarge\">"
							+"</td>"
							+"</tr>");
			honorlevel++;
		}

		function addhonor() {
			 $("#tblhonor").append("<tr><td>"
					+"<select class=\"span1\" id=\"ptime"+pricesLevel+"\" name=\"ptime"+pricesLevel+"\">"
					+"<option value=\"预初\">预初</option>"
					+"<option value=\"初一\">初一</option>"
					+"<option value=\"初二\">初二</option>"
					+"<option value=\"初三\">初三</option>"
					+"</select>"
					+"</td>"
					+"<td>"
					+"<input id=\"pname"+pricesLevel+"\" name=\"pname"+pricesLevel+"\" type=\"text\" class=\"input-large\"></td>"
					+"<td>"
					+"<select class=\"span1\" id=\"plev"+pricesLevel+"\" name=\"plev"+pricesLevel+"\">"
					+"<option value=\"市级\">市级</option>"
					+"<option value=\"区级\">区级</option>"
					+"<option value=\"校级\">校级</option>"
					+"</select>"
					+"</td>"
					+"<td>"
					+"<input id=\"pcell"+pricesLevel+"\" name=\"pcell"+pricesLevel+"\" type=\"text\" class=\"input\"></td>"
					+"</tr>");
			 pricesLevel++;
		}
		
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