<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript">
	
	$(function(){
		$("#loginBtn").click(function(){
			location.href='login.do';
		})
	})
	
	
</script>
<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					아이디 : ${ u_id }
				</h5>
				
				<form action="login.do" method="get">
				<p class="w3-center">
					<input type="submit" id="loginBtn" class="btn btn-primary" onclick="javascript: form.action='/myseoul/login.do';"  value="로그인">
				
				</p>
				</form>

				<form action="searchUserPw.do" method="get">
				<p>
					<input type="submit" id="searchUserPw" class="btn btn-primary" onclick="javacript: form.action='/myseoul/searchUserPw.do';" value="비밀번호 찾기">
				</p>
				</form>
				</div>
			
		</div>
	</div>
</body>
</html>
