<!-- 2018.07.06 �ڿ��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MenuUpdateDao" %>
<%@ page import="ownerPark.Menu" %>
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
request.setCharacterEncoding("euc-kr"); 
	
String r_code = request.getParameter("r_code");
System.out.println(r_code + "<--�Ѱܹ��� �ڵ�");

MenuUpdateDao ndao = new MenuUpdateDao();
Menu n = ndao.menuUpdateForm(r_code);
%>
<h1>�޴� ���� ����</h1>
<form action = "<%= request.getContextPath() %>/Update/menuUpdateAction.jsp" method = "post">
				<ul id = "mem_form">
					<li>
						<ul class = "cols">
							<li class = "col1">�̸� :</li>
							<li class = "col2"><input type = "text" name = "r_name" value="<%=n.getF_name() %>">
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">���� :</li>
							<li class = "col2"><input type = "text" name = "r_kind" value="<%=n.getF_price() %>">
						</ul>
					</li>
					<li>
						<ul class = "cols3">
							<li><input type="submit" value="����"></li>
						</ul>
					</li>
				</ul>
			</form>
</body>
</html>