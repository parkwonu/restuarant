<!-- 2018.07.06 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MenuDeleteDao" %>
<!DOCTYPE html>

<jsp:useBean id="nd" class="ownerPark.Menu"/>
<jsp:setProperty property="*" name="nd"/>
<%
	String r_code = request.getParameter("r_code");
	System.out.println(r_code + "<--넘겨받은 값");

	MenuDeleteDao ndao = new MenuDeleteDao();
	ndao.menuDelete(r_code);
	
	response.sendRedirect(request.getContextPath()+"/Select/menuSearchList.jsp");
%>