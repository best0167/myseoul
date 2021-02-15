<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/adminEnroll.css">
    
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> Sales Management</b></h5>
    </header>
    <br>
    <div class="w3-container">
        <h5><b>매출관리</b></h5>
    
    	<table class="table">
		<tr>
			<th width="3%">No.</th>
			<th width="12%">결제유형</th>				
			<th width="10%">판매자아이디</th>
			<th width="10%">구매자아이디</th>
			<th width="20%">계약기간</th>
			<th width="10%">결제금액</th>
			<th width="10%">사용포인트</th>
			<th width="10%">집등록번호</th>
			<th width="10%">방등록번호</th>
			<th width="10%">결제일</th>
		</tr>
		
		<c:choose>
			<c:when test="${!empty sellList}">
				<c:forEach var="dto" items="${sellList }" varStatus="index">
					<tr>
						<td>${index.count }</td>
						<td>       
							<c:choose>
						    	<c:when test="${dto.by_type == 1}">실시간계좌이체</c:when>
                            	<c:when test="${dto.by_type == 2}">무통장입금</c:when>
                            	<c:when test="${dto.by_type == 3}">신용카드</c:when>
                            <c:otherwise>Err!</c:otherwise>
                        	</c:choose>
                        </td>
                        
						<td>${dto.by_pid}</td>
						<td>${dto.by_uid }</td>
						<td>
							<fmt:formatDate var="startdate" value="${dto.by_startdate}" pattern="yyyy/MM/dd" />
							<fmt:formatDate var="enddate" value="${dto.by_enddate}" pattern="yyyy/MM/dd" />
							${startdate }~${enddate }
						</td>
						<td>${dto.by_totalprice}원</td>
						<td>${dto.by_point} point</td>
						<td>${dto.by_hnum}</td>
						<td>${dto.by_rnum }</td>
						<td><fmt:formatDate var="regdate" value="${dto.BY_REGDATE }" pattern="yyyy/MM/dd" />${regdate}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="8" style="text-align:center;">결제 내역이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr></tr>
		
	</table>
	</div>
	<br>
	
	<div>
		<form id="search">
			<label class="w3-margin-right"> &nbsp;&nbsp;&nbsp;기간별</label>
			<label id="label" class="w3-margin-left" style="display:none;"> &nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;날짜</label>
			<label id="label2" class="w3-margin-left" style="display:none;"> &nbsp;월 선택</label>
			<br>
			
			<select id="searchKey" name="searchKey">
				<option value="all" >전체 기간</option>
				<option value="day">일별 내역</option>
				<option value="month">월별 내역</option>
			</select>
			<select id="searchKey3" name="searchKey3" style="display:none;">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<input id="date" name="date" type="date" style="display:none;">
			
			<button id="searchBtn">검색</button>
			<a href="adminSale.do">전체 리스트</a>
		</form>
	</div>
	<br><br>
	    <div class="w3-center">
    	<div class="w3-bar">
	
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage > 1}">
			<a href="adminSale.do?currentPage=${pv.startPage-pv.blockPage}&searchKey=${pv.searchKey}&searchKey3=${pv.searchKey3}&searchWord=${pv.searchWord}&date=${pv.date}" class="w3-button">&laquo;</a>
		</c:if>
		<!-- 이전 출력 끝 -->
		
		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">	
		<span>
			<c:url var="currPage" value="adminSale.do">
				<c:param name="currentPage" value="${i}" />
 				<c:param name="searchKey" value="${pv.searchKey }" />		
 				<c:param name="searchKey3" value="${pv.searchKey3 }" />
 				<c:param name="searchWord" value="${pv.searchWord }" />
				<c:param name="date" value="${date}" /> 
			</c:url>
			<c:choose>
			<c:when test="${i==pv.currentPage}">
				<a href="${currPage}" class="w3-button w3-gray">
					<c:out value="${i}" />
				</a>
			</c:when>
			<c:otherwise>
				<a href="${currPage}" class="w3-button">
					<c:out value="${i}" />
				</a>
			</c:otherwise>
			</c:choose>
			</span>
		</c:forEach>
		<!-- 페이지 출력 끝 -->
		
		<!-- 다음 출력 시작 -->
		<c:if test="${pv.totalPage > pv.endPage}">
			<a href="adminSale.do?currentPage=${pv.startPage+pv.blockPage}&searchKey=${pv.searchKey}&searchKey3=${pv.searchKey3}&searchWord=${pv.searchWord}&date=${pv.date}" class="w3-button">&raquo;</a>
		</c:if>
		<!-- 다음 출력 끝 -->
		</div>
	</div>  
    
    <script type="text/javascript" src="resources/js/adminSale.js"></script>
    <script type="text/javascript">
	if('${! empty pv.searchKey}') {
		$.each($('select[name=searchKey] option'), function(index, element) {
			if($(element).val()=='${pv.searchKey}') {
				$(this).prop('selected', 'selected');
			}
		});
		
		$('input[name=searchWord]').val('${pv.searchWord}');
	}
	</script>
</body>
</html>