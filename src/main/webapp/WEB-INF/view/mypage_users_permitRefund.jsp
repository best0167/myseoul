<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
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
<body>
	<!-- ${refundList} -->
	<h1>환불요청</h1>
	<hr>
	<table class="table">
		<tr>
			<th>no.</th>
			<th>집이름</th>
			<th>방이름</th>
			<th>집주소</th>
			<th>구매자아이디</th>
			<th>환불사유</th>
			<th>승인여부</th>
		</tr>
		<c:choose>
			<c:when test="${!empty refundList }">
				<c:forEach var="refund" items="${refundList}" varStatus="index">
					<tr>
						<td>${index.count }</td>
						<td>${refund.rf_hname }</td>
						<td>${refund.rf_rname }</td>
						<td>${refund.rf_roadaddr } ${refund.rf_detailaddr }</td>
						<td>${refund.rf_uid }</td>
						<td>${refund.rf_contents }</td>
						<c:choose>
							<c:when test="${refund.rf_prog =='y' }">
								<td>환불 승인</td>
							</c:when>
							<c:when test="${refund.rf_prog =='r' }">
								<td>환불 거부</td>
							</c:when>
							<c:otherwise>
								<td>
									<button type="button" class="btn btn-success btn-sm" onclick="location.href='sellerRefund.do?rf_num=${refund.rf_num }'">승인</button>
									<button type="button" class="btn btn-danger btn-sm" onclick="location.href='rejectRefund.do?rf_num=${refund.rf_num }'">거부</button>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="8" style="text-align:center;">환불 신청 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>