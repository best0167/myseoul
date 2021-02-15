<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
     <!-- <link rel="stylesheet" href="bootstrapCSS/bootstrap.css"> -->
     
	<link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <style type="text/css">
    .pagelist a{ text-decoration: none;color: black;font-size: 25px;}
    .pagelist a:hover, .pagelist .pagecolor{color: red;}
    p.a{font-family: 'Trade Winds', cursive;}
    h1 {font-family: 'Noto Sans KR', sans-serif;font-weight:bold;text-align:center}
    </style>
</head>
<body>
    <h1>공지사항</h1>
    <br>
    <div class="w3-container">
        <div id="boardwrap">
			<table class="table table-striped">
				<tr>
					<th width="5%">NO.</th>
					<th width="35%">제목</th>
					<th  width="20%">작성자</th>
					<th width="10%">조회수</th>
					<th width="20%">날짜</th>
					<th width="7%" align="center">파일</th>
				</tr>
				
				<c:forEach items="${aList}" var="dto" varStatus="state">
					<tr>
						<td align="center">${state.count}</td>
						<td>
							<c:url var="path" value="view2.do">
								<c:param name="n_num" value="${dto.n_num}"/>
								<c:param name="currentPage" value="${pv.currentPage}"/>
								<c:param name="searchKey" value="${pv.searchKey}"/>
								<c:param name="searchWord" value="${pv.searchWord}"/>
							</c:url>
							<a href="${path}">${dto.n_title}</a>
						</td>
						<td >관리자</td>
						<td align="center">${dto.n_readcnt}</td>
						<td>${dto.n_regdate}</td>
						<c:choose>
							<c:when test="${dto.n_file!=null}">
								<td align="center"><img src="images/save.gif"></td>
							</c:when>
							<c:otherwise>
								<td align="center"> </td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6" align='center'><p class="a">Don't WORRY BE HAPPY</p></td>
				</tr> 
			</table> 
	
		 	<div class="pagelist" align="center">
				<br/>
				<!-- 이전 출력 시작-->
		 		<c:if test="${pv.startPage>1 }">
					<a href="list2.do?currentPage=${pv.startPage-pv.blockPage}">◁</a>				
				</c:if> 
				<!--  이전 출력 끝 -->
				
				<!-- 페이지 출력 시작 -->
       			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">   
         			<span>
            			<c:url var="currPage" value="noticeGo.do">
               				<c:param name="currentPage" value="${i}"/>
               				<c:param name="searchKey" value="${pv.searchKey}"/>
               				<c:param name="searchWord" value="${pv.searchWord}"/>
            			</c:url>
            			<c:choose>
               				<c:when test="${i==pv.currentPage}">
                  				<a href="${currPage}" class="pagecolor">
                  				<c:out value="${i}"/></a>
               				</c:when>
               				<c:otherwise>
                  				<a href="${currPage}"><c:out value="${i}"/></a>
               				</c:otherwise>
            			</c:choose>
            		</span>
      			</c:forEach> 
   				<!-- 페이지 출력 끝 -->
	
				<!-- 다음 출력 시작 -->
	 			<c:if test="${pv.endPage<pv.totalPage}">
					<a href="list2.do?currentPage=${pv.startPage+pv.blockPage}&searchKey=${pv.searchKey}&searchWord=${pv.searchWord}">▶</a>	
				</c:if> 
				<!-- 다음 출력 끝 -->
	 		</div>
		</div>
	</div>

    <!-- <script src="bootstrapJS/bootstrap.js"></script> -->
</body>
</html>