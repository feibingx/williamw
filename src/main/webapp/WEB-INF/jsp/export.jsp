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
				<td>${dtstudent.pid}</td>
				<td>${dtstudent.name}</td>
				<td>${dtstudent.sex}</td>
				<td><fmt:message key="${dtstudent.sts}" /></td>
				<td>${policy}</td>
				<td>${birthyear}</td>
				<td>${birthmonth}</td>
				<td>${birthday}</td>
				<td>${healthy}</td>
				<td>${city}</td>
				<td>${address}</td>
				<td>${addcode}</td>
				<td>${phone}</td>
				<td>${cell}</td>
				<td>${gradeschool}</td>
				<td>${gradesection}</td>
				<td>${number}</td>
				<td>${daddy}</td>
				<td>${daddyname}</td>
				<td>${daddyjob}</td>
				<td>${daddyphone}</td>
				<td>${mummy}</td>
				<td>${mummyname}</td>
				<td>${mummyjob}</td>
				<td>${mummyphone}</td>
				<td>${yuwem1}</td>
				<td>${yuwem2}</td>
				<td>${shuxue1}</td>
				<td>${shuxue2}</td>
				<td>${yingyu1}</td>
				<td>${yingyu2}</td>
				<td>${wuli1}</td>
				<td>${wuli2}</td>
				<td>${huaxue1}</td>
				<td>${huaxue2}</td>
				<td>${zongfen1}</td>
				<td>${zongfen2}</td>
				<td>${paimin1}</td>
				<td>${paimin2}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>