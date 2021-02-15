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
	<!-- ${buylist } -->
	<h1>결제내역</h1>
	<hr>
	<table class="table">
		<tr>
			<th style="width:50px;">No.</th>				
			<th>집주소</th>
			<th style="width:100px;">방이름</th>
			<th style="width:80px;">계약기간</th>
			<th style="width:80px;">결제금액</th>
			<!-- <th>사용포인트</th> -->
			<th style="width:80px;">환불신청</th>
			<th style="width:80px;">후기작성</th>
		</tr>
		
		<c:choose>
			<c:when test="${!empty buylist}">
				<c:forEach var="buylist" items="${buylist }" varStatus="index">
					<tr>
						<td>${index.count }</td>
						<!-- <td>#집이름</td> -->
						<td>${buylist.by_roadaddr },
							   ${buylist.by_detailaddr }</td>
						<td>${buylist.by_rname }</td>
						<td>
							<fmt:formatDate var="startdate" value="${buylist.by_startdate }" pattern="yyyy/MM/dd" />
							<fmt:formatDate var="enddate" value="${buylist.by_enddate }" pattern="yyyy/MM/dd" />
							${startdate }<br>~${enddate }
						</td>
						<td>${buylist.by_totalprice }원<br>(-${buylist.by_point } point)</td>
						<%-- <td>${buylist.by_point } point</td> --%>
						
						<c:choose>
							<c:when test="${buylist.by_refund == 'i' }">
								<td>승인대기중</td>
							</c:when>
							<c:otherwise>
								<td>
									<button  style="margin-left:10px;" type="button" class="btn btn-default btn-sm" onclick="location.href='applyRefund.do?by_num=${buylist.by_num }'">신청</button>
								</td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${buylist.by_refund == 'i' }">
								<td>
									<button style="margin-left:10px;" type="button" class="btn btn-danger btn-sm" onclick="location.href='reviewPage.do?by_num=${buylist.by_num }'" disabled>작성불가</button>	
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<button style="margin-left:10px;" type="button" class="btn btn-default btn-sm" onclick="location.href='reviewPage.do?by_num=${buylist.by_num }'">작성</button>	
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="8" style="text-align:center;">결제 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>