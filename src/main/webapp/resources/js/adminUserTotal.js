$(document).ready(function(){	
	$('#searchBtn').click(function(){
		
		$('#search').attr('action','adminUserTotal.do');
		$('#search').submit();
	});

});