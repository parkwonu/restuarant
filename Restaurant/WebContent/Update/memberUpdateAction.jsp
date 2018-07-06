<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MemberUpdateDao" %>
<!DOCTYPE html>
<title>memberUpdateAction</title>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="ownerPark.Member"/>
<jsp:setProperty property="*" name="m"/>
<%
	MemberUpdateDao mdao = new MemberUpdateDao();
	System.out.println(mdao + "<--mdao");
	mdao.memberUpdateAction(m);
	
	response.sendRedirect(request.getContextPath()+"/Select/memberSearchList.jsp");
%>
