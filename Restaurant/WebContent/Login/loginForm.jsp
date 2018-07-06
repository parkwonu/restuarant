<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "맑은 고딕";
	font-size: 0.75em;
	color: #333;
}

#login-form {
	width: 200px;
	margin: 50px;
	border: 1px solid gray;
	border-radius: 5px;
	padding: 15px;
}
/* inline이였던 요소들을 block으로 바꿈 */
#login-form input, #login-form label {
	display: block;
}

#login-form label {
	margin-top: 10px;
}

#login-form input {
	margin-top: 5px;
}
/* 애트리뷰트 선택자 */
#login-form input[type='image'] {
	margin: 10px auto;
}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/Login/loginAction.jsp" id="login-form" method="post" >
		<label class="legend">아이디</label> <input name="id" type="text">
		<label class="legend">패스워드</label> <input name="pw" type="password">
		<div>
			<input type="submit" value="로그인">
			<button>
				<a href="<%= request.getContextPath() %>/Join/joinForm.jsp">회원가입</a>
			</button>
		</div>
	</form>
</body>
</html>
