$(document).ready(function(){

var bnb = $('#param_bnb').val(); //$('input[name=param_bnb]').val(); name으로 가져오기(동일한거임)
var addr = $('#param_addr').val();
var detailaddr = $('#param_detailAddr').val();

//console.log(bnb);
//console.log(addr);
//console.log(detailaddr);
var container = document.getElementById('map'),    // 지도를 표시할 div 
options = {
     center: new kakao.maps.LatLng(33.450701, 126.570667),    // 지도의 중심좌표
     level: 3    // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(container, options);
map.setZoomable(false);  //휠로 확대,축소 기능 비활성화
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);  //주소(addr)로 검색한 좌표값
        var imageSrc = 'images/red_dott_marker.png',  // 마커의 이미지 주소
               imageSize = new kakao.maps.Size(58, 60),  //마커의 이미지크기
               imageOption = {offset: new kakao.maps.Point(27, 69)}; //// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
        //마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다.
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
               markerPosition = coords; // 마커가 표시될 위치입니다
               
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: markerPosition,
            image:markerImage
        });
        
        map.setCenter(coords);  //지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        
/////////////////////////////지도띄우기 완료
    
/////////////////////////////이벤트 등록
  //[1]마커 클릭이벤트      
        // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
        var content =/*'<div class="pop_wrap">'+ 
                                 '<div class="pop_info">'+
                                     '<div class="pop_title">'+
                                         bnb+'<div class="pop_close" onclick="closeOverlay()" title="닫기"></div>'+
                                     '</div>'+
                                     '<div class="pop_body">'+
                                         '<div class="pop_img">'+
                                             '<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'+
                                         '</div>'+
                                         '<div class="pop_desc">'+
                                             '<div class="pop_roadaddress">'+addr+'</div>'+
                                             '<div class="pop_detailaddress">'+detailaddr+'</div>'+
                                             '<div><a href="https://map.kakao.com/link/to/'+bnb+','+result[0].y+','+result[0].x+
                                             '" target="_blank" class="pop_link">길찾기</a></div>'+
                                         '</div>'+
                                     '</div>'+
                                 '</div>'+
                             '</div>';*/
        	'<div class="customoverlay">' +
        '  <a href="https://map.kakao.com/link/to/'+bnb+','+result[0].y+','+result[0].x+
        '" target="_blank" class="pop_link">' +
        '    <span class="title">'+bnb+'</span>' +
        '  </a>' +
        '</div>';

        // 커스텀오버레이 생성 : 장소에 대한 설명을 표시합니다
	    overlay = new kakao.maps.CustomOverlay({
	    	position: marker.getPosition(), 
	    	content: content,
	        map:map
		});
                             
        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});

  //[2]설정한 카테고리(커스텀오버레이) 클릭이벤트        
        //마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
        var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
        markers = [], // 마커를 담을 배열입니다
        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
        
        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places(map); 

        // 지도에 idle 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', searchPlaces);

        // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
        contentNode.className = 'placeinfo_wrap';

        // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
        // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
        addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
        addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
        
        // 커스텀 오버레이 컨텐츠를 설정합니다
        placeOverlay.setContent(contentNode);  

        // 각 카테고리에 클릭 이벤트를 등록합니다
        addCategoryClickEvent();

        // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
        function addEventHandle(target, type, callback) {
            if (target.addEventListener) {
                target.addEventListener(type, callback);
            } else {
                target.attachEvent('on' + type, callback);
            }
        }

        // 카테고리 검색을 요청하는 함수입니다
        function searchPlaces() {
            if (!currCategory) { return; }
            
            // 커스텀 오버레이를 숨깁니다 
            placeOverlay.setMap(null);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                displayPlaces(data);
            }
        }
        
        // 지도에 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
            // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
            var order = document.getElementById(currCategory).getAttribute('data-order');

            for ( var i=0; i<places.length; i++ ) {
                    // 마커를 생성하고 지도에 표시합니다
                    var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

                    // 마커와 검색결과 항목을 클릭 했을 때
                    // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                    (function(marker, place) {
                        kakao.maps.event.addListener(marker, 'click', function() {
                            displayPlaceInfo(place);
                        });
                    })(marker, places[i]);
            }
        }
        
        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, order) {
            var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                    marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage 
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
        function displayPlaceInfo (place) {
            var content = '<div class="placeinfo">'+
                                      '<a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

            if (place.road_address_name) {
            	content += '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
            	                  '<span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
            }  else {
                content += '<span title="' + place.address_name + '">' + place.address_name + '</span>';
            }                
           
            content += '<span class="tel">' + place.phone + '</span>' +
                              '</div>' +
                              '<div class="after"></div>';

            contentNode.innerHTML = content;
            placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
            placeOverlay.setMap(map);  
        }


        // 각 카테고리에 클릭 이벤트를 등록합니다
        function addCategoryClickEvent() {
            var category = document.getElementById('category'),
                children = category.children;

            for (var i=0; i<children.length; i++) {
                children[i].onclick = onClickCategory;
            }
        }

        // 카테고리를 클릭했을 때 호출되는 함수입니다
        function onClickCategory() {
            var id = this.id,
                className = this.className;

            placeOverlay.setMap(null);

            if (className === 'on') {
                currCategory = '';
                changeCategoryClass();
                removeMarker();
            } else {
                currCategory = id;
                changeCategoryClass(this);
                searchPlaces();
            }
        }

        // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
        function changeCategoryClass(el) {
            var category = document.getElementById('category'),
                children = category.children, i;

            for ( i=0; i<children.length; i++ ) { children[i].className = ''; }
            if (el) { el.className = 'on'; } 
        } 
        
     }    
});    
});

//정상적으로 위치검색이되면, 오버레이담을것임
var overlay = [];

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	overlay.setMap(null);
}
