<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="ownerPark.MemberDeleteDao" %>
<!DOCTYPE html>
<jsp:useBean id="memberDelete" class="ownerPark.Member"/>
<jsp:setProperty property="*" name="memberDelete"/>
<%
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + "<--넘겨받은 값");

	MemberDeleteDao mdao = new MemberDeleteDao();
	mdao.MemberDelete(send_id);
	
	response.sendRedirect(request.getContextPath()+"/Select/memberSearchList.jsp");
%>
