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
	.button_area {
		margin:auto;
		margin-top:30px;
		width:300px;
	}
	button {
		margin-right:16px;
	}
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
</head>
<body>
	<h1>판매자 계정 전환</h1>
	<hr>
	
	<form class="form-inline" action="" method="post">
		<table class="table">
			<tr>
				<th>사업자등록번호</th>
				<td><input type="text" class="form-control" name="w_sellnum"  onKeyup="inputNumber(this);" maxlength="12" required></td>
			</tr>
			
			<tr>
				<th>사업자등록일</th>
				<td><input type="date" class="form-control" name="w_selldate" required></td>
			</tr>
			
			
			<tr>
				<th>법인명(단체명)</th>
				<td><input type="text" class="form-control" name="w_sellname" required></td>
			</tr>
			
			<tr>
				<th>대표자</th>
				<td><input type="text" class="form-control" name="w_leader" required></td>
			</tr>
		</table>
		<input type="text" name="w_uid" value="${sessionScope.u_id}" style="display: none;">
		<div class="button_area">
			<button type="submit" class="btn btn-default">신청하기</button>
		</div>
	</form>
<script src="resources/js/mypage_seller_apply.js" type="text/javascript"></script>
</body>
</html>