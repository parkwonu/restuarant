<!-- 2018.07.06 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.Member" %>
<%@ page import="ownerPark.MemberLoginDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberLoginDao mdao = new MemberLoginDao();
			String a = mdao.mLoginCheck(id, pw);
			
			if(a.equals("01�α��μ���")){
				Member b = mdao.mGetForSession(id);
				session.setAttribute("S_ID", b.getM_id());
				session.setAttribute("S_NAME", b.getM_name());
				session.setAttribute("S_LEVEL", b.getM_level());	
		%>		
			<script type="text/javascript">
			alert('�α��μ���');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%	
			}else if(a.equals("02���̵����ġ")){
		%>
			<script type="text/javascript">
			alert('���̵� ����ġ');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%		
			}else if(a.equals("03�������ġ")){
		%>		
			<script type="text/javascript">
			alert('��� ����ġ');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%	
			}
		%>
	</body>
</html>