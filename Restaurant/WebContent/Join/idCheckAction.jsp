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
	            // �ߺ�üũ ����� idCheck ���� �����Ѵ�.
	            opener.document.userInfo.m_idDuplication.value ="idCheck";
	            // ȸ������ ȭ���� ID�Է¶��� ���� ����
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
					alert("��� ������ ���̵��Դϴ�.");
				</script>
				<div id="wrap">
				    <br>
				    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
				    <hr size="1" width="460">
				    <br>
				    <div id="chk">
				        <form id="checkForm">
				            <input type="text" name="m_id" id="userId" value="<%=id%>">
				            <input type="submit" value="�ߺ�Ȯ��">
				        </form>
				        <div id="msg"></div>
				        <input id="cancelBtn" type="button" value="���" onclick="window.close()"><br>
				        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
				    </div>
				</div>
		<%
			} else if(re==2){
		%>
				<script type="text/javascript">
					alert("���̵� �Է��ϼ���.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			} else if(re==3){
		%>
				<script type="text/javascript">
					alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			} else if(re==4){
		%>
				<script type="text/javascript">
					alert("�ߺ��� ���̵��Դϴ�.");
					location.href = "./idCheckForm.jsp";
				</script>
		<%
			}
		%>
	</body>
</html>