$(document).ready(function() {

	jQuery('#searchKey').change(function(){

		var option = jQuery('#searchKey option:selected').val();

		if( option == "day"){

			jQuery('#label').show();

			jQuery('#date').show();

		}else{

			jQuery('#label').hide();

			jQuery('#date').hide();

		}

		

		if(option == "month"){

			jQuery('#searchKey3').show();

			jQuery('#label2').show();

		}else{

			jQuery('#searchKey3').hide();

			jQuery('#label2').hide();

		}

	});

 

	$('#searchBtn').click(function() {

		$('#search').attr('action', 'adminSale.do');

		$('#search').submit();

		

 

	});

	

	

		

});	