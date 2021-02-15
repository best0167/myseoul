<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: #007bff;;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}
.dropdown:hover .dropbtn {
  background-color: #95afc0;
  color:white;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  float: none;
  color: #4834d4;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
	
	<ul class="nav flex-column">
    	<li class="nav-item">
      		<a class="nav-link" href="mypage.do">개인정보 조회</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="userUpdate.do">개인정보 수정</a>
      	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="userReservation2.do">방문신청 내역</a>
    	</li>   	
    	<li class="nav-item">
      		<c:url var="pathBuyList" value="userBuylist.do">
				<c:param name="u_id" value="${sessionScope.u_id}"/>
			</c:url>
      		<a class="nav-link" href="${pathBuyList }">결제내역</a>
    	</li>
    	<li class="nav-item">
      		<c:url var="pathRefundList" value="userRefundlist.do">
				<c:param name="u_id" value="${sessionScope.u_id}"/>
			</c:url>
      		<a class="nav-link" href="${pathRefundList }">환불내역</a>
    	</li>
    	<li class="nav-item">
    		<c:url var="pathBag" value="userBag.do">
				<c:param name="u_id" value="${sessionScope.u_id}"/>
			</c:url>
      		<a class="nav-link" href="${pathBag }">장바구니</a>
    	</li>

		<c:if test="${sessionScope.u_grade == 1}">
			<li class="nav-item">
				<div class="dropdown">
					<button class="dropbtn" id="inner_menu">판매자 메뉴
						<i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="myHosting.do" style="text-decoration: none;">호스팅 관리</a>
						<a href="requestReservation.do" style="text-decoration: none;">방문 요청</a>
						
						<c:url var="pathRefundList" value="permitRefund.do">
							<c:param name="rf_pid" value="${sessionScope.u_id}"/>
						</c:url>
						<a href="${pathRefundList }" style="text-decoration: none;">환불 요청</a>
						
					</div>
				</div>
			</li>
		</c:if>
		<c:if test="${sessionScope.u_grade == 0}">
			<li class="nav-item">
				<a class="nav-link" href="sellerApply.do">판매자 신청</a>
			</li>
		</c:if>
	</ul>
  	
</body>
</html>