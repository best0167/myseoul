<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script>
//유저의 point를 담기위한 변수 선언
var point = ${u_point};
//DB에 등록된 방 가격
var price = ${buy.by_price};
//최대사용가능 포인트
var limitPoint = price * 0.1;
//사용가능 포인트
var possiblePoint;
//buyList 테이블에 넣기위한 최종가격 = 방가격 - 포인트 + 보증금 을 담기 위한 변수
var totalprice;

if(limitPoint < point){
	possiblePoint = limitPoint;
} else {
	possiblePoint = point;
}


	$(document).ready(function(){
		$('#possiblePoint').attr('value', possiblePoint);
		
		//포인트사용할지 안할지 결정하기
		$('input:radio[name=usePoint]').click(function(){
			 
			if($("input[name=usePoint]:checked").val() == "use"){ //포인트 사용 체크시
				$('#possiblePoint').attr('value', possiblePoint);
				$('#by_point').attr('value', possiblePoint);
				totalprice = price - possiblePoint + price*5;
				$('#by_totalprice').attr('value', totalprice);
				$('#finalPay').html("최종 결제 금액 : "+totalprice	+"원");
				
			} else if ($("input[name=usePoint]:checked").val() == "notuse"){  //포인트 사용안함 체크시
				//point에 0포인트를 저장
				point = 0;
				$('#possiblePoint').attr('value', point);
				$('#by_point').attr('value', point);
				totalprice = price - point + price*5;
				$('#by_totalprice').attr('value', totalprice);
				$('#finalPay').html("최종 결제 금액 : "+totalprice	+"원");
	        } else {
	        	return false;
	        }
		});
		
		//결제수단 선택하기
		$('input:radio[name=by_type]').click(function(){
			 
			if($("input[name=by_type]:checked").val() == 1){
				//alert("실시간계좌이체");
				$('#by_type').attr('value', 1);
			} else if ($("input[name=by_type]:checked").val() == 2){
				//alert("무통장입금");
				$('#by_type').attr('value', 2);
	        } else if  ($("input[name=by_type]:checked").val() == 3){
	        	//alert("신용카드");
	        	$('#by_type').attr('value', 3);
	        } else {
	        	return false;
	        }
		});
		
		//input type="button" 클릭시
		$('#buyBtn').on('click', function(){
			//alert('im clicked');
			
			if($("input[name=usePoint]:checked").length < 1) {
				alert("포인트 사용여부를 클릭 하세요");
				return false;
			}else if ($("input[name=by_type]:checked").length < 1){
				alert("결제 수단을 선택하세요.");
				return false;
			}else{
				$('#buyFrm').attr('action', 'buyRoom.do').submit();	
			}
		});
		
	});
</script>
<style>
	body{
		margin : 0px;
        padding : 0px;
	}
	 .wrap{
         margin-top: 60px;
         margin-left:auto;
         margin-right:auto;
         width:100%;
         height:100%;
         /* background-color : tomato; */
    }
    .tb_area{
    	width:95%;
    	height:250px;
    	margin-top: 30px;
    	margin-left:auto;
        margin-right:auto;
    	/* background-color : maroon; */
    }
    .table {
    	margin-top:50px;
    }
    .buyType_area {
    	width:95%;
    	height:300px;
    	margin-top: 30px;
    	margin-left:auto;
        margin-right:auto;
    	/* background-color : maroon; */
    }
    .price_area{
    	width:95%;
    	height:100%;
    	margin-top: 30px;
    	margin-left:auto;
        margin-right:auto;
    	/* background-color : maroon; */
    }
    .typeList{
    	width:
    }
    .buyBtn_area {
    	width:90px;
    	height:40px;
    	margin : 20px auto;
    }
    .btn-default{
  		background-color:#6F1E51;
   		color:white;
	}
	.btn-default:hover{
   		border:2px solid #6F1E51;
   		background-color:white;
   		color: #6F1E51;
   		font-weight:bold;
	}
