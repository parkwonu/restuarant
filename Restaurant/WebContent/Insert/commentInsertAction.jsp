<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "ownerPark.CommentDao" %>
<!DOCTYPE html>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="c" class="ownerPark.Comment"/>
<jsp:setProperty name="c" property="*"/>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>댓글 입력 Action</title>
	</head>
	
	<body>
		<%
			CommentDao comment = new CommentDao();
			comment.commentInsert(c);
			
			response.sendRedirect(request.getContextPath() + "/");
		%>
	</body>
</html>