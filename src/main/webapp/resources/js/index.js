//[1]기상 예보정보
/*
    $.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1835848&APPID=7a1fb730b57cbce475267bfe4eda7488&units=metric', function(data){
        var $cDate = data.list[0].dt_txt;
        var $cTemp = data.list[0].main.temp;
        var $minTemp = data.list[0].main.temp_min;
        var $maxTemp = data.list[0].main.temp_max;
        var $wIcon = data.list[0].weather[0].icon;

        //A.appendTo(B) B요소의 내용 뒤에 A를추가
        //A.append(B) A요소의 내용 뒤에 B를추가
        //A.prependTo(B) B요소의 내용 앞에 A를추가
        //A.prepend(B) A요소의 내용 앞에 B를추가

        $('.ctemp').append($cTemp);
        $('.clowtemp').append($minTemp);
        $('.chightemp').append($maxTemp);
        $('h2').prepend($cDate);
        $('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png" />');
    });
*/

//[2]기상 현재정보
    $.getJSON('http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=7a1fb730b57cbce475267bfe4eda7488&units=metric', function(data){
        var $cTemp = data.main.temp;
        var $minTemp = data.main.temp_min;
        var $maxTemp = data.main.temp_max;
        var $wIcon = data.weather[0].icon;

        //현재시간출력방법들
        console.log(new Date(Date.now()));
        console.log(Date.now());
        console.log($.now());

        var $now = new Date($.now());
        console.log($now.getFullYear()+'/'+($now.getMonth()+1)+'/'+$now.getDate()+'/'+$now.getHours()+':'+$now.getMinutes());    /*월은 value=0이 1월*/
        var $cDate = $now.getFullYear()+'/'+($now.getMonth()+1)+'/'+$now.getDate()+'/'+$now.getHours()+':'+$now.getMinutes();

        $('.ctemp').append($cTemp);
        $('.clowtemp').append($minTemp);
        $('.chightemp').append($maxTemp);
        $('h2').prepend($cDate);
        $('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png" />');
    });
    

//[3]현재 기상정보뷰
    $(function () {
    	
    	$.getJSON("http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=7a1fb730b57cbce475267bfe4eda7488&units=metric",function(data){	
    	var cTemp = data.main.temp,	
    		cLowTemp = data.main.temp_min,	
    		cHighTemp = data.main.temp_max,
    		chumidity = data.main.humidity,
    		cIcon = data.weather[0].icon,	
    		
    		iconUrl = 'http://openweathermap.org/img/w/';
    		
        $("#sunshine .percent-number").text(cTemp);	
    	$(".clowtemp").append(cLowTemp);	
    	$(".chightemp").append(cHighTemp);	
    	$("#water .percent-number").text(chumidity);	
    	$("#sunshine .icon").attr('src', iconUrl + cIcon +'.png');	
    	
        });		

        setTimeout(activateScene, 400);


        function activateScene () {

            var $content = $('#scene-2-content'),
                $charts = $content.find('.chart');

            $content.stop(true).animate({
                right: 0
            }, 1200, 'easeInOutQuint');

    $charts.each(function(){
    var $this = $(this), 
        $circleLeft = $this.find('.left .circle-mask-inner'), 
        $circleRight = $this.find('.right .circle-mask-inner'),
        $percentContainer = $this.find('.percent-number'),
        $percentNumber = $percentContainer.text();

        $circleLeft.add($circleRight).css({transform:'rotate(0)'});

        $percentContainer.text(0);

        $({rate:0}).animate({rate:$percentNumber},{
            duration:1500,
            progress:function(){
                var now = Math.floor(this.rate),
                      deg = now * 360 / 100,
                      degRight = Math.min(deg, 180),
                      degLeft = Math.max(deg - 180, 0);
                      
                $percentContainer.text(now);
                $circleLeft.css({transform:'rotate(' + degLeft + 'deg)'});
                $circleRight.css({transform:'rotate(' + degRight + 'deg)'});
                
                
            }
        });

    });
    		
    		

        }//activateScene
    	
    	

    });

