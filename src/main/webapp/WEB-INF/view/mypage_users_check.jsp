<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>

<body>
<h2>개인정보 수정</h2>
<section id="container">
<form id="updchk_frm" method="post" action="mypage_users_check.do">
	<div>
		<input type="hidden" name="u_id" id="u_id" value="${dto.u_id }">
		<label for="u_pw">비밀번호</label>
		<input type="password" name="u_pw" id="u_pw" autofocus />
	
	${param.errStr}
	</div>
		<input type="submit" id="submit" value="비밀번호 확인">
	</form>

</section>

<script type="text/javascript">    
    $(document).ready(function(e){
    	$("#submit").click(function() {
    		if($("#u_pw").val() == '') {
    			alert("비밀번호를 입력해주세요");
    			$("#u_pw").focus();
    			return false;
    		} else {
    			$("#updchk_frm").submit();	
    		}
    		
    	});
    });
</script>

</body>

</html>