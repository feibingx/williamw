<%@ page contentType="application/vnd.ms-excel; charset=gbk"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String filename = new String(("ѧ���б�").getBytes("GBK"), "ISO-8859-1");
	response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html>
<head>
<meta name="Generator" content="Microsoft Excel 11">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<center><b>ѧ���б�</b></center>
<br>
<table border="1" align="center" cellpadding="0" cellspacing="1">
	<thead>
		<tr>
			<th>#</th>
			<th>���֤��</th>
			<th>����</th>
			<th>�Ա�</th>
			<th>��ҵѧУ</th>
			<th>״̬</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="dtstudent" items="${dtstudentlist}">
			<tr>
				<td>${dtstudent.nid}</td>
				<td>${dtstudent.pid}</td>
				<td>${dtstudent.name}</td>
				<td>${dtstudent.sex}</td>
				<td>${dtstudent.gradeschool}</td>
				<td><fmt:message key="${dtstudent.sts}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>