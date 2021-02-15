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
<style type="text/css">
h1 {font-family: 'Noto Sans KR', sans-serif;font-weight:bold;text-align:center}
</style>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnList').on('click',function(){
			$('#frm').attr('action','qnaGo.do');
			$('#frm').submit();
	});
	
	$('#btnSave').on('click',function(){
		$('[name=q_contents]').val(
				$('[name=q_contents]').val().replace(/\n/gi,'<br/>'));
					$('#frm').attr('action','write.do').submit();
						
	});////
	
	//첨부파일 용량을 체크 !@!@!@!@!~!~!~
	$('#filepath').on('change',function(){
		if(this.files[0]){
				if(this.files[0].size>1000000000){
					alert('1GB바이트 이하만 첨부할수 있습니다.');
					$('#filepath').val('');
					return false;
				}
		}
	});
	
});
</script>
</head>

<body>
    <h1>질문과 답변</h1>
    <br>
    
    <form name="frm" id="frm" method="POST"  enctype="multipart/form-data">
		<table class="table table-hover" >
			<tr>
				<td width="20%" align="center">ID</td>
				<td><input type="text" name="q_uid"  size="10" maxlength="10" value="${sessionScope.u_id}" readonly/></td>
			</tr>	
			
			<tr>
				<td width="20%" align="center"> 제목 </td>
				<td>
				    <c:if test="${dto.q_ref!=0}">답변</c:if>
					<input type="text" name="q_title" size="40" maxlength="40"/>
			</td>
			</tr>
			
			<tr>
				<td width="20%" align="center" style="vertical-align: middle;">내용</td>
				<td>
					<textarea name="q_contents" rows="13" cols="40"> </textarea>
				</td>
			</tr>
		
			<tr>
				<td width="20%" align="center">파일</td>
				<td><input type="file" name="filename" id="filepath" /></td>
			</tr>
		</table>
		
		<!-- 답변글일때 -->
		<c:if test="${dto.q_ref!=0}">
			<input type="hidden" name="q_num" id="q_num" value="${dto.q_num}"/>
			<input type="hidden" name="currentPage" id="currentPage" value="${pv.currentPage}"/>
			<input type="hidden" name="q_ref" value="${dto.q_ref}"/>
			<input type="hidden" name="q_restep" value="${dto.q_restep}"/>
			<input type="hidden" name="q_relevel" value="${dto.q_relevel}"/>
		</c:if>
		<input type="button" id="btnList" value="리스트" class="btn btn-info"/>
		<input type="button" id="btnSave" value="저장" class="btn btn-primary"/>
	</form>
<!-- <script src="bootstraptJS/bootstrap.js"></script> -->
</body>
</html>