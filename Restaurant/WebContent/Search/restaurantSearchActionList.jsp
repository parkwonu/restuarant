<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.Restaurant" %>
<%@ page import="ownerPark.RestaurantSearchDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>ȸ���˻�</div>
	<form action="<%= request.getContextPath()%>/Search/restaurantSearchActionList.jsp" method="post">
		<select name="sel">
			<option value="r_all">��ü</option>
			<option value="r_name">������ �̸�</option>
			<option value="r_kind">���� ����</option>
		</select>
		<input type="text" name="txt">
		<input type="submit" value="������ ã��">
	</form>
	<h3>������ ����Ʈ</h3>
	<table  border="1">
		<tr>
			<td>�ڵ�</td>
			<td>������ �̸�</td>
			<td>���� ����</td>
			<td>��ȭ��ȣ</td>
			<td>�ּ�</td>
			<td>��� ����</td>
		</tr>
<%
	request.setCharacterEncoding("euc-kr");
	
	String sel = request.getParameter("sel");
	String txt = request.getParameter("txt");
	System.out.println(sel + "����Ʈ �ڽ�");
	System.out.println(txt + "�ؽ�Ʈ �ڽ�");
	
	RestaurantSearchDao rdao = new RestaurantSearchDao();
	ArrayList<Restaurant> get_allRestaurantList = rdao.restaurantSearch(sel, txt);
	
	for(int i=0; i<get_allRestaurantList.size(); i++){
		Restaurant restaurant = get_allRestaurantList.get(i);
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