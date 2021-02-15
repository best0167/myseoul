<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="resources/css/enroll.css"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> -->
<script type="text/javascript">
 
 $(document).ready(function(){
	$('#back').on('click',backRun);

 });//end of function to javascript

 function backRun(){
		//history.back();
		history.go(-1);
	}
</script>
<style type="text/css">
	h1 {
		margin-left:10px;
	}
	p {
		margin-left:20px;
	}
	hr{
		border:1px solid black;
	}
	 .refund_area{
	 	margin-top : 50px;
	 }
	 .table {
	 	margin-top: 30px;
	 }
	 th{
	 	width:150px;
	 	background-color:#DED7E4;
	 }
	 .btn_area {
	 	width:240px;
	 	height:50px;	
	 	margin:20px auto;
	 }
	/* .wrap_enroll{width:800px;height:1250px;margin:auto;background-image:url('../../images/paperBack2.png');background-size:100% 100%;background-repeat: no-repeat;font-family: 'Jua', sans-serif;font-size:20px;} */
	.btn-default{
   background-color:#6F1E51;
   color:white;
}
.btn-default:hover{
   border:2px solid #6F1E51;
   background-color:white;
   color: #6F1E51;
   font-weight:bold;
</style>
</head>
<body>
	<!-- ${buy} -->

	<!-- 사용가능 자원 : user -->
	 <div class="wrap">
		
		<div class="refund_rule">
			<h1>환불규정</h1>
			<p>
				<ul>
					<li>입주 일주일 전까지 환불신청 가능합니다.</li>
					<li>판매자에 의해 환불 거부 될 수도 있습니다.</li>
				</ul>
			</p>
		</div>
		
		<div class="refund_area">
			<h1>환불신청</h1>
			<p style="margin-top:30px;">환불하려면 아래 양식을 작성하세요</p>
			<form name="frm_refund" action="insertRefund.do"  method="post">
				<table class="table">
		  			<tr>
						<th>집이름</th>
						<td>${buy.by_hname }</td>
					</tr>
					<tr>
						<th>집주소</th>
						<td>${buy.by_roadaddr } ${buy.by_detailaddr }</td>
					</tr>
					<tr>
						<th>방이름</th>
						<td>${buy.by_rname }</td>
					</tr>		
					<tr>
						<th>구매자id</th>
						<td>
							<input type="text" class="form-control" style="width:100px; height:30px;" name="rf_uid" value="${buy.by_uid}" readonly>
						</td>
					</tr>
			 		<tr>
						<th>환불타입</th>
						<td>
							<span style="margin-right:30px;">
								<input type="radio" name="rf_type" value="1">계좌이체
							</span>
							<span>
								<input type="radio" name="rf_type" value="2">포인트
							</span>
						</td>		
					</tr>
					<tr>
						<th>환불사유</th>
						<td>
							<input type="text" class="form-control" name="rf_contents" style="height:30px;"placeholder="환불사유를 입력하세요">
						</td>
					</tr>
					<tr>
						<th>환불가격</th>
						<td>
							<input type="text" name="rf_price" class="form-control" style="width:100px; height:30px;" value="${buy.by_totalprice}" readonly>
						</td>
					</tr>
					<tr>
						<th>환불포인트</th>
						<td>
							<input type="text"name="rf_point" class="form-control" style="width:100px; height:30px;" value="${buy.by_point}"  readonly>
						</td>
					</tr>			
				</table>
				
				<input type="hidden" name="rf_bynum" value="${buy.by_num}">
				<input type="hidden" name="rf_hnum" value="${buy.by_hnum}">
				<input type="hidden" name="rf_rnum" value="${buy.by_rnum}">
				<input type="hidden" name="rf_pid" value="${buy.by_pid}">
	
				<div class="btn_area">
					<input type="button" id="back" value="뒤로가기" class="btn btn-default btn-lg" style="	float:left;"/>
					<input type="submit" id="send" value="환불신청" class="btn btn-default btn-lg" style="float:right;"/>
				</div>
			</form>
		</div> <!-- end refund_area -->
		
	</div> <!-- end wrap  -->
</body>
</html>