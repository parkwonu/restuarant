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
				<%@ include file="/Login/loginForm.jsp" %>
			<%
				}else{ 
			%>
					 아이디 <%= S_ID %> 님  로그인중
					<button><a href = "<%= request.getContextPath() %>/Login/logout.jsp">로그 아웃 </a></button><br><br>	

			<%	
					if(S_LEVEL.equals("일반회원")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">회원가입</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">내정보</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">상품검색</a></button>
			<%	
					}else if(S_LEVEL.equals("개인사업자")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">회원가입</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">내정보</a></button>
					<button><a href="<%= request.getContextPath() %>/Insert/restaurantInsertForm.jsp">상품등록</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">상품검색</a></button>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">회원가입</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">내정보</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberSearchList.jsp">전체회원검색</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">상품검색</a></button>
			<%	
					} 
				} 
			%>
</body>
</html>
