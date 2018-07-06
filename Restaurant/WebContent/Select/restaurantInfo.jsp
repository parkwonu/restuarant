<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.RestaurantInfoDao" %>
<%@ page import="ownerPark.Restaurant" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>음식점 정보</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");

	String send_code = request.getParameter("send_code");
	RestaurantInfoDao rdao = new RestaurantInfoDao();
	Restaurant info = rdao.restaurantInfo(send_code);
%>
	<div>
		<h2><%= info.getR_name()%></h2>
	</div>
	<div>
		<h3><%=info.getR_kind() %></h3>
	</div>
	<div>
		<a href="<%=request.getContextPath()%>/Select/menuInfo.jsp?send_code=<%=info.getR_code()%>">메뉴보기</a>
	</div>
	<div>
		전화번호 : <%=info.getR_phone() %>
	</div>
	<div>
		주소 : <%=info.getR_addr() %>
	</div>
	<div>
		등록 일자 : <%=info.getR_date() %>
	</div>
	<div>
		<input type="hidden" name="r_code" value="<%=info.getR_code() %>">
	</div>
</body>
</html>