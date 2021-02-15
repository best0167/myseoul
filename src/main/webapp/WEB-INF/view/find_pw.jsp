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
				<h3>비밀번호 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					비밀번호 : ${ u_pw }
				</h5>
				<p class="w3-center">
					<button type="button" id=loginBtn class="btn btn-primary">로그인</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-primary">취소</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
