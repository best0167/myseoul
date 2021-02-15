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
    <link rel="stylesheet" href="resources/css/adminUserTotal.css">
</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i> USER Management</b></h5>
    </header>
    <br>
	<div class="w3-container">
		<div id="btn_group">
			<button id="btn_total"
				style="background-color: #535c68; color: white;">전체목록</button>
			<button id="btn_wating" onclick="location.href='adminUser.do'">대기목록</button>
		</div>
		
		<div style="border-radius: 10px;border:1px dotted lightgray;margin-top:10px;margin-bottom:5px;padding:10px;;display:inline-block;">
			<details>
				<summary style="color:#535c68">Filter</summary>
				<div>
					<form id="search">
						<input type="radio" name="u_grade" id="u_grade" value="9" checked>전체유저
						<input type="radio" name="u_grade" id="u_grade" value="0">일반유저
						<input type="radio" name="u_grade" id="u_grade" value="1">판매유저
						<br> <select name="searchKey">
							<option value="u_nation">국가</option>
							<option value="u_id">아이디</option>
						</select>
						<input type="text" name="searchWord"> <input type="button" value="검색" id="searchBtn">
					</form>
				</div>
			</details>
		</div>
		
		<br>
		
		<table>
			<tr>
				<th width="5%">아이디</th>
				<th width="7%">등급</th>
				<th width="7%">비밀번호</th>
				<th width="5%">성별</th>
				<th width="15%">연락처</th>
				<th width="5%">이메일</th>
				<th width="10%">생년월일</th>
				<th width="7%">국적</th>
				<th width="5%">point</th>
				<th width="8%">이름</th>
				<th width="15%">가입일</th>
				<th width="10%">관리</th>
			</tr>
			<c:forEach items="${usersList}" var="dto">
				<tr>
					<td>${dto.u_id}</td>
					<td><c:choose>
							<c:when test="${dto.u_grade eq 0}">일반유저</c:when>
							<c:when test="${dto.u_grade eq 1}">판매유저</c:when>
						</c:choose></td>
					<td>${dto.u_pw}</td>
					<td><c:choose>
							<c:when test="${dto.u_gender eq 'm'}">남자</c:when>
							<c:when test="${dto.u_gender eq 'w'}">여자</c:when>
						</c:choose></td>
					<td>${dto.u_phone}</td>
					<td>${dto.u_email}</td>
					<td>${dto.u_birth}</td>
					<td>${dto.u_nation}</td>
					<td>${dto.u_point}</td>
					<td>${dto.u_name}</td>
					<td>${dto.u_regdate}</td>
					<td>
					<%-- <a href="adminUserUpdate.do?u_id=${dto.u_id}" class="btn_result" style="text-decoration:none;">수정</a> --%>
						<button class="btn_result" onclick="location.href='adminUserUpdate.do?u_id=${dto.u_id}' ">수정</button>
						<button class="btn_result" onclick="location.href='deleteConfirm.do?u_id=${dto.u_id}' ">삭제</button>
					<%-- <a href="deleteConfirm.do?u_id=${dto.u_id}" class="btn_result" style="text-decoration:none;">삭제</a></td> --%>
				</tr>
				<tr>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="w3-center">
		<div class="w3-bar">
			<!-- 이전 페이지 그룹 출력 시작 -->
			<c:if test="${pv.startPage>1}">
				<a
					href="adminUserTotal.do?u_grade=${pv.u_grade}&&currentPage=${pv.startPage-pv.blockPage}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}"
					class="w3-button">&laquo;</a>
			</c:if>
			<!-- 종료 -->

			<!-- 페이지 출력 시작 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<span> <c:url var="currPage" value="adminUserTotal.do">
						<c:param name="currentPage" value="${i}" />
						<c:param name="searchKey" value="${pv.searchKey}" />
						<c:param name="searchWord" value="${pv.searchWord}" />
						<c:param name="u_grade" value="${pv.u_grade}"></c:param>
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
					href="adminUserTotal.do?u_grade=${pv.u_grade}&&currentPage=${pv.startPage+pv.blockPage}&&searchKey=${pv.searchKey}&&searchWord=${pv.searchWord}"
					class="w3-button">&raquo;</a>
			</c:if>
			<!-- 종료 -->
		</div>
	</div>
	<script type="text/javascript" src="resources/js/adminUserTotal.js"></script>
    <script type="text/javascript">
     if('${! empty pv.searchKey}'){
    	$.each($('select[name=searchKey] option'),function(index,element){
    		if($(element).val()=='${pv.searchKey}'){
    			$(this).prop('selected','selected');
    		}
    	});
    	$('input[name=searchWord]').val('${pv.searchWord}');
    }
    </script>
</body>
</html>