<!-- 2018.07.06 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.RestaurantUpdateDao" %>
<!DOCTYPE html>

<jsp:useBean id="r" class="ownerPark.Restaurant"/>
<jsp:setProperty property="*" name="r"/>

<%
RestaurantUpdateDao rdao = new RestaurantUpdateDao();
System.out.println(rdao + "<--mdao");
rdao.restaurantUpdateAction(r);

response.sendRedirect(request.getContextPath()+"/Select/restaurantSearchList.jsp");
%>
