<!-- 2018.07.06 �ڿ��� -->
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
	font-family: "���� ���";
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
/* inline�̿��� ��ҵ��� block���� �ٲ� */
#login-form input, #login-form label {
	display: block;
}

#login-form label {
	margin-top: 10px;
}

#login-form input {
	margin-top: 5px;
}
/* ��Ʈ����Ʈ ������ */
#login-form input[type='image'] {
	margin: 10px auto;
}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/Login/loginAction.jsp" id="login-form" method="post" >
		<label class="legend">���̵�</label> <input name="id" type="text">
		<label class="legend">�н�����</label> <input name="pw" type="password">
		<div>
			<input type="submit" value="�α���">
			<button>
				<a href="<%= request.getContextPath() %>/Join/joinForm.jsp">ȸ������</a>
			</button>
		</div>
	</form>
</body>
</html>
