<!-- 2018.07.06 �ڿ��� -->
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
				<h1>�α���</h1>
				<form action="<%= request.getContextPath() %>/Login/loginAction.jsp" method="post">
					���̵� : <input type="text" name="id"><br>
					��� : <input type="password" name="pw"> 
					<input type="submit" value="�α���"><br>
				</form>
				<a href="<%= request.getContextPath() %>/Join/joinForm.jsp"> ȸ������ </a>
			<%
				}else{ 
			%>
					 ���̵� <%= S_ID %> ��  �α�����
					<a href = "<%= request.getContextPath() %>/Login/logout.jsp">�α� �ƿ� </a><br><br>	

			<%	
					if(S_LEVEL.equals("�Ϲ�ȸ��")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> ������ </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					}else if(S_LEVEL.equals("���λ����")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> ������ </a>
					<a href="<%= request.getContextPath() %>/Insert/restaurantInsertForm.jsp"> ��ǰ��� </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> ������ </a>
					<a href="<%= request.getContextPath() %>/Select/memberSearchList.jsp"> ��üȸ���˻� </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					} 
				} 
			%>
</body>
</html>
