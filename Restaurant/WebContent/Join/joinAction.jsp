<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "ownerPark.MemberJoinDao" %>
<!DOCTYPE html>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="ownerPark.Member"/>
<jsp:setProperty name="m" property="*"/>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>joinAction</title>
	</head>
	
	<body>
		<%
			MemberJoinDao dao = new MemberJoinDao();
			dao.join(m);
		%>
			<script type="text/javascript">
				alert("회원가입 성공!");
				location.href = "<%=request.getContextPath()%>/index.jsp";
			</script>
	</body>
</html>