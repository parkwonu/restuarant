<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "ownerPark.MemberJoinDao" %>
<!DOCTYPE html>

<% request.setCharacterEncoding("euc-kr"); %>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<style type="text/css">
	        #wrap {
	            width: 490px;
	            text-align :center;
	            margin: 0 auto 0 auto;
	        }
	        #chk{
	            text-align :center;
	        }
	        #cancelBtn{
	            visibility:visible;
	        }
		</style>
		<script type="text/javascript">
			function sendCheckValue(){
	            // 중복체크 결과인 idCheck 값을 전달한다.
	            opener.document.userInfo.m_idDuplication.value ="idCheck";
	            // 회원가입 화면의 ID입력란에 값을 전달
	            opener.document.userInfo.m_id.value = document.getElementById("userId").value;
	            
	            if (opener != null) {
	                opener.chkForm = null;
	                self.close();
	            }    
	        }
		</script>
	</head>
	
	<body>
		<%
			String id = request.getParameter("m_id");
			System.out.println(id+"<--id");
			
			MemberJoinDao dao = new MemberJoinDao();
			int re = dao.check(id);
			System.out.println(re+"<-- re");
			if(re==1) {
		%>
				<script type="text/javascript">
					alert("사용 가능한 아이디입니다.");
				</script>
				<div id="wrap">
				    <br>
				    <b><font size="4" color="gray">아이디 중복체크</font></b>
				    <hr size="1" width="460">
				    <br>
				    <div id="chk">
				        <form id="checkForm">
				            <input type="text" name="m_id" id="userId" value="<%=id%>">
				            <input type="submit" value="중복확인">
				        </form>
				        <div id="msg"></div>
				        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
				        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
				    </div>
				</div>
		<%
			} else if(re==2){
		%>
				<script type="text/javascript">
					alert("아이디를 입력하세요.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			} else if(re==3){
		%>
				<script type="text/javascript">
					alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			} else if(re==4){
		%>
				<script type="text/javascript">
					alert("중복된 아이디입니다.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			}
		%>
	</body>
</html>