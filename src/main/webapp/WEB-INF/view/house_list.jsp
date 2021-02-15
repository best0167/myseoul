<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" > </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300&display=swap" rel="stylesheet">
<script type="text/javascript">
/* $(document).ready(function(){
	$(window).resize(function(){
		var windowWidth = $(window).width();
		console.log("현재창의 width :"+windowWidth);
		if(windowWidth<805){
			var element = document.getElementsByClassName("float-unit");
			for(var i=0;i<element.lenght;i++){
				var el = element.item(i);
				el.style.width="48%";
			}
		}
		else{
			var element = document.getElementsByClassName("float-unit");
			for(var i=0;i<element.lenght;i++){
				var el = element.item(i);
				el.style.width="32%";
			}
		}
	});
}); */
function searchajax(){

	var h_rooms = $('#h_rooms').val();
	var h_bath = $('#h_bath').val();	
	var h_type = $('#categori option:selected').val();
	$('#h_type').val(h_type);
	if(h_type == 0 && h_rooms == 0 && h_bath == 0){
		alert('검색 필터를 설정해주세요');
	}
	else{
	/* 	$('#search').attr('action','house_list.do');
		$('#search').submit(); */
		$.ajax({
			type: 'GET',
			url: 'house_list.do',
			data: {h_type : h_type, h_rooms : h_rooms, h_bath : h_bath},
			success: function(result){
				console.log('성공');
				$("html").html(result);
				/* $('#h_rooms').val(room); */
			},
			error:function(e) {
				alert('error :');
			}
		}); 
	}	
	/* var categori = document.getElementById("categori");
	console.log(categori.options[categori.selectedIndex].value); */
};
var room =0;
function roommin(){
	if(room<=0){
		room=0;
	}else{
		room= room-1;
	}
	$('#room').text(room+'개');
	$('#h_rooms').val(room);
};
function roomplu(){
	room= room+1;
	$('#room').text(room+'개');
	$('#h_rooms').val(room);
};
var bath =0;
function bathmin(){
	if(bath<=0){
		bath=0;
	}else{
		bath= bath-1;
	}
	$('#bath').text(bath+'개');
	$('#h_bath').val(bath);
};
function bathplu(){
	bath= bath+1;
	$('#bath').text(bath+'개');
	$('#h_bath').val(bath);
};
/* var isEnd = false;

$(function(){
    $(window).scroll(function(){
        var $window = $(this);
        var scrollTop = $window.scrollTop();
        var windowHeight = $window.height();
        var documentHeight = $(document).height();
        
        console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        
        // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 30 > documentHeight ){
            fetchList();
        }
    })
    fetchList();
})

var fetchList = function(){
    if(isEnd == true){
        return;
    }
    
    // 방명록 리스트를 가져올 때 시작 번호
    // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
    // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
    var startNo = $("#list-guestbook li").last().data("no") || 0;
    $.ajax({
        url:"/guestbook/api/guestbook/list?no=" + startNo ,
        type: "GET",
        dataType: "json",
        success: function(result){
            // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
            // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
            var length = result.data.length;
            if( length < 5 ){
                isEnd = true;
            }
            $.each(result.data, function(index, vo){
                renderList(false, vo);
            })
        }
    });
}

var renderList = function(mode, vo){
    // 리스트 html을 정의
    var html = "<li data-no='"+ vo.no +"'>" +
        "<strong>"+ vo.name +"</strong>" +
        "<p>"+ vo.content.replace(/\n/gi, "<br>") +"</p>" +
        "<strong></strong>" +
        "<a href='#' data-no='"+ vo.no +"'>삭제</a>" +
        "</li>"
    
    if( mode ){
        $("#list-guestbook").prepend(html);
    }
    else{
        $("#list-guestbook").append(html);
    }
} */
</script>

<style type="text/css">
body{
	font-family: 'Noto Sans KR', sans-serif;
	font-size:16px;
}
ul{
   list-style:none;
   }
