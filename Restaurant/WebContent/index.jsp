<!-- 2018.07.06 박원우 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>index</title>
</head>
<body>
			<%
				String S_ID = (String)session.getAttribute("S_ID");
				String S_NAME = (String)session.getAttribute("S_NAME");
				String S_LEVEL = (String)session.getAttribute("S_LEVEL");
				System.out.println(S_ID + "<-- S_ID");
				System.out.println(S_NAME + "<-- S_NAME");
				System.out.println(S_LEVEL + "<-- S_LEVEL");

				if(S_NAME == null){
			%>
				<h1>로그인</h1>
				<form action="<%= request.getContextPath() %>/Login/loginAction.jsp" method="post">
					아이디 : <input type="text" name="id"><br>
					비번 : <input type="password" name="pw"> 
					<input type="submit" value="로그인"><br>
				</form>
				<a href="<%= request.getContextPath() %>/Join/joinForm.jsp"> 회원가입 </a>
			<%
				}else{ 
			%>
					 아이디 <%= S_ID %> 님  로그인중
					<a href = "<%= request.getContextPath() %>/Login/logout.jsp">로그 아웃 </a><br><br>	

			<%	
					if(S_LEVEL.equals("일반회원")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> 내정보 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					}else if(S_LEVEL.equals("개인사업자")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> 내정보 </a>
					<a href="<%= request.getContextPath() %>/Insert/restaurantInsertForm.jsp"> 상품등록 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> 내정보 </a>
					<a href="<%= request.getContextPath() %>/Select/memberSearchList.jsp"> 전체회원검색 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					} 
				} 
			%>
</body>
</html>
