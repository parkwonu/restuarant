<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>joinForm</title>
		<link rel = "stylesheet" type = "text/css" href = "<%= request.getContextPath() %>/css/join.css">
		<script type="text/javascript">
			// 회원가입 화면의 입력값들을 검사한다.
			function checkValue() {
				var form = document.userInfo;
				if(!form.m_id.value){
					alert("아이디를 입력하세요.");
					return false;
				}
				if(form.m_idDuplication.value != "idCheck"){
        			alert("아이디 중복체크를 해주세요.");
        			return false;
    			}
			    if(!form.m_pw.value){
			        alert("비밀번호를 입력하세요.");
			        return false;
			    }
				// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			    if(form.m_pw.value != form.m_pw1.value ){
			        alert("비밀번호를 동일하게 입력하세요.");
			        return false;
			    }    
			    if(!form.m_name.value){
			        alert("이름을 입력하세요.");
			        return false;
			    }
			    if(!form.m_email1.value && form.m_email2.value){
			        alert("메일 주소를 입력하세요.");
			        return false;
			    }
			    if(!form.m_phone1.value && !form.m_phone2.value && !form.m_phone3.value){
			        alert("전화번호를 입력하세요.");
			        return false;
			    }
			    if(!form.m_addr.value){
			        alert("주소를 입력하세요.");
			        return false;
			    }
			}
			// 취소 버튼 클릭시 첫화면으로 이동
			function goFirstForm() {
			    location.href="joinForm.jsp";
			}    
			// 아이디 중복체크 화면open
			function openIdChk(){
			    window.name = "parentForm";
			    window.open("<%= request.getContextPath() %>/Join/idCheckForm.jsp","chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
			}
			// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
			// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
			// 다시 중복체크를 하도록 한다.
			function inputIdChk(){
				document.userInfo.idDuplication.value ="idUncheck";
			}
		</script>
	</head>
	
	<body>
		<form name="userInfo" onsubmit="return checkValue()" action = "<%= request.getContextPath() %>/Join/joinAction.jsp" method = "post">
			<h1>가입 양식</h1>
			<ul id = "mem_form">
				<li>
					<ul class = "cols">
						<li class = "col1">아이디 :</li>
						<li class = "col2"><input type = "text" name = "m_id" onkeydown="inputIdChk()">&nbsp;&nbsp;<input type="button" value="중복확인" onclick="openIdChk()"></li>
						<li><input type="hidden" name="m_idDuplication" value="idUncheck"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">비밀번호 :</li>
						<li class = "col2"><input type = "password" name = "m_pw"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">비밀번호 확인 :</li>
						<li class = "col2"><input type = "password" name = "m_pw1"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">이름 :</li>
						<li class = "col2"><input type = "text" name = "m_name"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">권한 :</li>
						<li class = "col2"><input type = "radio" name = "m_level" checked="checked" value="개인사업자">  개인사업자&nbsp;&nbsp;<input type = "radio" name = "m_level" value="일반회원"> 일반회원 </li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">이메일 :</li>
						<li class = "col2"><input type = "text" name = "m_email1"> @
							<select name = "m_email2">
								<option>선택</option>
								<option>naver.com</option>
								<option>hanmail.net</option>
								<option>gmail.com</option>
							</select>
						</li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">주소 :</li>
						<li class = "col2"><input type = "text" name = "m_addr"></li>
					</ul>
				</li>
				<li>
					<ul class = "cols">
						<li class = "col1">휴대전화 :</li>
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
						<li><input type="submit" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취소" onclick="goFirstForm()"></li>
					</ul>
				</li>
			</ul>
		</form>
	</body>
</html>