address{
	margin-bottom: 3px;
}
p{
	margin-bottom: 5px;
}
figure{
	margin-bottom: 0;
}
.one{
  height: 300px;
  width: 320px;
  background: #333;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  padding: 15px 0;
  margin-bottom: 20px;
  margin-left: 10px;
  float: left;
}
.two{
            width:70%;
            height:300px;
            float:left;
            border-right-style: groove;
            
}
.three{
            width:30%;
            height:300px;
            float:right;
            text-align: center;
}
.four{
            width:100%;
            height:100px;
            border-bottom-style: groove;
            
}
.five{
            width:100%;
            height:200px;
            float:left;
}
.six{
            width:200px;
            height:200px;
            float:left;
}
.seven{
            width:50%;
            height:150px;
            float:left;
}

.list-item{
	height: 300px;
 	width: 450px;
  background: #333;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  padding: 15px 0;
  margin-bottom: 20px;
  margin-left: 10px;
  float: left;
}
._v2ee95z {
    cursor: pointer !important;
    text-align: center !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    position: relative !important;
    padding-top: 8px !important;
    padding-bottom: 8px !important;
    padding-left: 16px !important;
    padding-right: 16px !important;
    font-size: 12px !important;
    line-height: 35px !important;
    background-color: rgb(250, 250, 250) !important;
    color: rgb(34, 34, 34) !important;
    font-weight: 800 !important;
    border-width: 1px !important;
    border-style: solid !important;
    border-image: initial !important;
    outline: none !important;
    margin: 0px !important;
    border-radius: 30px !important;
    border-color: rgb(34, 34, 34) !important;
}
._w37zq5 {
    font-weight: 400 !important;
    font-size: 14px !important;
    line-height: 18px !important;
}
._jro6t0 {
    display: -webkit-box !important;
    display: -moz-box !important;
    display: -ms-flexbox !important;
    display: -webkit-flex !important;
    display: flex !important;
}
._hk8epad {
    display: block !important;
    height: 0px !important;
    visibility: hidden !important;
    pointer-events: none !important;
    background-color: rgb(247, 247, 247) !important;
    color: rgb(34, 34, 34) !important;
    font-weight: 800 !important;
    overflow: hidden !important;
    border-color: rgb(34, 34, 34) !important;
}
.pageList a{
		text-decoration:none;
		color:black;
	}
.pageList a:hover, .pageList .pagecolor{
	text-decoration:underline;
	color:red;
}
.topsearch{
	position: fixed; 
	margin-left: 20%;
}
.float-unit{
  width: 430px;  
  color: #333;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 10px;
  margin-left: 10px;
  float: left;
  cursor: pointer;
}
.float-img{
	width: 100%;
	background-position: 45% 50%;
	background-size: 97% 93%;
	background-repeat: no-repeat;
}
.listwrap{
	padding: 10px;
	overflow: hidden;
}
.float-text{
	margin-top:5px;
	text-align: left;

}
.addr{
	line-height: 18px;
	width: 80%;
	display: inline-block;
}
.star{
	padding-top:5px;
	line-height:18px;
	width: 15%;
	display: inline-block;
	float:right
}
.fa-star{
	color:#f22758;
}
.ex{
	max-width: 100%;
	max-height: 100%;
	
}

</style>
</head>
<body>
<div id="ex">
<div style="height: 50px; margin-top: -35px;">
<div class="topsearch"">

	<div style="display: inline-block">	
	<div class="_v2ee95z">
	<span class="_w37zq5">
	<span class="_36rlri">방갯수</span>
	<a href="#" onclick="roommin()"><img src="images/minus2.png" width="20px" height="20px"></img></a>
	<span id="room">0개</span>
	
	<a href="#" onclick="roomplu()"><img src="images/plus2.png" width="20px" height="20px"></img></a>
	</span>
	<span aria-hidden="true" class="_hk8epad">
	<span class="_w37zq5">
	</span></span></div>
	</div>
	
	<div style="display: inline-block">	
	<div class="_v2ee95z">
	<span class="_w37zq5">
	<span class="_36rlri">화장실 갯수</span>
	<a href="#" onclick="bathmin()"><img src="images/minus2.png" width="20px" height="20px"></img></a>
	<span id="bath">0개</span>
	
	<a href="#" onclick="bathplu()"><img src="images/plus2.png" width="20px" height="20px"></img></a>
	</span>
	<span aria-hidden="true" class="_hk8epad">
	<span class="_w37zq5">
	</span></span></div>
	</div>
	
	<div style="display: inline-block">	
	<div class="_v2ee95z">
	<span class="_w37zq5">
	<select id='categori' size='1' class="form-control">
	<option value="0" selected>-숙소유형-</option>
	<option value="1">아파트</option>
	<option value="2">빌라</option>
	<option value="3" >상가</option>
	<option value="4" >오피스텔</option>
	<option value="5" >단독주택</option>
	</select>
	</span>
	<span aria-hidden="true" class="_hk8epad">
	<span class="_w37zq5">
	</span></span></div>
	</div>
	
	<a href="mapGo.do">
	<div style="display: inline-block">	
	<div class="_v2ee95z">
	<span class="_w37zq5">
	<span class="_36rlri">지역구</span>
	</span>
	<span aria-hidden="true" class="_hk8epad">
	<span class="_w37zq5">
	</span></span></div>
	</div>
	</a>

	
	<a onclick="searchajax()" href="#">
	<div style="display: inline-block">	
	<div class="_v2ee95z">
	<span class="_w37zq5">
	<span class="_36rlri">검색</span>
	<img alt="검색" src="images/search.png" width="20px" height="20px">
	</span>
	<span aria-hidden="true" class="_hk8epad">
	<span class="_w37zq5">
	</span></span></div>
	</div>
	</a>
