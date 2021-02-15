<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="resources/css/mypage_users_update.css" rel="stylesheet" type="text/css">
</head>
<style>
	.btn-default{
   		background-color:#6F1E51;
   		color:white;
	}
	.btn-default:hover{
   		border:2px solid #6F1E51;
   		background-color:white;
   		color: #6F1E51;
   		font-weight:bold;
	}
</style>
<body>
    <h1>내 정보 수정</h1>
	<hr>
	<form id="upddel_frm" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input type="text" value="${dto.u_name}" id="u_name" name="u_name"></td>
			</tr>

		
			<tr>
				<th>아이디</th>
				<td>${dto.u_id}</td>
			</tr>
		
			<tr>
				<th>비밀번호</th>
				<td><input type="password" value="${dto.u_pw}" id="u_pw" name="u_pw"></td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" value="${dto.u_pw}" id="u_pw_chk" name="u_pw_chk">
					<span class="alert alert-success" id="alert-success"  >비밀번호가 일치합니다.</span>
					<span class="alert alert-danger" id="alert-danger" >비밀번호가 일치하지 않습니다.</span>
				</td>
			</tr>
		
			<tr>
				<th>성별</th>
				<td>
					<c:set var="u_gender" value="${dto.u_gender}" />
					<c:if test="${u_gender eq 'm' }">
						<label>
							<input type="radio" name="u_gender" value="m" id="u_gender" checked />남자
						</label>
						<label>
							<input type="radio" name="u_gender" value="w" id="u_gender">여자
						</label>
					</c:if>
					<c:if test="${u_gender eq 'w' }">
						<label>
							<input type="radio" name="u_gender" value="m" id="u_gender" />남자
						</label>
						<label>
							<input type="radio" name="u_gender" value="w" id="u_gender" checked />여자
						</label>
					</c:if>
				</td>
			</tr>
		
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="u_phone" id="u_phone" name="u_phone" value="${dto.u_phone}" onKeyup="inputTelNumber(this);" maxlength="13" >
				</td>
			</tr>
		
			<tr>
				<th>이메일</th>
				<td><input type="text" style="vertical-align: middle; margin-right:10px;" value="${dto.u_email}" id="u_email" name="u_email" readonly>
				<label><input type="radio" id="deleteBtn" name="valid" checked/> 변경안함</label>
				<label><input type="radio" id="clickBtn" name="valid"/>변경</label>				
				<input type="button" id="emailChk" class="btn btn-default btn-sm" value="중복확인" class="click" style="display:none;">
				<span class="alert email-success" id="email-success" >사용가능한 이메일입니다.</span>
				<span class="alert email-danger" id="email-danger" >이미 사용중인 이메일입니다.</span>
				</td>
			</tr>
		
			<tr>
				<th>생년월일</th>
				<td><input type="date" value="${dto.u_birth}" max="9999-12-31" id="u_birth" name="u_birth"></td>
			</tr>
		
			<tr>
				<th>국가</th>
				<td>
					<select name='u_nation' name="u_nation" id='u_nation' required >
						<c:set var="u_nation" value="${dto.u_nation}" />
						<c:if test="${u_nation eq 'Korea' }">		
							<option value='Korea' selected>Korea</option>
							<option value='North of America'>North of America</option>
							<option value='China'>China</option>
							<option value='Japan'>Japan</option>
							<option value='France'>France</option>
							<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'North of America' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America' selected>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'China' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China' selected>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'Japan' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan' selected>Japan</option>
					<option value='France'>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'France' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France' selected>France</option>
					<option value='Canada'>Canada</option>
			</c:if>
			<c:if test="${u_nation eq 'Canada' }">		
					<option value='Korea'>Korea</option>
					<option value='North of America'>North of America</option>
					<option value='China'>China</option>
					<option value='Japan'>Japan</option>
					<option value='France'>France</option>
					<option value='Canada' selected>Canada</option>
			</c:if>
			</select>
			</td>
		</tr>

		<tr>
			<th>가입일</th>
			<td>${dto.u_regdate}</td>
		</tr>
	 </table>
	 
	 <div class="button_area">
       <input type="submit" style="float:left" id="update" value="회원정보수정" class="btn btn-default" onclick="javascript: form.action='/myseoul/mypage_users_update.do';">
       <input type="submit" style="float:right" id="delete" value="회원탈퇴" class="btn btn-default" onclick="javascript: form.action='/myseoul/mypage_users_delete.do'">
    </div>
    </form>
   
    <script src="resources/js/mypage_users_update.js" type="text/javascript">
	</script>
</body>
</html>