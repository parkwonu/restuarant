<!-- �ڿ��� 2018-07-06 -->
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
					���̵� : <input type="text" name="id"> 
					��� : <input type="password" name="pw"> 
					<input type="submit" value="�α���">
				</form>
			<%
				}else{ 
			%>
					<%= S_ID %> ���̵� <%= S_NAME %> �� <%= S_LEVEL %> ���� �α�����
					<a href = "<%= request.getContextPath() %>/login/logout.jsp"> �α� �ƿ� </a><br><br>	

			<%	
					if(S_LEVEL.equals("�Ϲ�ȸ��")){ 
			%>
					<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"> ȸ������ </a>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> ������ </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					}else if(S_LEVEL.equals("���λ����")){ 
			%>
					<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp"> ȸ������ </a>
					<a href="<%= request.getContextPath() %>/Select/memberInfo.jsp?send_id=<%=S_ID%>"> ������ </a>
					<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp"> ��ǰ��� </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					}else if(S_ID.equals("id001")){ 
			%>
					<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp"> ��üȸ���˻� </a>
					<a href="<%= request.getContextPath() %>/Select/restaurantSearchList.jsp"> ��ǰ�˻� </a>
			<%	
					} 
				} 
			%>
</body>
</html>
