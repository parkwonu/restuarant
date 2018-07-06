<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page  import="ownerPark.Member" %>
<%@ page  import="ownerPark.MemberSearchDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>회원검색</div>
	<form action="<%= request.getContextPath()%>/Search/memberSearchActionList.jsp" method="post">
		<select name="sel">
			<option value="m_all">전체</option>
			<option value="m_id">아이디</option>
			<option value="m_name">이름</option>
			<option value="m_level">권한</option>
			<option value="m_email">이메일</option>
			<option value="m_addr">주소</option>
		</select>
		<input type="text" name="txt">
		<input type="submit" value="회원 찾기">
	</form>
	<h3>회원 리스트</h3>
	<table  border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>권한</td>
			<td>이메일</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>가입 날짜</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
<%
	request.setCharacterEncoding("euc-kr");

	String sel = request.getParameter("sel");
	String txt = request.getParameter("txt");
	System.out.println(sel + "셀렉트 박스");
	System.out.println(txt + "텍스트 박스");
	
	MemberSearchDao mdao = new MemberSearchDao();
	ArrayList<Member> get_allMemberList = mdao.memberSearch(sel, txt);
	
	for(int i=0; i<get_allMemberList.size(); i++){
		Member member = get_allMemberList.get(i);
%>
		<tr>
		<td><%=member.getM_id()%></td>
		<td><%=member.getM_pw()%></td>
		<td><%=member.getM_name()%></td>
		<td><%=member.getM_level()%></td>
		<td><%=member.getM_email()%></td>
		<td><%=member.getM_addr()%></td>
		<td><%=member.getM_phone()%></td>
		<td><%=member.getM_date() %></td>
		<td><a href="<%=request.getContextPath()%>/Update/memberUpdateForm.jsp?send_id=<%=member.getM_id()%>">수정</a></td>
		<td><a href="<%=request.getContextPath()%>/Delete/memberDeleteAction.jsp?send_id=<%=member.getM_id()%>">삭제</a></td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>