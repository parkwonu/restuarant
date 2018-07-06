<!-- 2018.7.4 김호순 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MemberUpdateDao" %>
<%@ page import="ownerPark.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberUpdateForm</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/signUpForm.css">
	</head>
	<body>
<%request.setCharacterEncoding("euc-kr"); %>
<%
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<--넘겨받은 아이디");

	MemberUpdateDao mdao = new MemberUpdateDao();
	System.out.println(mdao + "<--MemberDao");
	Member m = mdao.memberUpdateForm(send_id);
	System.out.println(m + "<--send_id");
%>
	
		<h3>회원정보 수정</h3>
		<form action="<%=request.getContextPath()%>/Update/memberUpdateAction.jsp" method="post">
			<ul id="mem_form">
				<li>
					<ul class="cols">
						<li class="col1">아이디 :</li>
						<li class="col2"><input type="text" name="id"  value="<%=m.getM_id() %>" readonly></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">비밀번호 :</li>
						<li class="col2"><input type="password" name="pw" value="<%=m.getM_pw() %>" required></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">이름 :</li>
						<li class="col2"><input type="text" name="name" value="<%=m.getM_name() %>" required></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">권한 :</li>
						<li class="col2"><input type="text" name="level" value="<%=m.getM_level() %>" readonly></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">이메일</li>
						<li class="col2"><input id="email1" type="text" name="email1">@
							<select id="email2" name="email2">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">휴대전화</li>
						<li class="col2">
							<select name="phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
							</select> -
							<input class="hp" type="text" name="phone2"> - <input class="hp" type="text" name="phone3">
						</li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">주소 :</li>
						<li class="col2"><input type="text" name="addr" value="<%=m.getM_addr() %>" required></li>
					</ul>
				</li>
			</ul>
			<input type="submit" value="수정완료">
		</form>
	</body>
</html>