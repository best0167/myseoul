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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnList').on('click',function(){
			$('#frm').attr('action','noticeGo.do');
			$('#frm').submit();
	});
	
	$('#btnSave').on('click',function(){
		$('[name=n_contents]').val(
				$('[name=n_contents]').val().replace(/\n/gi,'<br/>'));
					$('#frm').attr('action','write2.do').submit();
						
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
    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5><b><i class="fa fa-dashboard"></i>Notice Registration</b></h5>
    </header>
    <br>
    
    <form name="frm" id="frm" method="POST"  enctype="multipart/form-data">
		<div class="container">
			<table class="table table-hover" >
				<tr>
					<td width="20%" align="center">관리자ID</td>
					<td><input type="text" name="n_uid"  size="40" maxlength="40" value="${sessionScope.u_id}" readonly/></td>
				</tr>	
				
				<tr>
					<td width="20%" align="center"> 제목 </td>
					<td><input type="text" name="n_title" size="40" maxlength="40"/></td>
				</tr>
				
				<tr>
					<td width="20%" align="center" style="vertical-align: middle;">내용</td>
					<td>
						<textarea name="n_contents" rows="13" cols="80"> </textarea>
					</td>
				</tr>
			
				<tr>
					<td width="20%" align="center">파일</td>
					<td><input type="file" name="filename" id="filepath" /></td>
				</tr>
			</table>
		
			<input type="button" id="btnList" value="리스트"class="btn btn-info"/>
			<input type="button" id="btnSave" value="저장" class="btn btn-primary"/>
		</div>
	</form>	
<!-- <script src="bootstraptJS/bootstrap.js"></script> -->
</body>
</html>