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
<link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style type="text/css">
h1 {font-family: 'Noto Sans KR', sans-serif;font-weight:bold;text-align:center}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#list').on('click',listRun);
	$('#replay').on('click',replayRun);
	$('#update').on('click',updateRun);
	$('#delete').on('click',deleteRun);
	
	var checkUser = '${sessionScope.u_id}';
    var checkAdmin = '${sessionScope.admin_name}';
    var checkWriter = '${dto.q_uid}';
    if(checkUser == '' || checkUser==null){
    	/* 비회원일때 */
    	$('#replay').css('display','none');
    	$('#update').css('display','none');
    	$('#delete').css('display','none');
    }else if(checkUser == checkWriter){
    	/* 본인글일때 */
    	$('#replay').css('display','none');
    }else if(checkAdmin == '' || checkAdmin == null){
    	/* 본인글이 아니고, 관리자도 아닐때 */
    	$('#replay').css('display','none');
    	$('#update').css('display','none');
    	$('#delete').css('display','none');
    	if(checkWriter=='admin1' || checkWriter=='admin2' || checkWriter=='admin3' || checkWriter=='admin4' || checkWriter=='admin5' || checkWriter=='admin6'){
    		/* 관리자의 답변글일경우 */
    		$('#replay').css('display','inline-block');
    	}
    }else{
    	/* 관리자일때 */
    	$('#update').css('display','none');
    	$('#delete').css('display','none');
    	$('.adminId').css('display','inline-block');
    }
});

	function listRun(){
		$('#frm').attr('action','qnaGo.do').submit();
	}
	function replayRun(){
		$('#frm').attr('action','write.do').submit();
	}

	function updateRun(){
		$('#frm').attr('action', 'update.do').submit();
	}
	function deleteRun(){
		$('#frm').attr('action','delete.do').submit();
	}
</script>


</head>
<body>
    <h1>질문과 답변</h1>
    <br>
    
	<div>
		<table class="table table-hover"> 
			<tr>
				<th width="20%">작성자ID</th>
				<td>
					<c:choose>
						<c:when test="${dto.q_uid == 'admin1' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:when test="${dto.q_uid == 'admin2' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:when test="${dto.q_uid == 'admin3' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:when test="${dto.q_uid == 'admin4' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:when test="${dto.q_uid == 'admin5' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:when test="${dto.q_uid == 'admin6' }">
							<span style="color:#ff7979;">관리자</span>
							<span class="adminId" style="display: none;">&#40;${dto.q_uid}&#41;</span>
						</c:when>
						<c:otherwise>${dto.q_uid}</c:otherwise>
					</c:choose>
				</td>
				<th width="20%">조회수</th>
				<td>${dto.q_readcnt}</td>
			</tr>
		
			<tr>
				<th>제목</th>
				<td colspan="3">${dto.q_title}</td>
			</tr>
		
			<tr>
				<th>내용</th>
				<td colspan="3">${dto.q_contents}</td>
			</tr>
		
		 	<tr>
				<th>파일</th>
				<td colspan="3">
					<c:if test="${!empty dto.q_image}">
						<a href="contentdownload.do?q_num=${dto.q_num}">${fn:substringAfter(dto.q_image,"_")}</a>
					</c:if>
					<c:if test ="${empty dto.q_image}">
						<c:out value="첨부파일 없음"/>
					</c:if>
				</td>
			</tr>
		</table>

		<form name="frm" id="frm" method="get">
			<input type="hidden" name="q_num" value="${dto.q_num}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${param.currentPage}"/>
			<input type="hidden" name="q_ref" value="${dto.q_ref}"/>
			<input type="hidden" name="q_restep" value="${dto.q_restep}"/>
			<input type="hidden" name="q_relevel" value="${dto.q_relevel}"/>
			<input type="hidden" name="searchKey" value="${param.searchKey}"/>
			<input type="hidden" name="searchWord" value="${param.searchWord}"/>
			<input type="button" id="list" value="리스트" class="btn btn-info"/>
			<input type="button" id="replay" value="답변" class="btn btn-primary"/>
			<input type="button" id="update" value="수정" class="btn btn-info"/> 
			<input type="button" id='delete' value="삭제"class="btn btn-primary"/>
		</form>
	</div>		
			

<!-- <script src="js/bootstrap.js"></script> -->
</body>
</html>