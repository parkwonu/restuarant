<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page  import="ownerPark.Member" %>
<%@ page  import="ownerPark.MemberSearchDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>ȸ���˻�</div>
	<form action="<%= request.getContextPath()%>/Search/memberSearchActionList.jsp" method="post">
		<select name="sel">
			<option value="m_all">��ü</option>
			<option value="m_id">���̵�</option>
			<option value="m_name">�̸�</option>
			<option value="m_level">����</option>
			<option value="m_email">�̸���</option>
			<option value="m_addr">�ּ�</option>
		</select>
		<input type="text" name="txt">
		<input type="submit" value="ȸ�� ã��">
	</form>
	<h3>ȸ�� ����Ʈ</h3>
	<table  border="1">
		<tr>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸�</td>
			<td>����</td>
			<td>�̸���</td>
			<td>�ּ�</td>
			<td>��ȭ��ȣ</td>
			<td>���� ��¥</td>
			<td>����</td>
			<td>����</td>
		</tr>
<%
	request.setCharacterEncoding("euc-kr");

	String sel = request.getParameter("sel");
	String txt = request.getParameter("txt");
	System.out.println(sel + "����Ʈ �ڽ�");
	System.out.println(txt + "�ؽ�Ʈ �ڽ�");
	
	MemberSearchDao mdao = new MemberSearchDao();
	ArrayList<Member> get_allMemberList = mdao.memberSearch(sel, txt);
	
	for(int i=0; i<get_allMemberList.size(); i++){
		Member member = get_allMemberList.get(i);
%>
		<tr>
		<td><%=member.getM_id()%></td>
		<td><%=member.getM_pw()%></td>
		<td><%=member.getM_name()%></td>
		<td><%=member.getM_level()%></td>
		<td><%=member.getM_email()%></td>
		<td><%=member.getM_addr()%></td>
		<td><%=member.getM_phone()%></td>
		<td><%=member.getM_date() %></td>
		<td><a href="<%=request.getContextPath()%>/Update/memberUpdateForm.jsp?send_id=<%=member.getM_id()%>">����</a></td>
		<td><a href="<%=request.getContextPath()%>/Delete/memberDeleteAction.jsp?send_id=<%=member.getM_id()%>">����</a></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>