<!-- 2018-06-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>joinForm</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/common.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/header.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/footer.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/main.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/join.css">
	</head>
	
	<body>
		<%
			String loginInfo = (String)session.getAttribute("loginInfo");
		%>
		<div id = "wrap">
			<header>
				<a href = "./index.jsp"><img id = "logo" src = "<%= request.getContextPath() %>/img/logo.png"></a>
				<nav id = "top_menu">
					HOME | LOGIN | JOIN | NOTICE
				</nav>
				<nav id = "main_menu">
					<ul>
						<li><a href = "<%= request.getContextPath() %>/boardList.jsp">���� �Խ���</a></li>
						<li><a href = "#"></a></li>
						<li><a href = "#"></a></li>
						<li><a href = "#"></a></li>
						<li><a href = "#"></a></li>
					</ul>
				</nav>
			</header>
			<aside>
				<form action="./loginAction.jsp" method="post">
					<article id = "login_box">
						<img id = "login_title" src = "<%= request.getContextPath() %>/img/ttl_login.png">
						<div id = "input_button">
						<%
							if(loginInfo == null) {
						%>
								<ul id = "login_input">
									<li><input type = "text" name = "id"></li>
									<li><input type = "password" name = "pw"></li>
								</ul>
								<input id = "login_btn" type="IMAGE" src = "<%= request.getContextPath() %>/img/btn_login.gif" name = "submit" value = "submit">
						<%
							} else {
						%>	
								<ul id = "login_input">
									<li>&nbsp;&nbsp;&nbsp;&nbsp;<%= loginInfo %>�� �α��� ��<br><br></li>
								</ul>
								<a href = "<%= request.getContextPath() %>/logout.jsp"><img id = "login_btn" src = "<%= request.getContextPath() %>/img/logout.png"></a>
						<%
							}
						%>
						</div>
						<div class = "clear"></div>
						<div id = "join_search">
							<a href = "<%= request.getContextPath() %>/join.jsp"><img src = "<%= request.getContextPath() %>/img/btn_join.gif"></a>
							<img src = "<%= request.getContextPath() %>/img/btn_search.gif">
						</div>
					</article>
				</form>
			</aside>
			<h1>���� ���</h1>
			<form action = "<%= request.getContextPath() %>/joinAction.jsp" method = "post">
				<ul id = "mem_form">
					<li>
						<ul class = "cols">
							<li class = "col1">���̵� :</li>
							<li class = "col2"><input type = "text" name = "m_id"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">��й�ȣ :</li>
							<li class = "col2"><input type = "password" name = "m_pw"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">��й�ȣ Ȯ�� :</li>
							<li class = "col2"><input type = "password" name = "m_pw1"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">�̸� :</li>
							<li class = "col2"><input type = "text" name = "m_name"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">���� :</li>
							<li class = "col2"><input type = "radio" name = "m_level" checked="checked" value="���λ����">  ���λ����&nbsp;&nbsp;<input type = "radio" name = "m_level" value="�Ϲ�ȸ��"> �Ϲ�ȸ�� </li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">�̸��� :</li>
							<li class = "col2"><input type = "text" name = "m_email1"> @
								<select name = "m_email2">
									<option>����</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>gmail.com</option>
								</select>
							</li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">�ּ� :</li>
							<li class = "col2"><input type = "text" name = "m_addr"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">�޴���ȭ :</li>
							<li class = "col2">
								<select name = m_phone1>
									<option>010</option>
									<option>011</option>
									<option>017</option>
								</select> -
								<input class = "hp" type = "text" name = "m_phone2"> - <input class = "hp" type = "text" name = "m_phone3">
							</li>
						</ul>
					</li>
					<li>
						<ul class = "cols3">
							<li><input type="submit" value="ȸ������"></li>
						</ul>
					</li>
				</ul>
			</form>
			<footer>
				<img id = "footer_logo" src = "<%= request.getContextPath() %>/img/footer_logo.gif">
				<ul id = "address">
					<li>����� ������ �Ｚ�� 1234 �� : 123-1234</li>
					<li>TEL : 031-123-1234 Email : email@domain.com</li>
					<li>COPYRIGHT (C) ����� ALL RIGHT RESERVED</li>
				</ul>
				<ul id ="footer_sns">
					<li><img src ="<%= request.getContextPath() %>/img/facebook.gif"></li>
					<li><img src = "<%= request.getContextPath() %>/img/blog.gif"></li>
					<li><img src = "<%= request.getContextPath() %>/img/twitter.gif"></li>
				</ul>
			</footer>
		</div>
	</body>
</html>