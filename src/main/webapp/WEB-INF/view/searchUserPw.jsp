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
<style type="text/css">
#u_id-check{color: red;}
#u_email-check{color: red;}
#u_phone-check{color: red;}	
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
.find_pw_area{
	margin-top:50px;
	width:1000px;
	height:100%;
}
.pw_area{
	width:1000px;
	height:100%;
}
.input_text{
	width:900px;
	margin:auto;
	height:60px;
	margin-bottom:20px;
}
.form-control{
	width:100%;
	height:40px;
	margin:auto;
	margin-top:10px;
	border:2px solid #6F1E51;
}
.pw_btn{
	width:120px;
	height:60px;
	margin:auto;
}
.btn-default{
	width:130px;
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
.input_text span{
	height:20px;
	font-weight:bold;
}
</style>

</head>
<body>
	<div class="find_whole">
		
		<h1>비밀번호 찾기</h1>
		<hr>
		<div class="find_wrap">
		
			<div class="find_pw_area">
				<form action="find_pw.do" method="get">
					<div class="pw_area">
						<div class="input_text">
							<input class="form-control" type="text" id="u_id" name="u_id" placeholder="아이디를 입력하세요." autofocus>
							<span class="u_id-check" id="u_id-check" >올바른 아이디를 입력해주세요.</span>
						</div>
						<div class="input_text">
							<input class="form-control" type="text" id="u_email" name="u_email" placeholder="이메일을 입력하세요.">
							<span class="u_email-check" id="u_email-check" >올바른 이메일 형식을 입력해주세요.</span>
						</div>
						<div class="input_text">
							<input class="form-control" onKeyup="inputTelNumber(this);" type="text" id="u_phone" name="u_phone" maxlength="13" placeholder="전화번호를 입력하세요.">
							<span class="u_phone-check" id="u_phone-check" >올바른 전화번호 형식을 입력해주세요.</span>
						</div>
					</div>
					<hr>
					<div class="pw_btn">
						<input type="submit" id="pwBtn" class="btn btn-default" value="비밀번호 찾기">
					</div>
				</form>
			</div>			
		</div> <!-- find_wrap -->
	</div> <!-- find_whole -->
	
	
<!-- <h1>아이디 / 비밀번호 찾기</h1>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<ul>
					<li>
					<a href="searchUser.do" id="find_id">아이디 찾기</a>
					</li>
					<li>
					<a href="searchUserPw.do" id="find_pw">비밀번호 찾기</a>
					</li>
				</ul>
			</div>
			<div>
				<h2>비밀번호 찾기</h2>
			</div>
			<form id="searchUserPw" method="post">
				<div>
					<p>
						<label>아이디를 입력하세요.</label>
						<input class="w3-input" type="text" id="u_id" name="u_id">
						<span class="alert u_id-check" id="u_id-check" >올바른 아이디를 입력해주세요.</span>
					</p>
					<p>
						<label>이메일을 입력하세요.</label>
						<input class="w3-input" type="text" id="u_email" name="u_email">
						<span class="alert u_email-check" id="u_email-check" >올바른 이메일 형식을 입력해주세요.</span>
					</p>
					<p>
						<label>전화번호를 입력하세요.</label>
						<input class="w3-input" onKeyup="inputTelNumber(this);" type="text" id="u_phone" name="u_phone" onKeyup="inputTelNumber(this);" maxlength="13" >
						<span class="alert u_phone-check" id="u_phone-check" >올바른 전화번호 형식을 입력해주세요.</span>
					</p>
					
					<p class="w3-center">
						<input type="submit" id="pwBtn" class="btn btn-primary" value="비밀번호 찾기"  onclick="javascript: form.action='find_pw.do';">
					</p>
				</div>
			</form>
				<br><br>
			<form method="get">
				<div class="button_area">
					<p>	
						<input type="submit" id="login" class="btn btn-primary" value="로그인창으로 돌아가기" onclick="javascript: form.action='login.do';">
					</p>
				</div>
			</form>
		</div>		 -->			

			
	</div>
	<script type="text/javascript">

	$(document).ready(function(e) {
		
		$('#u_id-check').hide();
		$('#u_email-check').hide();
		$('#u_phone-check').hide();
		
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var emailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
		var phoneCheck = RegExp(/^\d{2,3}-\d{3,4}-\d{4}$/);
		
		var u_id = document.getElementById('u_id');
		var u_email = document.getElementById('u_email');
		var u_phone = document.getElementById('u_phone').value;
		
		$('#pwBtn').click(function() {
			if(!getCheck.test($('#u_id').val())) {
				$('#u_id-check').show();
				$('#u_id').focus();
				
				return false;
			} else if(!emailCheck.test($('#u_email').val())) {
				$('#u_email-check').show();
				$('#u_email').focus();
				
				return false;
            } else if(!phoneCheck.test($('#u_phone').val())) {
            	$('#u_phone-check').show();
            	$('#u_phone').focus();
            	
            	return false;
			} else {
				var u_id= $('#u_id').val();
				var u_email = $('#u_email').val();
				var u_phone = $('#u_phone').val();
				
			
				$.ajax({
					url:'find_pw.do?u_id='+u_id+'&u_email='+u_email+'&u_phone='+u_phone,
					type:'GET',
					dataType:'text',
					
					success:function(res){
						console.log(res);
						
						if(res != '') {
						alert("회원님의 비밀번호는 " + res + "입니다!");
						location.href = "login.do";
						} else {
							alert("일치하는 비밀번호가 없습니다.");
							history.go(0);						
						}
					} 
					
				});
			}
		});
	});
		
	function inputTelNumber(obj) {

	   	var number = obj.value.replace(/[^0-9]/g, "");
	    var u_phone = "";

	    // 서울 지역번호(02)가 들어오는 경우
	      	    if(number.substring(0, 2).indexOf('02') == 0) {
	      	        if(number.length < 3) {
	      	            return number;
	      	        } else if(number.length < 6) {
	      	            u_phone += number.substr(0, 2);
	      	            u_phone += "-";
	      	            u_phone += number.substr(2);
	      	        } else if(number.length < 10) {
	      	            u_phone += number.substr(0, 2);
	      	            u_phone += "-";
	      	            u_phone += number.substr(2, 3);
	      	            u_phone += "-";
	      	            u_phone += number.substr(5);
	      	        } else {
	      	            u_phone += number.substr(0, 2);
	      	            u_phone += "-";
	      	            u_phone += number.substr(2, 4);
	      	            u_phone += "-";
	      	            u_phone += number.substr(6);
	      	        }
	      	    
	      	    // 서울 지역번호(02)가 아닌경우
	      	    } else {
	      	        if(number.length < 4) {
	      	            return number;
	      	        } else if(number.length < 7) {
	      	            u_phone += number.substr(0, 3);
	      	            u_phone += "-";
	      	            u_phone += number.substr(3);
	      	        } else if(number.length < 11) {
	      	            u_phone += number.substr(0, 3);
	      	            u_phone += "-";
	      	            u_phone += number.substr(3, 3);
	      	            u_phone += "-";
	      	            u_phone += number.substr(6);
	      	        } else {
	      	            u_phone += number.substr(0, 3);
	      	            u_phone += "-";
	      	            u_phone += number.substr(3, 4);
	      	            u_phone += "-";
	      	            u_phone += number.substr(7);
	      	        }
	      	    }
	      	    obj.value = u_phone;
	      };	

</script>

</body>
</html>