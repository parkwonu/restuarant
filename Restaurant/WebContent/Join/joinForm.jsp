<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>joinForm</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/join.css">
		<script type="text/javascript">
			// ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
			function checkValue() {
				var form = document.userInfo;
				if(!form.m_id.value){
					alert("���̵� �Է��ϼ���.");
					return false;
				}
				if(form.m_idDuplication.value != "idCheck"){
        			alert("���̵� �ߺ�üũ�� ���ּ���.");
        			return false;
    			}
			    if(!form.m_pw.value){
			        alert("��й�ȣ�� �Է��ϼ���.");
			        return false;
			    }
				// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			    if(form.m_pw.value != form.m_pw1.value ){
			        alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			        return false;
			    }    
			    if(!form.m_name.value){
			        alert("�̸��� �Է��ϼ���.");
			        return false;
			    }
			    if(!form.m_email1.value && form.m_email2.value){
			        alert("���� �ּҸ� �Է��ϼ���.");
			        return false;
			    }
			    if(!form.m_phone1.value && !form.m_phone2.value && !form.m_phone3.value){
			        alert("��ȭ��ȣ�� �Է��ϼ���.");
			        return false;
			    }
			    if(!form.m_addr.value){
			        alert("�ּҸ� �Է��ϼ���.");
			        return false;
			    }
			}
			// ��� ��ư Ŭ���� ùȭ������ �̵�
			function goFirstForm() {
			    location.href="joinForm.jsp";
			}    
			// ���̵� �ߺ�üũ ȭ��open
			function openIdChk(){
			    window.name = "parentForm";
			    window.open("<%= request.getContextPath() %>/Join/idCheckForm.jsp","chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
			}
			// ���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�.
			// �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� �Է����� ��
			// �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
			function inputIdChk(){
				document.userInfo.idDuplication.value ="idUncheck";
			}
		</script>
	</head>
	
	<body>
		<form name="userInfo" onsubmit="return checkValue()" action = "<%= request.getContextPath() %>/Join/joinAction.jsp" method = "post">
			<h1>���� ���</h1>
			<ul id = "mem_form">
				<li>
					<ul class = "cols">
						<li class = "col1">���̵� :</li>
						<li class = "col2"><input type = "text" name = "m_id" onkeydown="inputIdChk()">&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()"></li>
						<li><input type="hidden" name="m_idDuplication" value="idUncheck"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">��й�ȣ :</li>
						<li class = "col2"><input type = "password" name = "m_pw"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">��й�ȣ Ȯ�� :</li>
						<li class = "col2"><input type = "password" name = "m_pw1"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">�̸� :</li>
						<li class = "col2"><input type = "text" name = "m_name"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">���� :</li>
						<li class = "col2"><input type = "radio" name = "m_level" checked="checked" value="���λ����">  ���λ����&nbsp;&nbsp;<input type = "radio" name = "m_level" value="�Ϲ�ȸ��"> �Ϲ�ȸ�� </li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">�̸��� :</li>
						<li class = "col2"><input type = "text" name = "m_email1"> @
							<select name = "m_email2">
								<option>����</option>
								<option>naver.com</option>
								<option>hanmail.net</option>
								<option>gmail.com</option>
							</select>
						</li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">�ּ� :</li>
						<li class = "col2"><input type = "text" name = "m_addr"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">�޴���ȭ :</li>
						<li class = "col2">
							<select name = m_phone1>
								<option>010</option>
								<option>011</option>
								<option>017</option>
							</select> -
							<input class = "hp" type = "text" name = "m_phone2"> - <input class = "hp" type = "text" name = "m_phone3">
						</li>
					</ul>
				</li>
				<li>
					<ul class = "cols3">
						<li><input type="submit" value="ȸ������">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="���" onclick="goFirstForm()"></li>
					</ul>
				</li>
			</ul>
		</form>
	</body>
</html>