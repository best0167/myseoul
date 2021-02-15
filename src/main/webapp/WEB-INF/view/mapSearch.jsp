<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/geoView.css" />
</head>
<body>
    <div class="map_wrap">
         <!-- 지도 -->
        <div id="map" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
        
        <!-- 커스텀컨트롤러 -->
        <div class="custom_typecontrol radius_border" id="custom_control" style="display:none">
        <span id="backTo_btn" class="backTo_btn" onclick="backToMap()">행정구보기</span>
        </div>
        
        <!-- 지도 확대,축소 컨트롤러 -->
        <div class="custom_zoomcontrol radius_border" id="zoom_control" style="display:none"> 
            <span onclick="zoomIn()"><img src="images/plus.png" alt="+"></span>
            <span onclick="zoomOut()"><img src="images/minus.png" alt="-"></span>
        </div>
    </div>
    
    <hr>
    
    <div style="text-align:center;margin-bottom:10px;">
    	<span id="list_Title">Hosting List </span>
    	<i class="fa fa-spinner fa-pulse fa-fw" id="icon_loading"></i>
    	<div id="checkClick">&#40;지역구를 선택해주세요&#41;</div>
    </div>
    <table id="regionList">
    </table>
    <br><br>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606bf9816c682ce36d532684fd87093&libraries=services"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e606bf9816c682ce36d532684fd87093"></script>
    <script type="text/javascript" src="resources/js/geoView.js"></script>
</body>
</html>