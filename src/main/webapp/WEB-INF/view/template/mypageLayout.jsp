<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>
        <tiles:getAsString name="title" />
    </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300&display=swap" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/ae977d9299.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    *{ 
        margin:0px;
        /* 브라우저마다 기본설정값이 다르므로 초기화함 */
    }
    a{text-decoration: none;}
    html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
    .container{
       margin-top:70px;
       /* width:1400px; */
       min-height:750px;
       margin-bottom:10px;
       margin-left:auto;
       margin-right:auto;
       padding-right:0px;
       padding-left:0px;
    }
    .myPage_menu {
       background-color : #f0f0f0;
       width:15%;
       /* width:150px; */
       min-height:700px;
       /* height:100%; */
       float:left;
       margin:0px 10px 0px 0px;
       padding-top:16px;
    }
    .myPage_body {
       width:82%; 
       /* width:1230px; */
       min-height:700px;
       float:right;
       margin:0px;
    }
    footer{clear: both;}
    
    /*sticky*/
    #wrap_topMenu{position: fixed;}
    #topMenu{color:#6F1E51;background-color:white;box-shadow:0 2px 2px rgba(0,0,0,0.3);}
    #logo{color:white;background-color:#6F1E51;border-radius: 30px;font-weight:bold;margin-top:0px;padding:0;text-shadow: 0 0 0 white;}
    #avat{font-size:25px;color:#6F1E51;}
    
    /*스크롤바 css*/
    #fullContents::-webkit-scrollbar-track{border-radius: 10px;background-color:#ffffff}
    #fullContents::-webkit-scrollbar{width: 8px;background-color: white;}
    #fullContents::-webkit-scrollbar-thumb{border-radius: 10px;-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);background-color: #6F1E51;}
    
    </style>
</head>
<!-- <body class="w3-theme-l5"> -->
<body id="fullContents">
    
    <!-- 헤더 -->
    <header>
        <tiles:insertAttribute name="header" />
    </header>
    
    <!-- container -->
    <div class="container" id="container">
       <!-- 마이페이지 메뉴  -->
       <div class="myPage_menu" id="myPage_menu">
           <tiles:insertAttribute name="mypage_menu" />
       </div>
    
       <!-- 페이지 내용 -->
       <div class="myPage_body" id="myPage_body">
           <tiles:insertAttribute name="mypage_body" />
       </div>
    </div> 
    <!-- container -->
    
    <!-- 풋터 -->
    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>
    
    
<script type="text/javascript">
$(document).ready(function(){
   
  var l_height = $("#myPage_menu").height();
  var r_height = $("#myPage_body").height();

  if(l_height < r_height) {
         $("#myPage_menu").height(r_height);
  } else {
          $("#myPage_body").height(l_height);
   }
});
</script>
</body>
</html>