<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>댓글 입력</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/comment.css">
	</head>
	
	<body>
		<%
			String f_name = null; //메뉴 -> 음식명 (임의명)
			String S_ID = (String)session.getAttribute("S_ID");
		%>
		<form action = "<%= request.getContextPath() %>/Insert/commentInsertAction.jsp" method = "post">
			<div id = "comment_box">
				<img id = "title_comment" src = "<%= request.getContextPath() %>/img/title_comment.gif">
				<textarea name = "commentContent"></textarea>
				<input type = "hidden" name = "f_name" value = "<%= f_name %>">
				<input type = "hidden" name = "id" value = "<%= S_ID %>">
				<input id = "ok_ripple" type="IMAGE" src = "<%= request.getContextPath() %>/img/ok_ripple.gif" value = "submit">
			</div>
		</form>
	</body>
</html>