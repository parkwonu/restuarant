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
				<%@ include file="/Login/loginForm.jsp" %>
			<%
				}else{ 
			%>
					 ���̵� <%= S_ID %> ��  �α�����
					<button><a href = "<%= request.getContextPath() %>/Login/logout.jsp">�α� �ƿ� </a></button><br><br>	

			<%	
					if(S_LEVEL.equals("�Ϲ�ȸ��")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">ȸ������</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">������</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">��ǰ�˻�</a></button>
			<%	
					}else if(S_LEVEL.equals("���λ����")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">ȸ������</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">������</a></button>
					<button><a href="<%= request.getContextPath() %>/Insert/restaurantInsertForm.jsp">��ǰ���</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">��ǰ�˻�</a></button>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<button><a href="<%= request.getContextPath() %>/Join/joinForm.jsp">ȸ������</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>">������</a></button>
					<button><a href="<%= request.getContextPath() %>/Select/memberSearchList.jsp">��üȸ���˻�</a></button>
					<button><a href="<%= request.getContextPath() %>/index.jsp">��ǰ�˻�</a></button>
			<%	
					} 
				} 
			%>
</body>
</html>
