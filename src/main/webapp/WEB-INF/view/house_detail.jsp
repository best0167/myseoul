<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606bf9816c682ce36d532684fd87093&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606bf9816c682ce36d532684fd87093"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/geoPop.css">
<script>
var u_id = '${sessionScope.u_id}';
var star_1 = ${star_1};  //1점 개수
var star_2 = ${star_2};  //2점 개수
var star_3 = ${star_3};  //3점 개수
var star_4 = ${star_4};  //4점 개수
var star_5 = ${star_5};  //5점 개수
var total = star_1 + star_2 + star_3 + star_4 + star_5;  //총 리뷰수

var per_1;
var per_2;
var per_3;
var per_4;
var per_5;
//실제비율(소수점 1자리까지) -> 막대바에 표시할거임.
if(total != 0 ){
	per_1 = (star_1/total * 100).toFixed(1);
	per_2 = (star_2/total * 100).toFixed(1);
	per_3 = (star_3/total * 100).toFixed(1);
	per_4 = (star_4/total * 100).toFixed(1);
	per_5 = (star_5/total * 100).toFixed(1);
} else {
	per_1 = '0.0%';
	per_2 = '0.0%';
	per_3 = '0.0%';
	per_4 = '0.0%';
	per_5 = '0.0%';
}

var result_1;
var result_2;
var result_3;
var result_4;
var result_5;
//.bar-x에 css로 집어넣을 막대 비율(정수)
if(total != 0){
	result_1 = Math.floor(star_1/total * 100) +'%';
	result_2 = Math.floor(star_2/total * 100) +'%';
	result_3 = Math.floor(star_3/total * 100) +'%';
	result_4 = Math.floor(star_4/total * 100) +'%';
	result_5 = Math.floor(star_5/total * 100) +'%';
} else{
	result_1 = '0%';
	result_2 = '0%';
	result_3 = '0%';
	result_4 = '0%';
	result_5 = '0%';
}
	$(document).ready(function() {
		$(".housepics").on("click",imgclick);
		
		$('.bar-1').css('width', result_1);
		$('.bar-1').html(per_1+'%');
		
		$('.bar-2').css('width', result_2);
		$('.bar-2').html(per_2+'%');
		
		$('.bar-3').css('width', result_3);
		$('.bar-3').html(per_3+'%');
		
		$('.bar-4').css('width', result_4);
		$('.bar-4').html(per_4+'%');
		
		$('.bar-5').css('width', result_5);
		$('.bar-5').html(per_5+'%');
		
		var win = $(window);
	    var $tab_btn = $('.tab-btn');
	    var one = $('#one');
	    var two = $('#two');
	    var three = $('#three');
	    var four = $('#four');
	    var first = $('.house-info').offset().top-150;
	    var second = $('.room-info').offset().top-150;
	    var third = $('.house-map').offset().top-150;
	    var forth = $('.house-review').offset().top-150;
	    var $contents = $('.house-info-area > div');
	    var houseInfo = $('.house-info');
	    var roomInfo = $('.room-info');
	    var houseMap = $('.house-map');
	    var houseReview = $('.house-review');
	    var navbar = $('.navbar');
	    
	    win.scroll(function(){
	         if(win.scrollTop() >= 936){
	            navbar.addClass('sticky');
	            houseInfo.css("margin-top", "160px");
	         } else {
	            navbar.removeClass('sticky');
	            houseInfo.css("margin-top", "20px");
	         }
	         
	         if(win.scrollTop() < second){
	            one.addClass('active');
	            two.removeClass('active');
	            three.removeClass('active');
	            four.removeClass('active');
	         } else if (win.scrollTop() < third) {
	            one.removeClass('active');
	            two.addClass('active');
	            three.removeClass('active');
	            four.removeClass('active');
	         } else if (win.scrollTop() < forth) {
	            one.removeClass('active');
	            two.removeClass('active');
	            three.addClass('active');
	            four.removeClass('active');
	         } else {
	            one.removeClass('active');
	            two.removeClass('active');
	            three.removeClass('active');
	            four.addClass('active');
	         }
	      });
	    
	    $tab_btn.click(function(x){
	         x.preventDefault();
	         $(this).addClass('active').siblings().removeClass('active');      
	         var idx = $(this).index()+1;       
	         var section = $contents.eq(idx);          
	         var sectionDistance = section.offset().top-150;
	         $('html, body').stop().animate({scrollTop:sectionDistance});          
		}); 
	});

	//"담기" 클릭 시 실행되는 함수
	function inputBagFunction(num){
		//alert(num);
		if(u_id==null || u_id=="") {
			alert("로그인 후 사용하세요.");
			return false;
		}
		
	}//end inputBagFunction();
	
	function imgclick(){
		var bb = $(this).attr("src");
		$('#pic1').attr('src',bb);
	};	
	//방문신청 클릭시 실행
	function visitPopup(rnum){
		window.open("visitReservation.do?r_num="+rnum+"&&r_hnum=${house.h_num}&&r_pid=${house.h_uid}","방문신청","width=500, height=650, left=100, top=50");
	}


