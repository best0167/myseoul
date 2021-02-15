<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script type="text/javascript">
$(document).ready(function(e) {
	$('#u_email-check').hide();	
	var u_email = document.getElementById('u_email')		
	var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
		
	$('#findBtn').click(function() {
		if(!emailCheck.test($('#u_email').val())) {
			$('#u_email-check').show();
			$('#u_email').focus();
			return false;
		} else {
			var u_email = $('#u_email').val();
			
			$.ajax({
				url:'find_id.do?u_email='+u_email,
				type:'GET',
				dataType:'text',
				
				success:function(res){
					console.log(res);
					
					if(res != '') {
					$('#IdFind').append(res);
					alert("회원님의 아이디는 " + res + "입니다!");
					$('#u_email-check').hide();
					} else {
						alert('일치하는 아이디가 없습니다.');
					}
				},
 	   			error: function(){
	   				alert('일치하는 아이디가 없습니다.');
	   			} 
				
			});
		}
	})
});
</script>
<style>
#u_email-check{color: red;}

h1{
	margin-top:50px;
}
.find_whole{
	width:1000px;
	height:100%;
	margin-top:100px;
	margin:auto;
}
.find_wrap{
	height:100%;
}
.find_id_area{
	margin-top:50px;
	width:1000px;
	height:100%;
}
.email_area{
	width:1000px;
	height:60px;
}
.input_email{
	width:860px;
	height:60px;
	float:left;
}
.form-control{
	width:860px;
	height:40px;
	margin-top:10px;
	border:2px solid #6F1E51;
}
.id_btn{
	width:120px;
	height:60px;
	float:right;
}
.btn-default{
	width:120px;
	height:40px;
	margin-top:10px;
	background-color: #6F1E51;
	color:white;
	font-size:17px;
}
.btn-default:hover{
	background-color: white;
	border:2px solid #6F1E51;
	font-size: 17px;
	font-weight:bold;
	color: #6F1E51;
}
.alert-area{
	width:1000px;
	height:30px;
	margin-bottom:50px;
}
.btn_area{
	width:250px;
	height:50px;
	margin:auto;
}
.btn_01{
	float:left;
	width:140px;
}
.btn_02{
 	float:right;
 	width:90px;
}
.btn2{
	width:100%;
	background-color: #6F1E51;
	color:white;
	font-size:17px;
}
.btn2:hover{
	width:100%;
	background-color: white;
	border:2px solid #6F1E51;
	font-weight:bold;
	color: #6F1E51;
}
</style>
</head>
<body>
	<div class="find_whole">
		
		<h1>아이디 찾기</h1>
		<hr>
		<div class="find_wrap">
		
			<div class="find_id_area">
				<form action="find_id.do" method="get">
					<div class="email_area">
						<div class="input_email">
							<input class="form-control" type="text" id="u_email" name="u_email" placeholder="가입 했던 이메일을 입력하세요." autofocus>
						</div>
						<div class="id_btn">
							<input type="button" id="findBtn" class="btn btn-default" value="아이디 찾기">
						</div>
					</div>
				</form>
				
				<!-- ajax 처리영역 : id 표시 or 올바른 이메일 형식을 입력 해주세요 or 일치하는 회원 정보가 없습니다. -->	
				<div class="alert-area">
					<span class="alert u_email-check" id="u_email-check">올바른 이메일 형식을 입력해주세요.</span>
					<span id="IdFind"></span>
				</div>
			</div>			
			<hr>

			<div class="btn_area">
				<div class="btn_01">
					<button type="button" id="loginBtn" class="btn btn-default btn2" onclick="location.href='searchUserPw.do'">비밀번호 찾기</button>
				</div>
				<div class="btn_02">
					<button  type="button" id="loginBtn" class="btn btn-default btn2" onclick="location.href='login.do'">로그인</button>
				</div>
			</div>	
		
		</div>
	</div> <!-- find_whole -->
	

	
</body>
</html>