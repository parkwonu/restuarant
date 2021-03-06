<!-- 김호순 2018.7.6(금) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.RestaurantSelectDao" %>
<%@ page import="ownerPark.Restaurant" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath()%>/Search/restaurantSearchActionList.jsp" method="post">
		<select name="sel">
			<option value="r_all">전체</option>
			<option value="r_name">음식점 이름</option>
			<option value="r_kind">음식 종류</option>
		</select>
		<input type="text" name="txt">
		<input type="submit" value="음시점 찾기">
	</form>
	<h3>음식점 리스트</h3>
	<table  border="1">
		<tr>
			<td>코드</td>
			<td>음식점 이름</td>
			<td>음식 종류</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>등록 일자</td>
		</tr>
<%
	request.setCharacterEncoding("euc-kr");

	RestaurantSelectDao rdao = new RestaurantSelectDao();
	System.out.println(rdao + "<--rdao");
	ArrayList<Restaurant> get_alr = rdao.restaurantAllSelect();
	System.out.println(get_alr + "<--get_alr");
	
	for(int i=0; i<get_alr.size(); i++){
		Restaurant restaurant = get_alr.get(i);
%>
	<tr>
		<td><%=restaurant.getR_code()%></td>
		<td><a href="<%=request.getContextPath()%>/Select/restaurantInfo.jsp?send_code=<%=restaurant.getR_code()%>"><%=restaurant.getR_name()%></a></td>
		<td><%=restaurant.getR_kind()%></td>
		<td><%=restaurant.getR_phone()%></td>
		<td><%=restaurant.getR_addr()%></td>
		<td><%=restaurant.getR_date()%></td>
	</tr>
<%
}
%>
	</table>
</body>
</html>