<%@ page contentType="application/vnd.ms-excel; charset=gbk"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String filename = new String(("学生列表").getBytes(), "ISO-8859-1");
	response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html>
<head>
<meta name="Generator" content="Microsoft Excel 11">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<center><b>学生列表</b></center>
<table border="1" align="center" cellpadding="0" cellspacing="1">
	<thead>
		<tr>
			<th>编号</th>
			<th>身份证号码</th>
			<th>姓名</th>
			<th>性别</th>
			<th>状态</th>
			<th>政治面貌</th>
			<th>出生年</th>
			<th>出生月</th>
			<th>出生日</th>
			<th>身体状况</th>
			<th>户口所在地</th>
			<th>地址</th>
			<th>右边</th>
			<th>电话</th>
			<th>手机</th>
			<th>毕业院系</th>
			<th>毕业区县</th>
			<th>中考报名号</th>
			<th>家长称谓</th>
			<th>家长姓名</th>
			<th>家长工作单位</th>
			<th>家长联系电话</th>
			<th>家长称谓</th>
			<th>家长姓名</th>
			<th>家长工作单位</th>
			<th>家长联系电话</th>
			<th>语文第一次</th>
			<th>语文第二季</th>
			<th>数学第一次</th>
			<th>数学第二次</th>
			<th>英语第一次</th>
			<th>英语第二次</th>
			<th>物理第一次</th>
			<th>物理第二次</th>
			<th>化学第一次</th>
			<th>化学第二次</th>
			<th>总分第一次</th>
			<th>总分第二次</th>
			<th>排名第一次</th>
			<th>排名第二次</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dtstudent" items="${dtstudentlist}">
			<tr>
				<td>${dtstudent.nid}</td>
				<td>'${dtstudent.pid}</td>
				<td>${dtstudent.name}</td>
				<td>${dtstudent.sex}</td>
				<td><fmt:message key="${dtstudent.sts}" /></td>
				<td>${dtstudent.policy}</td>
				<td>${dtstudent.birthyear}</td>
				<td>${dtstudent.birthmonth}</td>
				<td>${dtstudent.birthday}</td>
				<td>${dtstudent.healthy}</td>
				<td>${dtstudent.city}</td>
				<td>${dtstudent.address}</td>
				<td>${dtstudent.addcode}</td>
				<td>${dtstudent.phone}</td>
				<td>${dtstudent.cell}</td>
				<td>${dtstudent.gradeschool}</td>
				<td>${dtstudent.gradesection}</td>
				<td>${dtstudent.number}</td>
				<td>${dtstudent.daddy}</td>
				<td>${dtstudent.daddyname}</td>
				<td>${dtstudent.daddyjob}</td>
				<td>${dtstudent.daddyphone}</td>
				<td>${dtstudent.mummy}</td>
				<td>${dtstudent.mummyname}</td>
				<td>${dtstudent.mummyjob}</td>
				<td>${dtstudent.mummyphone}</td>
				<td>${dtstudent.yuwem1}</td>
				<td>${dtstudent.yuwem2}</td>
				<td>${dtstudent.shuxue1}</td>
				<td>${dtstudent.shuxue2}</td>
				<td>${dtstudent.yingyu1}</td>
				<td>${dtstudent.yingyu2}</td>
				<td>${dtstudent.wuli1}</td>
				<td>${dtstudent.wuli2}</td>
				<td>${dtstudent.huaxue1}</td>
				<td>${dtstudent.huaxue2}</td>
				<td>${dtstudent.zongfen1}</td>
				<td>${dtstudent.zongfen2}</td>
				<td>${dtstudent.paimin1}</td>
				<td>${dtstudent.paimin2}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>