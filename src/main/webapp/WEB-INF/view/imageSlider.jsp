<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="resources/css/slider.css">
</head>
<body>
    <!-- 이미지슬라이드 Section -->
    <div class="slideshow-container">
        <div class="mySlides fade">
            <div class="numbertext"><!-- 1 / 4 --></div>
            <img src="images/mainSeoul.jpg" style="width:100%">
            <div class="text"><!-- Caption One --></div>
        </div>
        
        <div class="mySlides fade">
            <div class="numbertext"><!-- 2 / 4 --></div>
            <img src="images/mainImg1.jpg" style="width:100%">
            <div class="text"><!-- Caption Two --></div>
        </div>
        
        <div class="mySlides fade">
            <div class="numbertext"><!-- 3 / 4 --></div>
            <img src="images/mainImg2.jpg" style="width:100%">
            <div class="text"><!-- Caption Three --></div>
        </div>
        
        <div class="mySlides fade">
            <div class="numbertext"><!-- 4 / 4 --></div>
            <img src="images/mainImg3.jpg" style="width:100%">
            <div class="text"><!-- Caption Four --></div>
        </div>
    </div>
    <br>
    <div style="text-align:center">
        <span class="dot"></span> 
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span> 
    </div>

<script type="text/javascript" src="resources/js/slider.js"></script>
</body>
</html>