<%@ page contentType="application/vnd.ms-excel; charset=gbk"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String filename = new String(("ѧ���б�").getBytes(), "ISO-8859-1");
	response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html>
<head>
<meta name="Generator" content="Microsoft Excel 11">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<center><b>ѧ���б�</b></center>
<table border="1" align="center" cellpadding="0" cellspacing="1">
	<thead>
		<tr>
			<th>���</th>
			<th>���֤����</th>
			<th>����</th>
			<th>�Ա�</th>
			<th>״̬</th>
			<th>������ò</th>
			<th>������</th>
			<th>������</th>
			<th>������</th>
			<th>����״��</th>
			<th>�������ڵ�</th>
			<th>��ַ</th>
			<th>�ұ�</th>
			<th>�绰</th>
			<th>�ֻ�</th>
			<th>��ҵԺϵ</th>
			<th>��ҵ����</th>
			<th>�п�������</th>
			<th>�ҳ���ν</th>
			<th>�ҳ�����</th>
			<th>�ҳ�������λ</th>
			<th>�ҳ���ϵ�绰</th>
			<th>�ҳ���ν</th>
			<th>�ҳ�����</th>
			<th>�ҳ�������λ</th>
			<th>�ҳ���ϵ�绰</th>
			<th>���ĵ�һ��</th>
			<th>���ĵڶ���</th>
			<th>��ѧ��һ��</th>
			<th>��ѧ�ڶ���</th>
			<th>Ӣ���һ��</th>
			<th>Ӣ��ڶ���</th>
			<th>�����һ��</th>
			<th>����ڶ���</th>
			<th>��ѧ��һ��</th>
			<th>��ѧ�ڶ���</th>
			<th>�ֵܷ�һ��</th>
			<th>�ֵܷڶ���</th>
			<th>������һ��</th>
			<th>�����ڶ���</th>
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