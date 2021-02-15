<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
h1 {font-family: 'Nanum Brush Script', cursive;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#update').on('click', updateRun);
	$('#cancel').on('click', cancelRun);
	$("#back").on('click',backRun);
	$('[name=q_contents]').val($('[name=q_contents]').val().trim());
	$('[name=q_contents]').val(
			$('[name=q_contents]').val().replace(/<br\s?\/?>/g, "\n"));
	
});

function updateRun() {
	$('[name=q_contents]').val(
			$('[name=q_contents]').val().replace(/\n/gi, '<br/>'));

	$('#frm').attr('action', 'update.do').submit();
}

function cancelRun() {
	$('#q_title').val('${dto.q_title}');
	$('#q_contents').val('${dto.q_contents}');
	$('[name=q_contents]').val($('[name=q_contents]').val().trim());
	$('[name=q_contents]').val(
			$('[name=q_contents]').val().replace(/<br\s?\/?>/g, "\n"));
}

function backRun(){
	//history.back();
	history.go(-1);
}
</script>

</head>
<body>
    <h1>Q &#38; A</h1>
    <br>
    
    <form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<th width="20%">글쓴이</th>
				<td>${dto.q_uid}</td>
				<th width="20%">등록일</th>
				<td>${dto.q_regdate}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="q_title" id="q_title"
					value="${dto.q_title}" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3">
				<textarea name="q_contents"
						id="q_contents" rows="13" cols="40">
						${dto.q_contents}
				</textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" name="filename" /> <span>${fn:substringAfter(dto.q_image, "_") }</span>
				</td>
			</tr>
		</table>
		<input type="hidden" name="q_num" value="${dto.q_num}" /> 
		<input type="hidden" name="currentPage" value="${currentPage}" /> 
		<input type="hidden" name="searchKey" value="${searchKey}"/><!--이부분 고침  -->
		<input type="hidden" name="searchWord" value="${searchWord}"/><!--이부분 고침  -->
			<input type="button" id="update" value="수정" class="btn btn-info" /> 
			<input type="button" id="cancel" value="취소" class="btn btn-primary"/>
			<input type="button" id="back" value="뒤로" class="btn btn-info" />
			
	</form>






<!-- <script src="js/bootstrap.js"></script> -->

</body>
</html>