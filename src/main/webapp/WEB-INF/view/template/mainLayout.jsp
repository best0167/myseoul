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
    <script src="resources/js/vendor/imagesloaded.pkgd.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/ae977d9299.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    *{ 
        margin:0px;
        /* 브라우저마다 기본설정값이 다르므로 초기화함 */
    }
    html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
    
    /*sticky*/
    #wrap_topMenu{position: absolute;transition:0.3s;}
    #topMenu{color:white;transition:0.3s;}
    #logo{color:white;margin-top:5px;padding-bottom:10;border-radius: 30px;font-weight:bold;text-shadow: 6px 2px 2px #6F1E51;transition:0.3s;}
    #avat{font-size:25px;color:white;transition:0.3s;}
    
    #wrap_topMenu.sticky{position: fixed;transition:0.3s;}
    #topMenu.sticky{color:#6F1E51;background-color:white;box-shadow:0 2px 2px rgba(0,0,0,0.3);transition:0.3s;}
    #logo.sticky{color:white;background-color:#6F1E51;border-radius: 30px;font-weight:bold;margin-top:0px;padding:0;text-shadow: 0 0 0 white;transition:0.3s;}
    #avat.sticky{font-size:25px;color:#6F1E51;transition:0.3s;}
    
    /*스크롤바 css*/
    #fullContents::-webkit-scrollbar-track{border-radius: 10px;background-color:#ffffff}
    #fullContents::-webkit-scrollbar{width: 8px;background-color: white;}
    #fullContents::-webkit-scrollbar-thumb{border-radius: 10px;-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);background-color: #6F1E51;}
    
    /*프로그레스바*/
    .progress { 
    background-color: rgb(0, 0, 0);
    color: rgb(255, 255, 255);
    height: 100%;
    position: absolute;
    width: 100%;
    z-index: 999;
	}
	.progress-bar { 
	    border-top: 1px solid rgb(160, 160, 160);
	    position: absolute;
	    top:50%;
	    width: 0%;
	}
	.progress-text {
	    font-family: "Menlo", "Consolas", monospace;
	    font-size: 12px;
	    margin-top: 10px;
	    position: absolute;
	    text-align: center;
	    top: 50%;
	    width: 100%;
	}
	.progress-complete .progress-bar {
	    border-top-color: rgb(255, 255, 255);
	}
	
    </style>
</head>
<body id="fullContents">
    <!-- 프로그레스바 -->
    <div class="progress" id="progress">
    	<span class="progress-bar"></span>
    	<span class="progress-text">0%</span>
    </div>
    
    <!-- 헤더 -->
    <header>
        <tiles:insertAttribute name="header" />
    </header>
    
    <!-- 이미지 슬라이더 -->
    <div class="imageSlider" style="overflow: hidden;">
        <tiles:insertAttribute name="slider" />
    </div>
    
    <!-- 페이지 내용 -->
    <div class="w3-container w3-content" style="max-width:1400px;margin-top:55px;">
        <tiles:insertAttribute name="body" />
    </div>
    <div class="blank" style="height:30px;">
    </div>
    <!-- 풋터 -->
    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>
    
<script type="text/javascript">
var $header = $('#topMenu');
$(window).scroll(function(){
	if($(this).scrollTop()>0){
		$header.addClass('sticky');
		$('#wrap_topMenu').addClass('sticky');
		$('.imageSlider').addClass('sticky');
		$('#logo').addClass('sticky');
		$('#avat').addClass('sticky');
	}else{
		$header.removeClass('sticky');
		$('#wrap_topMenu').removeClass('sticky');
		$('.imageSlider').removeClass('sticky');
		$('#logo').removeClass('sticky');
		$('#avat').removeClass('sticky');
	}
});



/*	
-본문의 이미지가 로드 되는 상황을 모니터(실시간 파악)
-진행률에 따라 막대늘어나고, 숫자 변경.
-이미지 모두 로드되고 진행률 100%면, 모니터링 중지하고 검은화면 위로
*/	
var $container = $('#progress'),
      $progressBar = $container.find('.progress-bar'),
      $progressText = $container.find('.progress-text'),
      
	  imgLoad = imagesLoaded('body'),
	  imgTotal = imgLoad.images.length,    //전체이미지수
	  imgLoaded = 0,    //로드한 이미지 수
	  current = 0,    //진행률
	  
	  progressTimer = setInterval(updateProgress, 1000/60);
	  
      //이미지를 로드할 때 마다 로드한 이미지 수 늘려준다.
      imgLoad.on('progress',function(){
    	  imgLoaded++;
    	  //console.log(imgLoaded);
      });
      
      function updateProgress(){
    	  //진행률 -> bar
    	  var target = (imgLoaded/imgTotal)*100;
    	  current += (target - current) * 0.2;
    	  
    	  $progressBar.css({width:current + '%'});
    	  $progressText.text(Math.floor(current) + '%');
    	  
    	  if(current > 99.9){
    		  clearInterval(progressTimer);
    		  $container.addClass('progress-complete');
    		  $progressBar.add($progressText).delay(500).animate({opacity:0},250,function(){
    			  $container.animate({top:'-100%'},1000);
    		  });
    	  }
      }
</script>
</body>
</html>