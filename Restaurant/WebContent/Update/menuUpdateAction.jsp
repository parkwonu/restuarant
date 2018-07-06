<!-- 2018.07.06 ¹Ú¿ø¿ì -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MenuUpdateDao" %>
<!DOCTYPE html>

<jsp:useBean id="n" class="ownerPark.Menu"/>
<jsp:setProperty property="*" name="n"/>

<%
MenuUpdateDao ndao = new MenuUpdateDao();
ndao.menuUpdateAction(n);

response.sendRedirect(request.getContextPath()+"/Select/menuSearchList.jsp");
%>