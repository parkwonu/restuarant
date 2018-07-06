<!-- 2018.07.06 박원우 -->
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
			
			if(a.equals("01로그인성공")){
				Member b = mdao.mGetForSession(id);
				session.setAttribute("S_ID", b.getM_id());
				session.setAttribute("S_NAME", b.getM_name());
				session.setAttribute("S_LEVEL", b.getM_level());	
		%>		
			<script type="text/javascript">
			alert('로그인성공');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%	
			}else if(a.equals("02아이디불일치")){
		%>
			<script type="text/javascript">
			alert('아이디 불일치');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%		
			}else if(a.equals("03비번불일치")){
		%>		
			<script type="text/javascript">
			alert('비번 불일치');
			location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
		<%	
			}
		%>
	</body>
</html>