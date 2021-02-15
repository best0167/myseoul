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
<link rel="stylesheet" href="resources/css/mypage_seller_myHosting.css">
</head>
<body>
	<h1>내 호스팅 관리</h1>
	<hr>
	<table class="table">
		<tr>
			<th>No.</th>
			<th>등록명</th>
			<th>방 수</th>
			<th>등록기간</th>
			<th>등록일</th>
			<th>허가일</th>
			<th>관리</th>
		</tr>
		<c:choose>
			<c:when test="${empty hostingList}">
				<tr>
					<td colspan="7" style="text-align:center;">등록한 장소가 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="house" items="${hostingList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td  class='house_link' onClick='location.href="housedetail.do?h_num=${house.h_num}"'>
							<span class='house_type'>&#91;
								<c:choose>
									<c:when test="${house.h_type==1}">아파트</c:when>
									<c:when test="${house.h_type==2}">빌라</c:when>
									<c:when test="${house.h_type==3}">상가</c:when>
									<c:when test="${house.h_type==4}">오피스텔</c:when>
									<c:otherwise>단독주택</c:otherwise>
								</c:choose>&#93;
							</span>
							<span class='house_name'>${house.h_name}</span>
						</td>
						<td>${house.h_rooms}</td>
						<td>${house.h_startdate}~${house.h_enddate}</td>
						<td>${house.h_regdate}</td>
						<td>
							<c:if test="${house.h_permit=='y'}">${house.h_permitdate}	</c:if>
							<c:if test="${house.h_permit=='n'}">
								<span class='text_wating'>승인 대기중..</span>
							</c:if>
						</td>
						<td>
							<button class="management button1" onclick="location.href='upSellerHouse.do?h_num=${house.h_num}' ">수정</button>
							<button class="management button2" onclick="delHouseFunc(${house.h_num})">삭제</button>
						</td>
					</tr>
				</c:forEach>	
			</c:otherwise>
		</c:choose>
	</table>
	
<script type="text/javascript" src="resources/js/mypage_seller_myHosting.js"></script>
</body>
</html>