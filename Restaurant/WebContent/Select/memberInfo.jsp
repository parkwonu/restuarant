<!-- 2018.07.06 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MemberLoginDao" %>
<%@ page import="ownerPark.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + " : send_id");
	
	MemberLoginDao mdao = new MemberLoginDao();
	Member m = mdao.memberInfo(send_id);
%>
<h3>���� ȸ�� ����</h3>
<table border="1">
	<tr>
		<td>���̵�</td>
		<td><%=m.getM_id() %></td>
	</tr>
	<tr>
		<td>���</td>
		<td><%=m.getM_pw() %></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=m.getM_name() %></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=m.getM_level() %></td>
	</tr>
	<tr>
		<td>�̸���</td>
		<td><%=m.getM_email1() %></td>
	</tr>
	<tr>
		<td>�ּ�</td>
		<td><%=m.getM_addr() %></td>
	</tr>
	<tr>
		<td>��ȣ</td>
		<td><%=m.getM_phone1() %></td>
	</tr>
	<tr>
		<td>��ϳ�¥</td>
		<td><%=m.getM_date() %></td>
	</tr>
</table>
</body>
</html>