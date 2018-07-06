<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/common.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/header.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/footer.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/main.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/join.css">
	</head>
	
	<body>
		<%
			String r_code = request.getParameter("r_code");
		%>
		<h1>메뉴 입력</h1>
			<form action = "<%= request.getContextPath() %>/Insert/menuInsertAction.jsp?r_code=<%=r_code %>" method = "post">
				<ul id = "mem_form">
					<li>
						<ul class = "cols">
							<li class = "col1">이름 :</li>
							<li class = "col2"><input type = "text" name = "f_name">
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">가격 :</li>
							<li class = "col2"><input type = "text" name = "f_price">
						</ul>
					</li>
					<li>
						<ul class = "cols3">
							<li><input type="submit" value="등록"></li>
						</ul>
					</li>
				</ul>
			</form>
	</body>
</html>