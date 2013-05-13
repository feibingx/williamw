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

.inputfield {
	font-family: "FangSong";
	font-size: 14px;
}

.inputfield p {
	font-family: "FangSong";
	font-size: 14px;
	max-width: 788px;
	padding: auto 12px;
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
	padding: 2px;
}
.model-size{
	width: 320px;
	margin:-200px 0 0 -160px;
}
.wrapper{
	padding: 20px;
}
</style>
</head>
<body>	
	<div class="navbar navbar-fixed-top ">
		<div class="mynav">
			<span class="center"> 
			<!-- <a id="pass" name="pass" onClick="setDatetime();" class="btn btn-large btn-success">通过</a> -->
			<a href="../deal?action=sts_pass" class="btn btn-large btn-success">通过</a>
			<a href="../deal?action=sts_wait" class="btn btn-large btn-warning">待定</a>
			<a href="../deal?action=sts_reject" class="btn btn-large btn-danger">拒绝</a>
			<a href="../admin" class="btn btn-large btn-info">返回</a>
			</span>
		</div>
		<span class="pull-right"> <a href="javascript:;"
			onClick="doPrint()" class="btn">打印</a> <a href="../logout" class="btn">注销</a>
		</span>

	</div>
	<div class="page">
		<div class="wrapper">
			<div class="pull-right">当前状态：<fmt:message key="${dtstudent.sts}" />
					审阅人: ${dtstudent.role} &nbsp;
					<c:if test="${dtstudent.sts == 'sts_pass'}">
						 面试时间：${dtstudent.interview}
					</c:if>
			</div>			
			<!--startprint-->
			<table>
					<tr>
						<td style="width:15%">姓名</td>
						<td>${dtstudent.name}</td>
						<td>性别</td>
						<td> ${dtstudent.sex} </td>
						<td>政治面貌</td>
						<td>${dtstudent.policy}</td>
						<td rowspan="5" style="width:110px;">
							<iframe src="../pic/${dtstudent.id}" width="110" height="160" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"></iframe>
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
				<table>
					<tr>
						<td style="text-align: center;" colspan="4">家庭成员和主要社会关系</td>
					</tr>
					<tr>
						<td style="text-align: center; width:15%">称谓</td>
						<td style="text-align: center; width:20%">姓名</td>
						<td style="text-align: center; width:50%">工作单位</td>
						<td style="text-align: center; width:15%">联系电话</td>
					</tr>
					<tr>
						<td>${dtstudent.daddy}</td>
						<td>${dtstudent.daddyname}</td>
						<td>${dtstudent.daddyjob}</td>
						<td>${dtstudent.daddyphone}</td>
					</tr>
					<tr>
						<td>${dtstudent.mummy}</td>
						<td>${dtstudent.mummyname}</td>
						<td>${dtstudent.mummyjob}</td>
						<td>${dtstudent.mummyphone}</td>
					</tr>
				</table>
				<table style="align: center;text-align: center;">
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
					<tr >
						<td>第一次</td>
						<td style="text-align: center;">${dtstudent.yuwem1}
						</td>
						<td style="text-align: center;">${dtstudent.shuxue1}
						</td>
						<td style="text-align: center;">${dtstudent.yingyu1}
						</td>
						<td style="text-align: center;">${dtstudent.wuli1}
						</td>
						<td style="text-align: center;">${dtstudent.huaxue1}
						</td>
						<td style="text-align: center;">${dtstudent.zongfen1}
						</td>
						<td style="text-align: center;">${dtstudent.paimin1}
						</td>
					</tr>
					<tr>
						<td>第二次</td>
						<td  style="text-align: center;">${dtstudent.yuwem2}
						</td>
						<td  style="text-align: center;">${dtstudent.shuxue2}
						</td>
						<td  style="text-align: center;">${dtstudent.yingyu2}
						</td>
						<td  style="text-align: center;">${dtstudent.wuli2}
						</td>
						<td  style="text-align: center;">${dtstudent.huaxue2}
						</td>
						<td  style="text-align: center;">${dtstudent.zongfen2}
						</td>
						<td  style="text-align: center;">${dtstudent.paimin2}
						</td>
					</tr>
				</table>
				<table id="tblLevel">
					<tr>
						<td style="text-align: center;" colspan="2">
							初中阶段获得的主要荣誉称号</td>
					</tr>
					<tr>
						<td style="width:15%">级别</td>
						<td>名称</td>
					</tr>
				<c:if test="${dtstudent.honorslist==null}">
					<tr>
						<td>
							${dtstudent.hlev0}
						</td>
						<td>${dtstudent.hname0}
						</td>
					</tr>
				</c:if>
				<c:if test="${dtstudent.honorslist!=null}">
					<c:forEach var="honor" items="${dtstudent.honorslist}">
						<tr>
							<td>${honor.hlev}</td>
							<td>${honor.hname}</td>
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<table id="tblhonor">
                    <tr>
                        <td style="text-align: center;" colspan="4">
                            初中阶段参加各类比赛获奖情况
                        </td>
                    </tr>
                    <tr>
                    	<td style="width:10%">获奖时间</td>
                        <td style="width:45%">名称</td>
                        <td style="width:10%">级别</td>
                        <td>颁奖单位</td>
                    </tr>
                    <c:if test="${dtstudent.priceslist==null}">
	                    <tr>
	                    	<td>&nbsp;</td>
	                    	<td>&nbsp;</td>
	                    	<td>&nbsp;</td>
	                    	<td>&nbsp;</td>
	                    </tr>
                    </c:if>
                    <c:if test="${dtstudent.priceslist!=null}">
                    	<c:forEach var="price" items="${dtstudent.priceslist}">
						<tr>
							<td>${price.ptime}
	                        </td>
	                        <td>
	                            ${price.pname}
	                        <td>
	                        	${price.plev}
	                        </td>
	                        <td>
	                            ${price.pcell}</td>
						</tr>
					</c:forEach>
                	</c:if>
                </table>
				<table>
					<tr>
						<td style="text-align: center;">初中阶段主要社会经历</td>
					</tr>
					<tr>
						<td>${dtstudent.history}
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">个人自述</td>
					</tr>
					<tr>
						<td>${dtstudent.reason}</td>
					</tr>
				</table>
			<!--endprint-->
			<!-- form end-->
		</div>
	</div>

  <div data-backdrop="false" tabindex="-1" class="modal fade hide in model-size" id="winModal" >
  	<form action="../deal" method="post">
  		<input type="hidden" value="sts_pass" id="action" name="action">
  		<input type="hidden" id="id" name="id">
		<div class="modal-header">
	      <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	      <h3 id="myModalLabel">设定面试时间</h3>
	    </div>
	    <div class="modal-body">
	      <input type="text" class="input-xlarge" id="interview" name="interview">
	    </div>
	    <div class="modal-footer">
	      <button aria-hidden="true" data-dismiss="modal" class="btn" type="button">取消</button>
	      <input type="submit" value="提交" class="btn btn-primary">
	    </div>
  	</form>
    
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