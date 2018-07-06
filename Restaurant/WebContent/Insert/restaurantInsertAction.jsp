<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "ownerPark.RestaurantInsertDao" %>
<!DOCTYPE html>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="r" class="ownerPark.Restaurant"/>
<jsp:setProperty name="r" property="*"/>

<%
	RestaurantInsertDao Restaurant = new RestaurantInsertDao();
	Restaurant.restaurantInsert(r);
%>
<script type="text/javascript">
	alert("음식점이 등록되었습니다.");
	location.href = "<%=request.getContextPath()%>/index.jsp";
</script>