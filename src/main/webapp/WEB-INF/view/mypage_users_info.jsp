<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	h1 {
		margin-top:30px;
	}
	hr{
		border:1px solid black;
	}
	table {
		margin-top:30px;
		margin-bottom:20px;
	}
	table tr th{
		width:150px;	
	}
</style>
</head>
<body>
	<!-- 사용가능 자원 : user -->
	<h1>내 정보 조회</h1>
	<hr>
	<table class="table">
		<tr>
			<th>이름</th>
			<td>${user.u_name }</td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<c:choose>
					<c:when test="${user.u_grade==0 }">
						일반유저
					</c:when>
					<c:when test="${user.u_grade==1 }">
						호스트
					</c:when>
					<c:otherwise>
						관리자
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>${user.u_id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${user.u_pw }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<c:choose>
					<c:when test="${user.u_gender == 'm' }">
					남자
					</c:when>
					<c:when test="${user.u_gender == 'w' }">
					여자
					</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${user.u_phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${user.u_email }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${user.u_birth }</td>
		</tr>
		<tr>
			<th>국가</th>
			<td>${user.u_nation }</td>
		</tr>
		<tr>
			<th>적립포인트</th>
			<td>${user.u_point }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${user.u_regdate }</td>
		</tr>
	</table>
</body>
</html>