</script>
<style>
body {
	margin: 0px;
	padding: 0px;
}
/* .header {
            width:100%;
            height:50px;
            background-color : #f0f0f0;
            position:fixed;
            top:0px;
        } */
.wrap {
/* 	margin-top: 60px; */
}

.houseimage {
	width: 1110px;
	height: 800px;
	background-color: #f0f0f0;
	margin: 10px auto;
	position:relative;
}

.house-info-area {
	width: 1100px;
	height: 100%;
	/* background-color : #f0f0f0; */
	margin: 0px auto;
	margin-bottom: 0px;
}
/* .menu-bar{
        	width:1100px;
        	margin:10px auto;
            margin-bottom : 0px;
        } */
.house-info {
	width: 1100px;
	height: 100%;
	margin-top: 50px;
}
.house-info th {
	height: 20px;
	text-align: left;
	vertical-align: middle;
	background-color: #ded7e4;
}
.house-info td {
	height: 20px;
	text-align: center;
	vertical-align: middle;
}
#table-house-info th{
	width:15%;
}

#table-house-info tr td:nth-child(2){
width:45%;
}

#table-house-info tr td:nth-child(4){
width:25%;
}

#table-house-blueprint th{
text-align: center;
}

#table-house-blueprint td{
height:200px;
}

/* 
************************************************************************공사중
 */


.room-info {
	width: 1100px;
	height: 100%;
	/* background-color: #b99e9e; */
	margin-top: 100px;
}

.room-info table {
	text-align: center;
}

.room-info thead {
	height: 20px;
	background-color: #ded7e4;
}

td div {
	width: 90px;
	margin: auto;
}

.house-map {
	width: 1100px;
	height: 100%;
	margin-top: 100px;
}

.map {
	width: 100%;
	height: 494px;
	background-color: #f0f0f0;
	margin-top: 20px;
}

.footer {
	width: 100%;
	height: 150px;
	background-color: #f0f0f0;
	margin-top: 50px;
}

.container {
	margin-top: 10px;
}

#preview {
	z-index: 9999;
	position: absolute;
	border: 0px solid #ccc;
	background: #333;
	padding: 1px;
	display: none;
	color: #fff;
}

/* 리뷰영역 css설정 */
.house-review {
	margin-left: 20px;
	margin-top: 100px;
}

#star_info {
	font-family: Arial;
	max-width: 1100px; /* Max width */
	padding: 20px;
}

.heading {
	font-size: 25px;
	margin-right: 25px;
}

.fa {
	font-size: 25px;
}

.fa-star {
	color: lightgray;
}

.checked {
	color: orange;
}

/* Three column layout */
.side {
	float: left;
	width: 15%;
	margin-top: 10px;
}

.middle {
	margin-top: 10px;
	float: left;
	width: 70%;
}

