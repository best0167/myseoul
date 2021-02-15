<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/vendor/modernizr.custom.min.js"></script>
	<script src="resources/js/vendor/jquery-1.10.2.min.js"></script>
	<script src="resources/js/vendor/jquery-ui-1.10.3.custom.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/index.css">
<style>

</style>
</head>
<body>
    <div class="wrap_enroll">
       인덱스페이지. 테스트용페이지입니다.<br> 
        세션아이디 : ${sessionScope.u_id}<br>
        <hr>
	    <div class="test_icon" style="border:1px solid red;">
	        <h1>아이콘테스트</h1>
	        <i class="fas fa-users" style="font-size:28px;color:gray;">(3)</i>
	        <br>
	        <i class="fas fa-door-open" style="font-size:28px;color:gray;">(5)</i>
	        <br>
	        <i class="fas fa-bath" style="font-size:28px;color:gray;">(2)</i>
	        <br>
	        <i class="fa fa-spinner fa-spin fa-fw"></i> 
			<i class="fa fa-circle-o-notch fa-spin fa-fw"></i>
			<i class="fa fa-refresh fa-spin fa-fw"></i>  
			<i class="fa fa-cog fa-spin fa-fw"></i> 
			<i class="fa fa-spinner fa-pulse fa-fw"></i>
			<i class="far fa-hand-point-right"></i>
			<hr>
			<i class="fab fa-accusoft">accusoft</i>
			
		</div>
		
		<br>
		
		<div class="test_weather_api" style="border:1px solid green;">
			<h1>weather api 테스트</h1>
			<h2>- 날씨 예보</h2>
			<div class="ctemp">현재 온도:</div>
			<div class="clowtemp">최저 온도:</div>
			<div class="chightemp">최고 온도:</div>
			<div class="cicon">아이콘 :</div>
		</div>
		
		<br>
		
		<div class="test_weather_api_view" style="border:1px solid blue;width:100%;height:900px;overflow: hidden;">
			<div class="scene" id="scene-2">
			
				<div id="scene-2-content">
				<h2 class="title">
					현재 <span class="city">Seoul</span> 날씨
				</h2>
				<div class="charts clearfix">

					<div class="chart" id="sunshine">
						<div class="circle-mask-outer left">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="circle-mask-outer right">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="chart-content">
							<img class="icon" src="images/graphic-sun.png" alt="Sunshine">
							<p class="text">
								<span class="percent-number"></span><span class="percent-symbol">&deg;</span>
							</p>
						</div>
					</div>
					<!-- /.chart -->

					<div class="chart" id="water">
						<div class="circle-mask-outer left">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="circle-mask-outer right">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="chart-content">
							<img class="icon" src="images/graphic-water.png" alt="Water">
							<p class="text">
								<span class="percent-number"></span><span class="percent-symbol">%</span>
							</p>
						</div>
					</div>
					<!-- /.chart -->
					<!-- <div class="chart" id="birds">
						<div class="circle-mask-outer left">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="circle-mask-outer right">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="chart-content">
							<img class="icon" src="images/graphic-bird.png" alt="Birds">
							<p class="text">
								<span class="percent-number">20</span><span
									class="percent-symbol">%</span>
							</p>
						</div>
					</div> -->
					<!-- /.chart -->
					<!-- <div class="chart" id="woods">
						<div class="circle-mask-outer left">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="circle-mask-outer right">
							<div class="circle-mask-inner">
								<div class="circle-body"></div>
							</div>
						</div>
						<div class="chart-content">
							<img class="icon" src="images/graphic-woods.png" alt="Woods">
							<p class="text">
								<span class="percent-number">45</span><span
									class="percent-symbol">%</span>
							</p>
						</div>
					</div> -->
					<!-- /.chart -->

				</div>
				<!-- //charts -->
			</div>
			<!-- /#scene-2-content -->
			</div>
		</div>
		
		<br>
		
	</div>
    
<script type="text/javascript" src="resources/js/index.js"></script>
</body>
</html>