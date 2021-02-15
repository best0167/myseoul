<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- <link href="resources/css/join.css" rel="stylesheet" type="text/css"> -->
<style>
.join_whole{
	width:1100px;
	height:100%;
	margin-top:30px;
	margin-left:auto;
	margin-right:auto;
}
table{
	vertical-align:middle;
	margin-top:50px;
	margin-bottom:300px;
}
th{
	width:200px;
	background-color: #F0F0F0;
	vertical-align:middle;
}
td{
	vertical-align:middle;
}
.form-control1{
	vertical-align:middle;
	width:300px;
	height:30px;
	padding-left:5px;
	margin-left:10px;
}
.form-control2{
	vertical-align:middle;
	width:150px;
	height:30px;
	margin-left:10px;
}
.btn-default{
	height:30px;
	margin-left:10px;
	color:white;
	font-weight:bold;
	background-color:#6F1E51;
	vertical-align:middle;
	padding:0px;
	width:80px;
	margin-top:1px;
}
.btn-default:hover, .btn-login:hover, .btn-back:hover{
	background-color:white;
	color:#6F1E51;
	border:2px solid #6F1E51; 
}
.btn_area{
	width:430px;
	height:50px;
	margin-top:300px;
	margin:auto;
}
.btn-login{
	float:left;
	height:50px;
	color:white;
	font-weight:bold;
	background-color:#6F1E51;
	vertical-align:middle;
	padding:0px;
	width:150px;
	margin-top:1px;
}
.btn-back{
	float:right;
	height:50px;
	color:white;
	font-weight:bold;
	background-color:#6F1E51;
	vertical-align:middle;
	padding:0px;
	width:250px;
	margin-top:1px;
}
#alert-success {color: green;}
#alert-danger{color: red;}
#id-success {color: green;}
#id-danger{color: red;}
#email-success {color: green;}
#email-danger{color: red;}
</style>    	
</head>
<body>
	<div class="join_whole">
		<h1 style="font-family:Arial; margin-bottom:30px;">회원가입</h1>
		<hr>
		<form id="join_afrm" method="post" action="joinGo.do" >
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" class="form-control1" id="u_id" name="u_id" placeholder="영문, 숫자 조합 4~12글자 " autofocus />
						<input type="button" id="idChk" class="btn btn-default" value="중복확인">
						<span class="alert id-success" id="id-success" >사용가능한 아이디입니다.</span>
						<span class="alert id-danger" id="id-danger" >이미 사용중인 아이디입니다.</span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>				
					<td>
						<input type="password" class="form-control1" name="u_pw" id="u_pw" placeholder="영문, 숫자 조합 4~12글자" >
					</td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td>
						<input type="password" class="form-control1" name="u_pw_chk" id="u_pw_chk" placeholder="비밀번호를 다시 입력하세요"> 
						<span class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</span>
						<span class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="u_name" class="form-control1" id="u_name" placeholder="이름을 입력하세요" required/>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" class="form-control1" name="u_phone" id="u_phone" onKeyup="inputTelNumber(this);" maxlength="13" >
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<span style="margin-right:20px;margin-left:10px;">
							<label><input type="radio" name="u_gender" value="m" checked>남자</label>
						</span>
						<label><input type="radio" name="u_gender" value="w">여자</label>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" id="u_email" class="form-control1" name="u_email" placeholder="id@naver.com" required />
						<input type="button" id="emailChk" class="btn btn-default" value="중복확인">
						<br>
						<span class="alert email-success" id="email-success" >사용가능한 이메일입니다.</span>
						<span class="alert email-danger" id="email-danger" >이미 사용중인 이메일입니다.</span>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" class="form-control2" name="u_birth" id="u_birth" max="9999-12-31" required />
					</td>
				</tr>
				<tr>
					<th>소속국가</th>
					<td>
						<select name="u_nation" class="form-control2" id="u_nation" required >		
							<option value=''>선택하세요</option>
							<option value="Korea">Korea</option>
							<option value="North of America">North of America</option>
							<option value="China">China</option>
							<option value="Japan">Japan</option>
							<option value="France">France</option>
							<option value="Canada">Canada</option>
						</select>
					</td>
				</tr>        
				<tr>
					<td></td>
					<td></td>
				</tr>         
 			</table>
 		
 			<hr style="margin-top:50px;">
 			<br>
 			<div class="btn_area">
 				<input id="signUp" type="submit" class="btn btn-login btn-lg" value="회원가입">
				<input type="button" id="cancel" class="btn btn-back btn-lg" value="로그인으로" onclick="location.href='login.do'">
			</div>
 		</form>
 	</div> <!-- end join_whole -->
 	<br><br>
 <script src="resources/js/join.js" type="text/javascript"></script> 
</body>
</html>