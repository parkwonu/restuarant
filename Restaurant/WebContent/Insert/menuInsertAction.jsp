<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "ownerPark.MenuInsertDao" %>
<!DOCTYPE html>


<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="n" class="ownerPark.Menu"/>
<jsp:setProperty name="n" property="*"/>

<%
	String r_code = request.getParameter("r_code");
	
	MenuInsertDao ndao = new MenuInsertDao();
	ndao.menuInsert(n,r_code);
%>
<script type="text/javascript">
	alert("메뉴가 등록되었습니다.");
	location.href = "<%=request.getContextPath()%>/Select/menuSearchList.jsp";
</script>