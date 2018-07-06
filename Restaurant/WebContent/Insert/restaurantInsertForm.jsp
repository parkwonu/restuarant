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
		<h1>음식점 입력</h1>
			<form action = "<%= request.getContextPath() %>/Insert/restaurantInsertAction.jsp" method = "post">
				<ul id = "mem_form">
					<li>
						<ul class = "cols">
							<li class = "col1">음식점 이름 :</li>
							<li class = "col2"><input type = "text" name = "r_name">
						</ul>
					</li>
					<li>
						<ul class = "cols">
							<li class = "col1">음식점 종류 :</li>
							<li class = "col2"><input type = "text" name = "r_kind">
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
							<li class = "col2"><input type = "text" name = "r_addr"></li>
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