</div>
</div>
<form id="search">
	<input type="hidden" id="h_rooms" value="0">
	<input type="hidden" id="h_bath" value="0">
	<input type="hidden" id="h_type" value="0">
</form>
	<div id="listwrap" class="listwrap">		
		<c:forEach var="dto" items="${hdto}">
			<div class="float-unit" onclick="location.href='housedetail.do?h_num=${dto.h_num}'">
				<div class="float-img">
				<figure style="display: block; height: 370px;">
					<img alt="없음" src="${dto.h_pic}" style="height: 376px;width:430px; box-sizing: border-box; border-radius:8px;	">				
				</figure>
				</div>	
				<div class="float-text">
				<div>
					${dto.h_name}
					<span>·</span>
					<c:choose>
        		    <c:when test="${dto.h_type==1}">
      		          아파트
       			     </c:when>
       			     <c:when test="${dto.h_type==2}">
          		      빌라
         			 </c:when>
         			 <c:when test="${dto.h_type==3}">
                	  상가
            		</c:when>
            		<c:when test="${dto.h_type==4}">
                	  오피스텔
            		</c:when>
            		<c:when test="${dto.h_type==5}">
                	 단독주택
            		</c:when>
        			</c:choose>
				</div>
				
				<div class="house_middle">
					<div class="addr">${dto.h_region} ${dto.h_roadaddr}</div>
					<div class="star">
						<span class="fa fa-star checked"></span>
					${dto.h_stars}
					</div>
				</div>
				
        			<p><img alt="집평수" src="images/house.png" height="15px" width="15px"> : ${dto.h_area}m<sup>2</sup>
            		<img alt="방갯수" src="images/room.png" height="15px" width="15px"> : ${dto.h_rooms}
            		<img alt="화장실" src="images/bath.png" height="15px" width="15px"> : ${dto.h_bath}
            		<img alt="인원수" src="images/people.png" height="15px" width="15px"> : ${dto.h_limit}</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="container">
	<div class="row">
	<div class="col">
	<ul class="pagination pagination-lg justify-content-center">
		<c:if test="${pv.startPage >1 }">
		<li class="page-item">
			<a href="house_list.do?currentPage=${pv.startPage-pv.blockPage}&searchKey=${pv.searchKey}
			   &searchWord=${pv.searchWord}" class="page-link">이전</a>
		</li>
		</c:if>
		
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<c:url var="currPage" value="house_list.do">
					<c:param name="currentPage" value="${i}"/>
				</c:url>
				<c:choose>
					<c:when test="${i==pv.currentPage}">
					<li class="page-item">
						<a href="${currPage}" class="page-link">
							<c:out value="${i}"/>
						</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="${currPage}">
							<c:out value="${i}"/></a>
					</li>
					</c:otherwise>
				</c:choose>
		</c:forEach>
		<c:if test="${pv.endPage < pv.totalPage}">
		<li class="page-item">
			<a class="page-link" href="house_list.do?currentPage=${pv.startPage+pv.blockPage }">다음</a>
		</li>
		</c:if>
	</ul>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>

