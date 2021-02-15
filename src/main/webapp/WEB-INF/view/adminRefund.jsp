<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/adminUserTotal.css">
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> Refund Management</b></h5>
    </header>
    <br>
    <form id="search">
 	 <select name="searchKey">
   	 <option value="all">회원전체</option>
  	  <option value="rf_uid">신청자</option>
  	  <option value="rf_pid">판매자</option>
 	 </select>
 	 <input type="text" name="searchWord"/>
 	 <input type="button" value="검색" id="searchBtn"/>
	</form>
    <div class="w3-responsive">
        <table>
          <tr>
            <th width="7%">회원 아이디</th>
            <th width="7%">판매자 아이디</th>
            <th width="15%">환불 사유</th>
            <th width="5%">환불 금액</th>
            <th width="5%">환불 포인트</th>
            <th width="10%">환불 신청일</th>
            <th width="10%">환불 완료일</th>
            <th width="7%">환불 유형</th>
          </tr>
         <c:forEach items="${rList}" var="dto">
          <tr>
            <td>${dto.rf_uid}</td>
            <td>${dto.rf_pid}</td>
            <td>${dto.rf_contents}</td>
            <td>${dto.rf_price}</td>
            <td>${dto.rf_point}</td>
            <td>
            	<fmt:formatDate value="${dto.rf_regdate}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
            	<fmt:formatDate value="${dto.rf_cdate}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
              <c:choose>
                <c:when test="${dto.rf_type==1}">계좌이체</c:when>
                <c:when test="${dto.rf_type==2}">포인트</c:when>
              </c:choose>
            </td>
          </tr>
          <tr></tr>
         </c:forEach>
        </table>
    </div>
    
	<div class="w3-center">
		<div class="w3-bar">
			<!-- 이전 페이지 그룹 출력 시작 -->
			<c:if test="${pv.startPage>1}">
				<a
					href="adminRefund2.do?currentPage=${pv.startPage-pv.blockPage}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}"
					class="w3-button">&laquo;</a>
			</c:if>
			<!-- 종료 -->

			<!-- 페이지 출력 시작 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<span> <c:url var="currPage" value="adminRefund2.do">
						<c:param name="currentPage" value="${i}" />
						<c:param name="searchKey" value="${pv.searchKey}" />
						<c:param name="searchWord" value="${pv.searchWord}" />
					</c:url> <c:choose>
						<c:when test="${i==pv.currentPage}">
							<a href="${currPage}" class="w3-button w3-gray"> <c:out
									value="${i}" />
							</a>
						</c:when>
						<c:otherwise>
							<a href="${currPage}" class="w3-button"> <c:out value="${i}" />
							</a>
						</c:otherwise>
					</c:choose>
				</span>
			</c:forEach>
			<!-- 페이지 출력 종료 -->

			<!-- 다음 페이지 그룹 출력 시작 -->
			<c:if test="${pv.endPage<pv.totalPage}">
				<a
					href="adminRefund2.do?currentPage=${pv.startPage+pv.blockPage}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}"
					class="w3-button">&raquo;</a>
			</c:if>
			<!-- 종료 -->
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	/* $('#searchBtn').on('click',function(){}); */
		$('#searchBtn').click(function(){
			$('#search').attr('action','adminRefund2.do');
			$('#search').submit();
	});
	
	/* 검색창에 검색한 내용 보이게하기 */
	if('${! empty pv.searchKey}'){
		$.each($('select[name=searchKey] option'),function(index,element){
			if($(element).val()=='${pv.searchKey}'){
				$(this).prop('selected','selected');
			}
		});
		$('input[name=searchWord]').val('${pv.searchWord}');
	}
});
</script>
</html>