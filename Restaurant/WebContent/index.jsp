<!-- 박원우 2018-07-06 -->
<!-- index.jsp -->
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
				<form action="<%= request.getContextPath() %>/Login/loginAction.jsp" method="post">
					아이디 : <input type="text" name="id"> 
					비번 : <input type="password" name="pw"> 
					<input type="submit" value="로그인">
				</form>
			<%
				}else{ 
			%>
					<%= S_ID %> 아이디 <%= S_NAME %> 님 <%= S_LEVEL %> 권한 로그인중
					<a href = "<%= request.getContextPath() %>/login/logout.jsp"> 로그 아웃 </a><br><br>	

			<%	
					if(S_LEVEL.equals("일반회원")){ 
			%>
					<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"> 회원가입 </a>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> 내정보 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					}else if(S_LEVEL.equals("개인사업자")){ 
			%>
					<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"> 회원가입 </a>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> 내정보 </a>
					<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> 상품등록 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp"> 전체회원검색 </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> 상품검색 </a>
			<%	
					} 
				} 
			%>
</body>
</html>
