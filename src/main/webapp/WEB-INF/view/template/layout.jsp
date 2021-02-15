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
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300&display=swap" rel="stylesheet">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/ae977d9299.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    *{ 
        margin:0px;
        /* 브라우저마다 기본설정값이 다르므로 초기화함 */
    }
    html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
    a{text-decoration: none;}
    
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
<body id="fullContents">
    
    <!-- 헤더 -->
    <header>
        <tiles:insertAttribute name="header" />
    </header>
    
    <!-- 페이지 내용 -->
    <div class="w3-container w3-content" style="max-width:1400px;margin-top:88px;min-height:600px;">
        <tiles:insertAttribute name="body" />
    </div>
    <div class="blank" style="height:30px;">
    </div>
    <!-- 풋터 -->
    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>
    
</body>
</html>