/* Place text to the right */
.right {
	text-align: right;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* The bar container */
.bar-container {
	width: 100%;
	background-color: #f1f1f1;
	text-align: center;
	color: white;
}

/* Individual bars */
.bar-5 {
	width: 60%;
	height: 18px;
	background-color: #4CAF50;
}

.bar-4 {
	width: 30%;
	height: 18px;
	background-color: #2196F3;
}

.bar-3 {
	width: 10%;
	height: 18px;
	background-color: #00bcd4;
}

.bar-2 {
	width: 4%;
	height: 18px;
	background-color: #ff9800;
}

.bar-1 {
	width: 15%;
	height: 18px;
	background-color: #f44336;
}

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media ( max-width : 400px) {
	.side, .middle {
		width: 100%;
	}
	.right {
		display: none;
	}
}

/* modal */
.review_img {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.review_img:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 11; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
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
.navbar{
   width:1100px;
   z-index:9;
   background-color:white;
   
}
.navbar.sticky{
   position:fixed;
   top:45px;
}
.col ul li {
   border:1px solid lightgrey;
}
.col ul li a{
   color:lightgrey;
   background-color:white;
   width:257px; 
   text-align:center;
}
.col ul li.active{
   font-weight:bold;
   color:#6F1E51;
   border:2px solid #6F1E51;
}
.col ul li.active a{
   color:#6F1E51;
   background-color:white;
   width:257px; 
   text-align:center;
}
</style>
</head>
<body>
	<!-- 사용가능한 자원 -->
	<!-- house, roomList -->
	<div class="wrap">	
    <h1 style="color:#192a56">${house.h_name}</h1>	
    
		<!-- 집 사진 영역 -->
        <div class="houseimage">
        	<div class="houseimage">
				<img alt="없음" src="${pic1}"id="pic1" height="700px" width="1100px" >
				<div>
					<c:forEach items="${hpdto}" var="pdto">
						<img class="housepics" alt="없음" src="${pdto.hp_dir}" height="100px" width="100px" onclick="imgclick()"/>
					</c:forEach>
				</div>
			</div>
        </div>
        
        <!-- 집 설명 영역 -->
		<div class="house-info-area">
			
			<!-- 메뉴바 -->
			<div class="navbar">
            	<div class="col">
               		<ul class="nav nav-tabs">
                		<li id="one" class="tab-btn active">
                    		<a class="nav-link" href="#house-info">집정보</a>
                  		</li>
                  		<li id="two" class="tab-btn">
                     		<a class="nav-link" href="#room-info">방정보</a>
                  		</li>
                  		<li id="three" class="tab-btn">
                     		<a class="nav-link" href="#house-map">지도</a>
                  		</li>
                  		<li id="four" class="tab-btn">
                     		<a class="nav-link" href="#house-review">리뷰</a>
                  		</li>
               		</ul>
            	</div>
         	</div>
			
			<!-- 집정보 -->
            <div id="house-info" class="house-info">
            	<h1>집 정보</h1>
                <hr>
                
                <div id="house-info-inner" style="position: relative; height: 100%; overflow: hidden; width: 100%; ">
                	<div id="house-info-inner-left" style="width:60%;position:relative;">
	                	<table class="table table-bordered" id="table-house-info" style="text-align:center;">
		                	<tr>
		      					<th scope="col">집 이름</th>
		      					<td>${house.h_name}</td>
		      					<th scope="col">조회수</th>
		      					<td>${house.h_readcnt}</td>
		    				</tr>
		    				<tr>
		      					<th scope="col">주소</th>
		      					<td>${house.h_roadaddr}<br>${house.h_detailaddr}</td>
		      					<th scope="col">수용성별</th>
		      					<td>
		      					    <c:choose>
		      					        <c:when test="${house.h_gender == 'm'}">
		      					            남성전용
		      					        </c:when>
		      					        <c:when test="${house.h_gender == 'w'}">
		      					            여성전용
		      					        </c:when>
		      					        <c:otherwise>
		      					            <del>잘못된입력값!</del>
		      					        </c:otherwise>
		      					    </c:choose>
		      					    </td>
		    				</tr>
		    				<tr>
		      					<th scope="col">방개수</th>
		      					<td>${house.h_rooms}</td>
		      					<th scope="col">욕실 수</th>
		      					<td>${house.h_bath}</td>
		    				</tr>
		    				<tr>
		      					<th scope="col">수용인원</th>
		      					<td>${house.h_limit}</td>
		      					<th scope="col">최저가</th>
		      					<td>${house.h_price}</td>
		    				</tr>
		    				<tr>
		      					<th scope="col">별점</th>
		      					<td>${house.h_stars}</td>
		      					<th scope="col">평수</th>
		      					<td>${house.h_area}m<sup>2</sup></td>
		    				</tr>	
						</table>
					</div>
					<div id="house-info-inner-right" style="position:absolute;height:100%;top:0;right:0%;width:39%">
						<table class="table table-bordered" id="table-house-blueprint">
							<tr>
								<th>설계도면</th>
							</tr>
							<tr>
								<td background="images/design001.gif" style="background-repeat: no-repeat;background-position:15px;background-size:400px 200px;"></td>
							</tr>
						</table>
					</div>
                </div>
                
                <br>
				
				<table class="table table-bordered" id="table-house-detail" style="text-align:center;">
					<tr>
						<th scope="col" style="text-align: center;">집 세부설명</th>
					</tr>
					<tr>
						<td style="text-align: left;padding-left: 30px;">${house.h_contents }</td>
					</tr>
				</table>
			</div> <!-- end house info -->
   
			<!-- 방정보 -->
			<div id="room-info" class="room-info">
				<h1>방 정보</h1>
				<hr>
				<table class="table">
                	<thead>
                		<tr>
      						<th scope="col">방 이름</th>
      						<th scope="col">면적</th>
      						<th scope="col">화장실</th>
      						<th scope="col">보증금</th>
      						<th scope="col">가격(월)</th>
      						<th scope="col">예약가능일</th>
      						<th scope="col">방문신청하기</th>
      						<th scope="col">
								<img alt="no" src="images/cart-simple.png">
							</th>
							<th scope="col">결제하기</th>
    					</tr>
    				</thead>
    				<tbody>
    					<c:forEach var="rooms" items="${roomList }" varStatus="index">
    						<tr>
								<td>${rooms.r_name }</td>
								<td>${rooms.r_area}m<sup>2</sup></td>
								<td>
								    <c:choose>
								        <c:when test="${rooms.r_bath == 'y'}">有</c:when>
								        <c:when test="${rooms.r_bath == 'n'}">無</c:when>
								        <c:otherwise>잘못된값</c:otherwise>
								    </c:choose>
								</td>
    							<td>${rooms.r_price*5}원</td>
    							<td>${rooms.r_price}원</td>
    							<td>
    								<c:choose>
    									<c:when test="${rooms.r_tstate == 'n'}">
   	    									예약마감
    									</c:when>
	  									<c:otherwise>
    										예약가능
    									</c:otherwise>
									</c:choose>
								</td>
								<td rowspan="2" style="vertical-align: middle;">
									<button type="button" class="btn btn-default" value="visitPopup" onclick="visitPopup(${rooms.r_num});">신청</button>
								<td rowspan="2" style="vertical-align: middle;">
									<c:if test="${!empty sessionScope.u_id}">
										<c:url var="path" value="insertBag.do">
											<c:param name="b_uid" value="${sessionScope.u_id}"/>
											<c:param name="b_hnum" value="${rooms.r_hnum }"/>
											<c:param name="b_rnum" value="${rooms.r_num }"/>
										</c:url>
									</c:if>
									
									<c:if test="${today >=1 }">
										<c:choose>
											<c:when test="${rooms.r_tstate == 'y' }">
												<a href="${path }" class="btn btn-default" id="inputBag${index.count }" onclick="inputBagFunction(${index.count })">담기</a>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-default" disabled>담기</button>
											</c:otherwise>
										</c:choose>
									</c:if>
								</td>
								
								<td rowspan="2" style="vertical-align: middle;">
									<c:choose>
										<c:when test="${today >= 10}">
											<c:choose>
												<c:when test="${rooms.r_tstate == 'n' }">
													<button type="button" class="btn btn-default" disabled>결제완료</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-default" onclick="checkBuy(${rooms.r_num })">결제</button>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											매달 10일에 오픈됩니다.
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>사진</th>
								<td colspan="5" style="text-align:left;overflow: auto;">
									<c:forEach var="dir" items="${rooms.roomPicDirs}" varStatus="sts">
										<img class="thumbnail review_img" src="${dir}" width="30px" height="30px" style="border: 1px solid black;"/>
										<!-- 
										<img src="images/dummy.jpg" width="30px" height="30px" />
										<img src="images/dummy.jpg" width="30px" height="30px" />
										<img src="images/dummy.jpg" width="30px" height="30px" />
										 -->
									</c:forEach>
								</td>
							</tr>
    					</c:forEach>
    				</tbody>
    			</table>
			</div> <!-- end room info -->
				
			<div class="house-map" id="house-map">
				<h1>편의시설</h1>
				<hr>
				<div class="paramCheck">
    				<form id="frm_param" name="frm_param">
        				<input type="hidden" id="param_bnb" name="param_bnb" value="${house.h_name}">
        				<input type="hidden" id="param_addr" name="param_addr" value="${house.h_roadaddr}">
        				<input type="hidden" id="param_detailAddr" name="param_detailAddr" value="${house.h_detailaddr}">
    				</form>
				</div>
				<div class="map" style="border:1px solid black;">
				    <!-- 지도를 표시할 div 입니다 -->
				    <div class="map_wrap">
    					<div id="map" style="width:100%;height:490px;position:relative;overflow:hidden;"></div>
    					<ul id="category">
        					<li id="BK9" data-order="0"> 
            					<span class="category_bg bank"></span>은행
            				</li>       
        					
        					<li id="MT1" data-order="1"> 
            					<span class="category_bg mart"></span>마트
        					</li>  
        
        					<li id="PM9" data-order="2"> 
            					<span class="category_bg pharmacy"></span>약국
        					</li>
        					  
        					<li id="OL7" data-order="3"> 
            					<span class="category_bg oil"></span>주유소
        					</li>
        					  
        					<li id="CE7" data-order="4">
        						<span class="category_bg cafe"></span>카페
        					</li>
        					  
        					<li id="CS2" data-order="5"> 
            					<span class="category_bg store"></span>편의점
        					</li>
        				</ul>
        			</div> <!-- end map_wrap  -->
				</div> <!-- end map  -->
			</div> <!-- end house-map  -->
			
			<div id="house-review" class="house-review">
				<hr>
				<div id="star_info">
					<span class="heading"><strong>평점</strong></span>
					<div id="wrap_star_total">
						<c:choose>
							<c:when test="${house.h_stars<0.5}">
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=0.5 && house.h_stars<1}">
								<span class="review_star_total"><i class="fas fa-star-half-alt"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=1 && house.h_stars<1.5}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=1.5 && house.h_stars<2}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star-half-alt"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=2 && house.h_stars<2.5}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=2.5 && house.h_stars<3}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star-half-alt"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=3 && house.h_stars<3.5}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=3.5 && house.h_stars<4}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star-half-alt"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=4 && house.h_stars<4.5}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="far fa-star"></i></span>
							</c:when>
							<c:when test="${house.h_stars>=4.5 && house.h_stars<5}">
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star-half-alt"></i></span>
							</c:when>
							<c:otherwise>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
								<span class="review_star_total"><i class="fas fa-star"></i></span>
							</c:otherwise>
						</c:choose>	
					</div>					
					<p>${house.h_stars} 점.  ${house.h_starcnt} reviews.</p>
					<hr style="border: 3px solid #f1f1f1">

					<!-- 별점 막대기  -->
					<div class="row">
						<div class="side">
							<div>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
							</div>
						</div>
						<div class="middle">
							<div class="bar-container">
								<div class="bar-5"></div>
							</div>
						</div>
						<div class="side right">
							<div>${star_5}</div>
						</div>

						<div class="side">
							<div>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
							</div>
						</div>
						<div class="middle">
							<div class="bar-container">
								<div class="bar-4"></div>
							</div>
						</div>
						<div class="side right">
							<div>${star_4}</div>
						</div>

						<div class="side">
							<div>	
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
							</div>
						</div>
						<div class="middle">
							<div class="bar-container">
								<div class="bar-3"></div>
							</div>
						</div>
						<div class="side right">
							<div>${star_3}</div>
						</div>

						<div class="side">
							<div>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
							</div>
						</div>
						<div class="middle">
							<div class="bar-container">
								<div class="bar-2"></div>
							</div>
						</div>
						<div class="side right">
							<div>${star_2}</div>
						</div>

						<div class="side">
							<div>
								<span class="review_star"><i class="fas fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
								<span class="review_star"><i class="far fa-star"></i></span>
							</div>
						</div>
						<div class="middle">
							<div class="bar-container">
								<div class="bar-1"></div>
							</div>
						</div>
						<div class="side right">
							<div>${star_1}</div>
						</div>
					</div>
				</div>   <!-- end star-info -->
				
				<div class="review-area">
            		<table class="table">
            			<tr>
	            			<th>no.</th>
    	        			<th>작성자</th>
    	        			<th>방이름</th>
        	    			<th>작성내용</th>
            				<th>작성일</th>
            				<th>별점</th>
            				<th>첨부파일</th>
            			</tr>
            			<c:choose>
            				<c:when test="${!empty reviewList}">
            					<c:forEach var="review" items="${reviewList }" varStatus="index">
		            				<tr>
        		    					<td>${index.count }</td>
	            						<td>${review.rv_uid }</td>
	            						<td>${review.rv_rname}</td>
    	        						<td>${review.rv_contents }</td>
		        	    				<td>${review.rv_regdate }</td>
        		    					<td>${review.rv_star }</td>
            							<td>
            								<c:if test="${!empty review.rv_picture}">
            									<img class="review_img" alt="${review.rv_rname}" src="${review.rv_picture }" style="width:30px; height:30px;">
            								</c:if>
            							</td>
            						</tr>
            					</c:forEach>
            				</c:when>
            				<c:otherwise>
            					<tr>
            						<td colspan="7" style="text-align:center;">등록된 리뷰가 없습니다.</td>
            					</tr>
            				</c:otherwise>
            			</c:choose>
            		</table>
            	</div> <!-- end review area -->
			</div>  <!-- end house-review -->
			
        </div>  <!-- end house info area -->
    </div>  <!-- end wrap -->
	<br><br>
	
    <!-- The Modal -->
	<div id="myModal" class="modal">
  		<span class="close">&times;</span>
  		<img class="modal-content" id="img01">
  		<div id="caption"></div>
	</div>
	<!-- The Modal -->
    
 <script type="text/javascript" src="resources/js/geoPop.js"></script>
 <script type="text/javascript">