</style>
</head>
<body>
	
	<!-- buy, house, r_name, u_point : 사용가능함 -->
	<div class="wrap">
		<h1>결제페이지</h1>
		<hr>
		<div class="tb_area">
			<h2>1. 결제정보</h2>
			<hr>
			<table class="table">
				<tr style="background-color: #b99e9e;">
					<th style="width:200px;">No.</th>
					<th>결제자 아이디</th>
					<th>호스트 아이디</th>
					<th>결제할 집 이름</th>
					<th>결제할 방 이름</th>
					<th>집 주소</th>
					<th>계약 시작일</th>
					<th>계약 종료일</th>
				</tr>
				<tr>
					<td>1</td>
					<td>${buy.by_uid }</td>
					<td>${buy.by_pid }</td>
					<td>${house.h_name }</td>
					<td>${r_name }</td>
					<td>${house.h_roadaddr }, ${house.h_detailaddr }</td>
					<td>
						<fmt:formatDate var="by_startdate" value="${buy.by_startdate }" pattern="yyyy/MM/dd" />
						${by_startdate }
					</td>
					<td>
						<fmt:formatDate var="by_enddate" value="${buy.by_enddate }" pattern="yyyy/MM/dd" />
						${by_enddate }
					</td>
				</tr>
			</table>
		</div> <!-- end 결제정보 -->
		
		<div class="price_area">
			<h2>2. 결제 하기</h2>
			<hr>
			
			<table class="table">
				<tr>
					<th style="width:200px;">방 가격</th>
					<td>${buy.by_price }원</td>
				</tr>
				<tr>
					<th style="width:200px;">보증금</th>
					<td>${buy.by_price *5 }원</td>
				</tr>
				<tr>
					<th>총 보유포인트</th>
					<td>${u_point } point</td>
				</tr>
				<tr>
					<th>사용 가능한 포인트</th>
					<td>
						<span style="margin-right:40px;">
							<input style="width:90px;" type="text" value="" id="possiblePoint" readonly> point 
						</span>
						<span style="margin-right:40px;">
							<input type="radio" name="usePoint" value="use">포인트사용하기
						</span>
						<span>
							<input type="radio" name="usePoint" value="notuse">포인트사용안함
						</span>
					</td>
				</tr>	
				<tr>
					<th style="border-bottom:1px solid black;">결제수단선택</th>
					<td style="border-bottom:1px solid black;">
						<span style="margin-right:40px;">
							<input type="radio" name="by_type" value="1">실시간계좌이체
						</span>
						<span style="margin-right:40px;">
							<input type="radio" name="by_type" value="2">무통장입금
						</span>
						<span style="margin-right:40px;">
							<input type="radio" name="by_type" value="3">신용카드
						</span>
					</td>
				</tr>
				<tr>
					<th>최종 결제 금액</th>
					<td id="finalPay"></td>
					<!-- <td>#최종결제금액 = (방가격 - 포인트) + 보증금	</td> -->
					<!-- <td style="text-align:right">#최종결제금액 = (방가격 - 포인트) + 보증금	</td> -->
				</tr>
			</table>
			
			<!-- 결제하기 클릭시 controller로 전송될 form -->
			<form name="buyFrm" id="buyFrm" method="post">
			<div class="buyBtn_area">
				<input id="buyBtn" type="button" class="btn btn-default btn-lg" value="결제하기">
			</div>
			
				<input type="hidden" id="by_type" name="by_type" value="" >
				<input type="hidden" name="by_uid" value="${buy.by_uid }">
				<input type="hidden" name="by_pid" value="${buy.by_pid }">
				<input type="hidden" name="by_rnum" value="${buy.by_rnum }">
				<input type="hidden" name="by_hnum" value="${buy.by_hnum }">
				<%-- <fmt:formatDate var="by_startdate" value="${buy.by_startdate }" pattern="yyyy/MM/dd" /> --%>
				<input type="hidden" name="by_startdate" value="${by_startdate }">
				<%-- <input type="text" name="by_startdate" value="${buy.by_startdate }"> --%>
				<%-- <fmt:formatDate var="by_enddate" value="${buy.by_enddate }" pattern="yyyy/MM/dd" /> --%>
				<input type="hidden" name="by_enddate" value="${by_enddate }">
				<%-- <input type="text" name="by_enddate" value="${buy.by_enddate }"> --%>
				<input type="hidden" name="by_price" value="${buy.by_price }">
				<input type="hidden" id="by_point" name="by_point" value="">
				<!-- <input type="hidden" name="by_refund" value=""> default n -->
				<!-- 계산된 총 금액 -->
				<input type="hidden" id="by_totalprice" name="by_totalprice" value="">				
			</form>
			<!-- end form -->
		</div>
		
		</div>
		
		

</body>
</html>