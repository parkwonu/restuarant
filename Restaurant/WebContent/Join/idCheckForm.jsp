<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	    <title>���̵� �ߺ� üũ</title>
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
			function pValue(){
	            document.getElementById("userId").value = opener.document.userInfo.m_id.value;
	        }
		</script>
	</head>
	
	<body onload="pValue()">
		<div id="wrap">
		    <br>
		    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
		    <hr size="1" width="460">
		    <br>
		    <div id="chk">
		        <form id="checkForm" action = "<%= request.getContextPath() %>/Join/idCheckAction.jsp" method="post">
		            <input type="text" name="m_id" id="userId">
		            <input type="submit" value="�ߺ�Ȯ��">
		        </form>
		        <div id="msg"></div>

		        <input id="cancelBtn" type="button" value="���" onclick="window.close()"><br>
		    </div>
		</div>    
	</body>
</html>