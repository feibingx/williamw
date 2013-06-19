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