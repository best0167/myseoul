<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/adminEnrollTotal.css">
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> House Management</b></h5>
    </header>
    <br>
    <div class="w3-container">
        <div id="btn_group">
        	<button id="btn_total" style="background-color:#535c68;color:white;">전체목록</button>
        	<button id="btn_wating" onclick="location.href='adminEnroll.do'">대기목록</button>
        </div>
        
        <div style="border-radius: 10px;border:1px dotted lightgray;margin-top:10px;margin-bottom:5px;padding:10px;;display:inline-block;">
        	<details>
        		<summary style="color:#535c68">Filter</summary>
        		<div>
        			<form id="search">
				    	<h6>&nbsp;&nbsp;유형 &nbsp;&nbsp;&nbsp;&nbsp;
				    		<select name='h_type' name="h_type" id='h_type'>	
									<option value='6'>전체</option>
									<option value='1'>아파트</option>
									<option value='2'>빌라</option>
									<option value='3'>상가</option>
									<option value='4'>오피스텔</option>
									<option value='5'>단독주택</option>
							</select>   
				    	&nbsp;&nbsp;&nbsp;&nbsp;
				    	<label><input type="radio" name="h_gender" id="h_gender" value="a" checked>성별무관</label>&nbsp;&nbsp;
						<label><input type="radio" name="h_gender" id="h_gender" value="m">남성전용</label>&nbsp;&nbsp;
						<label><input type="radio" name="h_gender" id="h_gender" value="w">여성전용</label>&nbsp;&nbsp;
						</h6>
						<h6>&nbsp;&nbsp;지역구
						&nbsp;
						<label><input type="checkbox" name="h_region" id="h_region" value="all" onclick="doOpenCheck(this);" checked>전체</label>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<span style="color:gray;"><small>&#40;ㄱ~ㄴ&#41;</small></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" name="h_region" id="h_region" value="강남구" onclick="doOpenCheck(this);">강남구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="강동구" onclick="doOpenCheck(this);">강동구 </label>
						<label><input type="checkbox" name="h_region" id="h_region" value="강북구 " onclick="doOpenCheck(this);">강북구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="강서구 " onclick="doOpenCheck(this);">강서구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="관악구" onclick="doOpenCheck(this);">관악구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="광진구" onclick="doOpenCheck(this);">광진구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="구로구" onclick="doOpenCheck(this);">구로구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="금천구" onclick="doOpenCheck(this);">금천구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="노원구" onclick="doOpenCheck(this);">노원구</label>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;
						
						
						<span style="color:gray;"><small>&#40;ㄷ~ㅅ&#41;</small></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" name="h_region" id="h_region" value="도봉구" onclick="doOpenCheck(this);">도봉구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="동대문구" onclick="doOpenCheck(this);">동대문구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="동작구" onclick="doOpenCheck(this);">동작구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="마포구" onclick="doOpenCheck(this);">마포구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="서대문구" onclick="doOpenCheck(this);">서대문구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="서초구" onclick="doOpenCheck(this);">서초구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="성동구" onclick="doOpenCheck(this);">성동구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="성북구" onclick="doOpenCheck(this);">성북구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="송파구" onclick="doOpenCheck(this);">송파구</label>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;
						
						
						<span style="color:gray;"><small>&#40;ㅇ~ㅎ&#41;</small></span>&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="checkbox" name="h_region" id="h_region" value="양천구" onclick="doOpenCheck(this);">양천구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="영등포구" onclick="doOpenCheck(this);" >영등포구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="용산구" onclick="doOpenCheck(this);">용산구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="은평구" onclick="doOpenCheck(this);">은평구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="종로구" onclick="doOpenCheck(this);">종로구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="중구" onclick="doOpenCheck(this);">중구</label>
						<label><input type="checkbox" name="h_region" id="h_region" value="중랑구" onclick="doOpenCheck(this);">중랑구</label>
						</h6>
						&nbsp;&nbsp;등록명  &nbsp;<input type="hidden" name="searchKey" value="h_name">
						<input type="text" name="searchWord">&nbsp;&nbsp;&nbsp;<input type="button" value="검색" id="searchBtn" >
					</form>
        		</div>
        	</details>
	</div>
	
	<br>
	
        <form name="frm_permit" id="frm_permit" method="get">
        <table>
            <tr>
                <th width="5%">No.</th>
 				<th width="10%">집등록명</th>
                <th width="10%">판매자아이디</th>
                <th width="8%">유형</th>                
                
                <th width="5%">지역구</th>
                <th width="5%">방 수</th>
                <th width="5%">성별</th>
                <th width="10%">시작일</th>
                <th width="10%">마감일</th>
                <th width="10%">허가일</th>
                <th width="10%">관리</th>                
            </tr>
            <c:forEach var="pdto" items="${permitList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${pdto.h_name}</td>
                    <td>${pdto.h_uid}</td>
                    <td>
                        <c:choose>
                            <c:when test="${pdto.h_type == 1}">아파트</c:when>
                            <c:when test="${pdto.h_type == 2}">빌라</c:when>
                            <c:when test="${pdto.h_type == 3}">상가</c:when>
                            <c:when test="${pdto.h_type == 4}">오피스텔</c:when>
                            <c:when test="${pdto.h_type == 5}">단독주택</c:when>
                            <c:otherwise>Err!</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${pdto.h_region}</td>
                    <td>${pdto.h_rooms}</td>
                    <td>
						<c:choose>
							<c:when test="${pdto.h_gender eq 'm'}">남자</c:when>
							<c:when test="${pdto.h_gender eq 'w'}">여자</c:when>
						</c:choose>
					</td>
                    <td>${pdto.h_startdate}</td>
                    <td>${pdto.h_enddate}</td>
                    <td>${pdto.h_permitdate}</td>
                    <td>
                    <input type="hidden" value="${pdto.h_num}" id="h_num">
              		<input type="button" value="내리기" id="cancelPermitEnroll" name="cancelPermitEnroll" class="btn-btn primary btn_result" onclick="location.href='enroll_cancelConfirm.do?h_num=${pdto.h_num}' ">	
                    <input type="button" value="&nbsp;삭제  &nbsp;" id="delete" name="delete" class="btn-btn primary btn_result" onclick="location.href='enroll_deleteConfirm.do?h_num=${pdto.h_num}' ">
                    <%-- <a href="enroll_cancelConfirm.do?h_num=${pdto.h_num}">허가 취소</a>
                    <a href="enroll_deleteConfirm.do?h_num=${pdto.h_num}">삭제</a> --%>
                    </td>				
                	</tr>
            </c:forEach>
			<tr></tr>
        </table>
        </form>
    </div>
    
    <div class="w3-center">
    	<div class="w3-bar">
	
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage > 1}">
			<a href="adminPermitEnroll.do?currentPage=${pv.startPage-pv.blockPage}&&h_type=${pv.h_type}&&h_gender=${pv.h_gender}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}&&h_region=%${pv.h_region}" class="w3-button">&laquo;</a>
		</c:if>
		<!-- 이전 출력 끝 -->
		
		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">	
		<span>
			<c:url var="currPage" value="adminPermitEnroll.do">
				<c:param name="currentPage" value="${i}" />
				<c:param name="h_gender" value="${pv.h_gender}" />
				<c:param name="h_type" value="${pv.h_type}" />
				<c:param name="h_region" value="${pv.h_region}" />
				<c:param name="searchKey" value="${pv.searchKey }" />				
				<c:param name="searchWord" value="${pv.searchWord}" />
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
			<a href="adminPermitEnroll.do?currentPage=${pv.startPage+pv.blockPage}&&h_type=${pv.h_type}&&h_gender=${pv.h_gender}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}&&h_region=%${pv.h_region}" class="w3-button">&raquo;</a>
		</c:if>
		<!-- 다음 출력 끝 -->
		</div>
	</div>  
    
    <script type="text/javascript" src="resources/js/adminPermitEnroll.js"></script>
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