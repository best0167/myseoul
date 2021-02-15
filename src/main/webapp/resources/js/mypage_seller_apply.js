$(document).ready(function(e){
	
});/////////////////////////


function inputNumber(obj){
	var number = obj.value.replace(/[^0-9]/g, "");
    var sellNum = "";
    console.log(number);
    
    if(number.length < 4){
		return number;
	}else if(number.length < 6){
		sellNum += number.substr(0,3);
		sellNum += "-";
		sellNum += number.substr(3);
	}else{

		sellNum += number.substr(0, 3);
		sellNum += "-";
		sellNum += number.substr(3, 2);
		sellNum += "-";
		sellNum += number.substr(5);
	}
	obj.value = sellNum;
}