<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<script>
	$(document).ready(function(){
		
		//첨부파일용량체크
		$('#filepath').on('change', function(){  //change 이벤트가 발생하면
			if(this.files && this.files[0]){   //파일이 하나밖에 없어도 배열 files[0]으로 가져옴
				if(this.files[0].size>1000000000){
					alert('1GB 바이트 이하만 첨부할 수 있습니다.');
					$('#filepath').val('');
					return false;
				}
			}
		});
	});
</script>
<style>
	 .wrap{
	 	margin-top: 60px;
	 }
	 .review_area{
	 	margin-top:30px;
	 	margin-bottom:30px;
	 	width:100%;
	 	height:400px;
	 }
	 table {
	 	margin-top:50px;
	 }
	 th {
	 	width:200px;
	 	background-color:#f0f0f0;
	 }
	 .submit_area{
	 	width:110px;
	 	height:40px;
	 	margin:30px auto;
	 }
</style>
<body>
	<!-- ${buyInfo}  -->
	<div class="wrap">
		<h1>리뷰 작성</h1>
		<hr>
		<div class="review_area">
			<form action="insReview.do" method="post" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>집이름</th>
						<td>${buyInfo.by_hname }</td>
					</tr>
					<tr>
						<th>방이름</th>
						<td>${buyInfo.by_rname }</td>
					</tr>
					<tr>
						<th>사용자 아이디</th>
						<td>${buyInfo.by_uid }</td>
					</tr>
					<tr>
						<th>작성내용</th>
						<td>
							<input type="text" class="form-control" placeholder="한줄 리뷰 작성" name="rv_contents">
						</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>
							<select class="form-control" style="width:80px;" name="rv_star">
								<option value="0" selected>선택</option>
		  						<option value="1">1</option>
		  						<option value="2">2</option>
	  							<option value="3">3</option>
	  							<option value="4">4</option>
	  							<option value="5">5</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="rv_filename" id="filePath">
						</td>
					</tr>
				</table>
				
				<input type="hidden" name="rv_uid" value="${buyInfo.by_uid }">
				<input type="hidden" name="rv_bynum" value="${buyInfo.by_num }">
				<input type="hidden" name="rv_hnum" value="${buyInfo.by_hnum }">
				<input type="hidden" name="rv_rnum" value="${buyInfo.by_rnum }">
				<div class="submit_area">
					<input type="submit" class="btn btn-primary btn-lg" value="리뷰 작성">
				</div>
			</form>

		</div> <!-- end review_area -->
	</div>  <!-- end wrap -->
</body>
</html>