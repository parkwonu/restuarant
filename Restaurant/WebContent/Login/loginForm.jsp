<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="<%= request.getContextPath() %>/Login/loginAction.jsp" method="post">
			아이디 : <input type="text" name="id"> 
			비번 : <input type="password" name="pw"> 
			<input type="submit" value="로그인">
		</form>
	</body>
</html>