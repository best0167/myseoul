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
<script>
	$(document).ready(function(){
		
	});
</script>
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
		text-align:center;
	}
	table tr th{
		width:150px;	
	}
</style>
<body>
	<h1>장바구니</h1>
	<hr>
	<table class="table">
		<tr>
			<th style="width:20px;">No.</th>
			<th>사용자ID</th>
			<th>집이름</th>
			<th>집주소</th>
			<th>방이름</th>
			<th>계약기간</th>
			<th>호스트</th>
			<th>구매하기</th>
			<th>삭제</th>
		</tr>
		<c:choose>
			<c:when test="${!empty bagList }">
				<c:forEach var="bag" items="${bagList }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${bag.b_uid }</td>
						<td>${bag.b_hname}</td>
						<td>${bag.b_roadaddr } ${bag.b_detailaddr }</td>
						<td>${bag.b_name }</td>
						<td>	
							<fmt:formatDate value="${bag.b_startdate}" pattern="yyyy/MM/dd" />~
							<fmt:formatDate value="${bag.b_enddate}" pattern="yyyy/MM/dd" /></td>
						<td>${bag.b_pid }</td>
						
						<td>
							<c:choose>
								<c:when test="${today >= 10}">
									<c:choose>
										<c:when test="${bag.b_rtstate == 'n' }">
											<button type="button" class="btn btn-primary" disabled>마감</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-primary" onclick="location.href='buyPage.do?by_uid=${bag.b_uid}&by_rnum=${bag.b_rnum}'">결제</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									매달 10일에 오픈됩니다.
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:url var="path" value="deleteBag.do">
								<c:param name="b_num" value="${bag.b_num }"/>
							</c:url>
							<a href="${path }">
								<img alt="삭제" src="images/trash-simple.png" >
							</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="9" style="text-align:center;">장바구니에 등록된 상품이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>