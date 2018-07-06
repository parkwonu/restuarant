<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.RestaurantUpdateDao" %>
<%@ page import="ownerPark.Restaurant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberUpdateForm</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/common.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/header.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/footer.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/main.css">
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/join.css">
	</head>
	<body>
<%request.setCharacterEncoding("euc-kr"); %>
<%
	String r_code = request.getParameter("r_code");
	System.out.println(r_code + "<--넘겨받은 코드");

	RestaurantUpdateDao rdao = new RestaurantUpdateDao();
	System.out.println(rdao + "<--MemberDao");
	Restaurant r = rdao.restaurantUpdateForm(r_code);
	System.out.println(r + "<--send_code");
%>
		<h1>음식점 정보 수정</h1>
		<form action = "<%= request.getContextPath() %>/Update/restaurantUpdateAction.jsp" method = "post">
				<ul id = "mem_form">
					<li>
						<ul class = "cols">
							<li class = "col1">음식점 이름 :</li>
							<li class = "col2"><input type = "text" name = "r_name" value="<%=r.getR_name() %>">
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">음식점 종류 :</li>
							<li class = "col2"><input type = "text" name = "r_kind" value="<%=r.getR_kind() %>">
						</ul>
					</li>
					<li>
							<ul class = "cols">
							<li class = "col1">휴대전화 :</li>
							<li class = "col2">
								<select name = r_phone1>
									<option>010</option>
									<option>011</option>
									<option>017</option>
								</select> -
								<input class = "hp" type = "text" name = "r_phone2"> - <input class = "hp" type = "text" name = "r_phone3">
							</li>
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">주소 :</li>
							<li class = "col2"><input type = "text" name = "r_addr" value="<%=r.getR_addr() %>"></li>
						</ul>
					</li>
					<li>
						<ul class = "cols3">
							<li><input type="submit" value="수정"></li>
						</ul>
					</li>
				</ul>
			</form>
	</body>
</html>