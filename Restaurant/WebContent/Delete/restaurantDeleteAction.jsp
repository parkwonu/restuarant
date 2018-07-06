<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.RestaurantDeleteDao" %>
<!DOCTYPE html>

<jsp:useBean id="rd" class="ownerPark.Restaurant"/>
<jsp:setProperty property="*" name="rd"/>
<%
	String r_code = request.getParameter("r_code");
	System.out.println(r_code + "<--넘겨받은 값");

	RestaurantDeleteDao rdao = new RestaurantDeleteDao();
	rdao.restaurantDelete(r_code);
	
	response.sendRedirect(request.getContextPath()+"/Select/restaurantSearchList.jsp");
%>