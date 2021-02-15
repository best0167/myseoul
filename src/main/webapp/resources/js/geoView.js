	//[1] geojson파일에서 행정구이름,좌표추출
	$.getJSON("resources/json/seoul.json", function(geojson){
		var data=geojson.features;
		var coordinates = new Array();  //좌표저장할배열임
		var name='';  //행정 구 이름
		
		$.each(data, function(index, val){
			coordinates = val.geometry.coordinates;
			region = val.properties.name;	
			getAreaJson(region, coordinates);
		})
	})/////////////////////////////////////end [1]
	     
	//[2] area로 지역구이름,좌표리스트 받기
	function getAreaJson(region, coordinates){
		var area = new Object();  //단일 지역구 객체임
		var paths = new Array();  //해당지역구의 좌표값 배열임
		var locSet = new Array(); //해당지역구의 중심좌표값 구하기위한 단일좌표값 배열
		
		$.each(coordinates[0], function(index, coordinate){
			var point = new Object();
			point.x = coordinate[1];
			point.y = coordinate[0];
			locSet.push(point);
			paths.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
		})
		
		area = {
			name:region,
			path:paths,
			points:locSet
		};
		//console.log(area.name);  //체크용
		//console.log(area.path);  //체크용
		//console.log(points);  //체크용
		
		displayArea(area);
	}//////////////////////////////////////end [2]

	//[3] 카카오지도 삽입하기
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption),
	    customOverlay = new kakao.maps.CustomOverlay({}),
	    infowindow = new kakao.maps.InfoWindow({removable: true});
	    
	map.setZoomable(false);  //휠로 확대,축소 기능 비활성화
	//////////////////////////////////////end [3]

	//[4] 폴리곤 생성하기
	var polygons=[];  // 폴리곤 전체를 담을것임(한꺼번에 제거하기위함)
	var customOverlays = [];  //  커스텀오버레이 전체를 담을것임(한꺼번에 제거할때 필요)
	 function displayArea(area) {
		//check용
			//console.log(area.path);
			//console.log(area.name);
			//console.log(area.points);
			
		    
			// 해당 지역구의 다각형을 생성합니다 
		    var polygon = new kakao.maps.Polygon({
		        map: map, // 다각형을 표시할 지도 객체
		        path: area.path,
		        strokeWeight: 2,
		        strokeColor: '#004c80',
		        strokeOpacity: 0.8,
		        fillColor: '#fff',
		        fillOpacity: 0.7 
		    });
		    polygons.push(polygon);  // 생성한 행정구 다각형 적재
		    
		    
		    // 해당 지역구의 커스텀오버레이를 생성합니다.
		    var customOverlay = new kakao.maps.CustomOverlay({
		    	map: map,
		    	clickable: false,
		    	content: '<div class="customOverlay">'+area.name+'</div>',
		    	position: centroid(area.points),
		    	xAnchor: 0.6,
		    	yAnchor: 0.5,
		    	zIndex: 3
		    });
		    customOverlays.push(customOverlay);  // 생성된 지역구 커스텀오버레이를 적재
		    
		    
		    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
		        polygon.setOptions({fillColor: '#09f'});
		    });

		   
		    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다 
		    kakao.maps.event.addListener(polygon, 'mouseout', function() {
		        polygon.setOptions({fillColor: '#fff'});
		    }); 
		    
		    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당지역의 중심포인트를 기준으로 지도를 확대합니다. 
		    kakao.maps.event.addListener(polygon, 'click', function() {
		    	polygon.setOptions({fillColor: '#fff'});  //폴리곤 원래색으로
		    	var level = map.getLevel()-2;  // 지도 레벨 확대레벨설정
		    	
		    	// 확대할 부분의 중심포인트 설정
		    	map.setLevel(level, {anchor: centroid(area.points), animate:{
		    		duration: 350 //확대 애니메이션 시간
		    	}});
		    	deletePolygon(polygons); // 폴리곤 전체 제거
		    	deleteCustomOverlay(customOverlays);  // 커스텀오버레이 전체 제거
		    	makeRegion(area.name); // 클릭한 지역구 내에 등록된 집 리스트 검색
		    	delIcon();//로딩중아이콘제거
		    	$("#custom_control").css({display: "inline"});  //되돌리기 버튼 보이기
		    	$("#zoom_control").css({display: "inline"});    //줌 인,아웃버튼 보이기
		    });
		    
	 }//////////////////////////////////////end [4]
	 
	//[5] 폴리곤 중심좌표 구하는 함수 : centroid
	function centroid(points){
		var i, j, len, p1, p2, f, area, x, y;
		area = x = y = 0;
		for(i=0, len = points.length, j = len-1; i<len; j=i++){
			p1=points[i];
			p2=points[j];
			
			f = p1.y*p2.x-p2.y*p1.x;
			x +=(p1.x+p2.x) * f;
			y +=(p1.y+p2.y) * f;
			area += f*3;
		}
		return new kakao.maps.LatLng(x/area , y/area);
	}//////////////////////////////////////end [5]

	//[6] 폴리곤 없애는 함수
	function deletePolygon(polygons){
		for(var i = 0; i<polygons.length; i++){
			polygons[i].setMap(null);
		}
		polygons = [];
	}//////////////////////////////////////end [6]

	//[7] 커스텀오버레이 제거하는 함수
	function deleteCustomOverlay(customOverlays){
		for(var i = 0; i<customOverlays.length; i++){
			customOverlays[i].setMap(null);
		}
		customOverlays = [];
	}//////////////////////////////////////end [7]

	//[8] 클릭한 지역구의 정보 표시하는 함수
	function makeRegion(region){
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'callRegion.do?data='+region,
			success:function(res){
				// console.log(res);  //check용!
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////리스트뿌리기
				var str = '';
				$.each(res,function(index, element){
					var url = 'housedetail.do?h_num='+element.h_num;
					
					var type_name = '';
					if(element.h_type==1){type_name = '아파트';}
					else if(element.h_type==2){type_name = '빌라';}
					else if(element.h_type==3){type_name = '상가';}
					else if(element.h_type==4){type_name = '오피스텔';}
					else{type_name = '단독주택';}
					
					var gender_name='';
					if(element.h_gender=='m'){gender_name = '남성전용';}
					else{gender_name = '여성전용';}
					
					    str +="<tr id='tr_house_"+(index+1)+"'>";
					    str +=	"<th>"+(index+1)+"</th>";
					    str +=	"<td class='house_pic'><img src='"+element.h_mainPic+"' width='100%' min-width='115px' height='110px' alt='사진'>";
					    str +=	"<td class='house_info' onClick='location.href=\"housedetail.do?h_num="+element.h_num+"\"' target='_blank'>&#91;";
					    str +=		"<span class='house_type'>"+ type_name +"</span>&#47;";
						str +=		"<span class='house_gender'>"+ gender_name +"</span>&#93;<br>";
					    str +=		"<span class='house_name'>"+ element.h_name + "</span><br>";
					    str +=		"<span class='house_addr'>"+ element.h_roadaddr +","+ element.h_detailaddr +"</span>";
						str +=	"</td>";
						str +=	"<td class='house_item'>";
						str +=           "<i class='fas fa-users' style='font-size:20px;color:#30336b;'>"+element.h_limit+"</i>&nbsp;&nbsp;";
						str +=           "<i class='fas fa-door-open' style='font-size:20px;color:#e58e26;'>"+element.h_rooms+"</i>&nbsp;&nbsp;";
						str +=           "<i class='fas fa-bath' style='font-size:20px;color:#0abde3'>"+element.h_bath+"</i>";
						str +=	"</td>";
						str +=	"<td class='house_stars'>";
						str +=		"<sapn class='stars'><img src='images/icon_star.png' width='20px' alt='별점'>"+element.h_stars+"&#40;"+element.h_starcnt+"&#41;</span>";
						str +=	"</td>";
					    str +="</tr>";
						
						makeRegionMarker(index+1,element);
				});
				$('#regionList').append(str);
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////리스트뿌리기
			},
			error:function(){
				alert("error");
			}	
		});
	}//////////////////////////////////////end [8]

	//[9] 마커 생성하는 함수
	var regionMarkers=[];  // 해당지역구 마커 전체를 담을것임(한꺼번에 제어하기위함)
	var regionOverays=[];  // 해당지역구 마커의 커스텀오버레이 전체를 담을것임(한꺼번에 제어하기위함)
	function makeRegionMarker(listNum,region){
		var index = listNum;
		var hnum = region.h_num;
		var picture = region.h_mainPic;
		var bnb = region.h_name;
		var addr = region.h_roadaddr;
		var detailaddr = region.h_detailaddr;
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var markerCoords = new kakao.maps.LatLng(result[0].y, result[0].x);  //주소(addr)로 검색한 좌표값
		        var imageSrc = 'images/red_marker.png',  // 마커의 이미지 주소
		              imageSize = new kakao.maps.Size(38, 40),  //마커의 이미지크기
		              imageOption = {offset: new kakao.maps.Point(27, 69)}; //// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		        
		        //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다.
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		              markerPosition = markerCoords; // 마커가 표시될 위치입니다
		               
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: markerPosition,
		            image:markerImage
		        });
		        regionMarkers.push(marker);  // 생성한 마커 적재
		        
		     // 마커를 클릭했을 때 마커 위에 표시할 커스텀오버레이를 생성합니다
		        var content ='<div class="pop_wrap">'+ 
	                                 '<div class="pop_info">'+
	                                     '<div class="pop_title">'+
	                                         index+'.'+bnb+'<div class="pop_close" onclick="closeOverlay()" title="닫기"></div>'+
	                                     '</div>'+
	                                     '<div class="pop_body">'+
	                                         '<div class="pop_img">'+
	                                             '<img src="'+picture+'" width="73" height="70">'+
	                                         '</div>'+
	                                         '<div class="pop_desc">'+
	                                             '<div class="pop_roadaddress">'+addr+'</div>'+
	                                             '<div class="pop_detailaddress">'+detailaddr+'</div>'+
	                                             '<div><a href="#tr_house_'+index+'" class="pop_link">&laquo;요약정보보기</a>&nbsp;&ctdot;&nbsp;'+
	                                                       '<a href="housedetail.do?h_num='+hnum+'" target="_blank" class="pop_link">세부정보보기&raquo;</a></div>'+
	                                         '</div>'+
	                                     '</div>'+
	                                 '</div>'+
	                             '</div>';

	            // 커스텀오버레이 생성 : 장소에 대한 설명을 표시합니다
	            var overlay = new kakao.maps.CustomOverlay({
		    	position: marker.getPosition(), 
		    	content: content,
		        });
	            regionOverays.push(overlay);  //생성한 커스텀오버레이 적재
	            
	            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	            kakao.maps.event.addListener(marker, 'click', function() {
	            closeOverlay();
				overlay.setMap(map);
				});
		              
		     }/////end if
		}); ////end addressSearch()
	}//////////////////////////////////////end [9]

	//[10]커스텀 오버레이닫기를 눌렀을때 맵에서 제거
	function closeOverlay(){
		for(var i = 0; i<regionOverays.length; i++){
			regionOverays[i].setMap(null);
		}
	}//////////////////////////////////////end [10]

	//[11]맵 되돌리기함수
	function backToMap(){
		showIcon();//로딩중아이콘보이기
		
		// 마커들 제거
		for(var i = 0; i<regionMarkers.length; i++){
			regionMarkers[i].setMap(null);
			regionOverays[i].setMap(null);
		}
		regionMarkers = [];  //전체비우기(마커)
		regionOverays=[];  //전체비우기(마커의 커스텀오버레이)
		
		//폴리곤 띄우기
		for(var i = 0; i<polygons.length; i++){
			polygons[i].setMap(map);
		}
		
		//커스텀오버레이 띄우기
		for(var i = 0; i<customOverlays.length; i++){
			customOverlays[i].setMap(map);
		}
		
		//지도 크기원래대로, 중심좌표이동
		var moveLatLon = new kakao.maps.LatLng(37.566826, 126.9786567); //중심위치
		map.setLevel(9);
		map.panTo(moveLatLon);
		
		$("#custom_control").css({display: "none"});  //되돌리기 버튼 감추기
		$("#zoom_control").css({display: "none"});    //줌 인,아웃버튼 감추기

		$('#regionList').empty();//테스트용 리스트 지우기
		
	}//////////////////////////////////////end [11]

	//지도를 1레벨씩 확대하는 함수
	function zoomIn() {
		map.setLevel(map.getLevel() - 1, {animate:{
			duration: 200 //애니메이션 시간
		}});
	}

	// 지도를 1레벨씩 축소하는 함수
	function zoomOut() {
		map.setLevel(map.getLevel() + 1, {animate:{
			duration: 200 //애니메이션 시간
		}});
	}
	
	function delIcon(){
		$("#icon_loading").css({display: "none"});
		$("#checkClick").css({display: "none"});
	}
	
	function showIcon(){
		$("#icon_loading").css({display: "inline-block"});
		$("#checkClick").css({display: "block"});
	}