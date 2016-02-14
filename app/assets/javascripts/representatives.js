//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	$('.representatives').fadeIn(1000);
	$('.city-state').fadeIn(1000);
	$('.representatives:first').addClass("col-xs-offset-0");
	
	$repTitle = $('.rep-title');
	console.log($repTitle);
	for (i = 0; i < $repTitle.length; i++){
		if ($repTitle[i].innerHTML.indexOf("(R)") >= 0){
			$repTitle[i].className += " republican-shadow";
		}
		else {
			$repTitle[i].className += " democrat-shadow";
		}
	}
	
	// make a call to google maps api to get longitutde and latitude based on city and state
	$location = $('.city-state')
	$.getJSON('http://openstates.org/api/v1/legislators/?state='+$location.data('state')+'&apikey=fc3288f6fc76432cab18b7a00cb4f3a9', function(data){
		$stateLegislator = data})
});
	
