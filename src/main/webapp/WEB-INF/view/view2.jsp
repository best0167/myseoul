<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="bootstrapCSS/bootstrap.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	$('#list').on('click',listRun);
	$('#replay').on('click',replayRun);
	$('#update').on('click',updateRun);
	$('#delete').on('click',deleteRun);
});

	function listRun(){
		$('#frm').attr('action','noticeGo.do').submit();
	}
	function replayRun(){
		$('#frm').attr('action','write2.do').submit();
	}

	function updateRun(){
		$('#frm').attr('action', 'update2.do').submit();
	}
	function deleteRun(){
		$('#frm').attr('action','delete2.do').submit();
	}
	
	
</script>


</head>
<body>
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i>Notice View</b></h5>
    </header>
    <br>
    
	<div>
		<table class="table table-hover"> 
			<tr>
				<th width="20%">작성자ID</th>
				<td>${dto.n_uid}</td>
				<th width="20%">조회수</th>
				<td>${dto.n_readcnt}</td>
			</tr>
		
			<tr>
				<th>제목</th>
				<td colspan="3">${dto.n_title}</td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td colspan="3">${dto.n_contents}</td>
			</tr>
		
		 	<tr>
				<th>파일</th>
				<td colspan="3">
					<c:if test="${!empty dto.n_file}">
						<a href="contentdownload2.do?n_num=${dto.n_num}">${fn:substringAfter(dto.n_file,"_")}</a>
					</c:if>
					<c:if test ="${empty dto.n_file}">
						<c:out value="첨부파일 없음"/>
					</c:if>
				</td>
			</tr>
		</table>

		<form name="frm" id="frm" method="get">
			<input type="hidden" name="n_num" value="${dto.n_num}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${param.currentPage}"/>
			<input type="hidden" name="searchKey" value="${param.searchKey}"/>
			<input type="hidden" name="searchWord" value="${param.searchWord}"/>
			<input type="button" id="list" value="리스트" class="btn btn-info"/>
			<input type="button" id="update" value="수정" class="btn btn-primary" /> 
			<input type="button" id='delete' value="삭제" class="btn btn-info"/>
		</form>
	</div>		
			

<!-- <script src="js/bootstrap.js"></script> -->
</body>
</html>