///////////////////////////////[1]이미지 썸네일로 띄우기
 var xOffset = 10;
 var yOffset = 30;
  $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
      
     $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='300px' /></p>"); //보여줄 이미지를 선언                       
     $("#preview")
         .css("top",(e.pageY - xOffset) + "px")
         .css("left",(e.pageX + yOffset) + "px")
         .fadeIn("fast"); //미리보기 화면 설정 셋팅
 });
  
 $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
     $("#preview")
         .css("top",(e.pageY - xOffset) + "px")
         .css("left",(e.pageX + yOffset) + "px");
 });
  
 $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
     $("#preview").remove();
 });
 //////////////////////////////////////////////////////
 
 ////////////////////////////////[2]이미지 새창으로띄우기
var modal = document.getElementById("myModal");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
var imgs = document.getElementsByClassName("review_img");
for(var i=0; i<imgs.length; i++){
    var img = imgs.item(i);
    img.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
}
var span = document.getElementsByClassName("close")[0];
span.onclick = function() { 
	  modal.style.display = "none";
}
 ///////////////////////////////////////////////////////
 
 ////////////////////////////////[3]로그인한한사람이 결제하려고하는가?
 function checkBuy(rnum){
	 var checkLogon = '${sessionScope.u_id}';
	 if(checkLogon=='' || checkLogon==null){
		 console.log('로그인안함');
		 alert('로그인 먼저 해주세요!');
		 return false;
	 }else{
		 var url = 'buyPage.do?by_uid='+checkLogon+'&by_rnum='+rnum;
		 console.log(url);
		 location.href=url;
	 }
 }
 </script>
</body>
</html>