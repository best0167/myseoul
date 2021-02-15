<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
	<!-- ${refundList } -->
	<h1>환불내역</h1>
	<hr>
	<table class="table">
		<tr>
			<th style="width:50px;">No.</th>				
			<th>집주소</th>
			<th style="width:100px;">방이름</th>
			<th style="width:80px;">계약기간</th>
			<th style="width:80px;">결제금액</th>
			<!-- <th>사용포인트</th> -->
			<th style="width:80px;">환불결과</th>
			<th style="width:80px;">환불처리일</th>
		</tr>
		
		<c:choose>
			<c:when test="${!empty refundList}">
				<c:forEach var="refund" items="${refundList }" varStatus="index">
					<tr>
						<td>${index.count }</td>
						<td>${refund.rf_roadaddr },
							   ${refund.rf_detailaddr }</td>
						<td>${refund.rf_rname }</td>
						<td>
							<fmt:formatDate value="${refund.rf_bystartdate }" pattern="yyyy/MM/dd"/>
							 ~<fmt:formatDate value="${refund.rf_byenddate }" pattern="yyyy/MM/dd"/>
						</td>
						<td>${refund.rf_price }원<br>(-${refund.rf_point } point)</td>
						
						<c:choose>
							<c:when test="${refund.rf_prog == 'y' }">
								<td>환불완료</td>
							</c:when>
							<c:when test="${refund.rf_prog == 'r' }">
								<td>환불불가</td>
							</c:when>
							<c:otherwise>
								<td>승인대기중</td>
							</c:otherwise>
						</c:choose>
						
						<td><fmt:formatDate value="${refund.rf_cdate}" pattern="yyyy/MM/dd" /></td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<tr>
					<td colspan="7" style="text-align:center;">환불 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>