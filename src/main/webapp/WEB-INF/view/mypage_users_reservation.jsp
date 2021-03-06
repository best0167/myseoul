<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <h1>방문신청 내역</h1>
    <hr>
    
	<table class="table">
		<tr>
			<th width="7%">이름</th>
			<th width="8%">집이름</th>
			<th width="15%">집주소</th>
			<th width="7%">방이름</th>
			<th width="12%">방문예약시간</th>
			<th width="7%">판매자이름</th>
			<th width="14%">판매자연락처</th>
		</tr>
		<c:forEach var="dto" items="${vList}">
		  <tr>
		    <td>${dto.v_uname}</td>
		    <td>${dto.v_hname}</td>
		    <td>${dto.v_hroadaddr}</td>
		    <td>${dto.v_rname}</td>
		    <td>${dto.v_date}</td>
		    <td>${dto.v_pname}</td>
		    <td>${dto.v_pphone}</td>
		  </tr>
		  <tr></tr>
		</c:forEach>
	</table>
</body>
</html>