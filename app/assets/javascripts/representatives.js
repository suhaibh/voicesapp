//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	// Fade in effect on load for representatives and adds offset to first rep for better positioning
	$('.representatives').fadeIn(1000);
	$('.city-state').fadeIn(1000);
	$('.representatives:first').addClass("col-xs-offset-0");
	
	// Adds custom shadow beneath the representatives title based on party affiliation, modification needed for Independents
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
	
	$imgHeight = $('.loaded').first().height();
	$('.state-rep-portrait').height($imgHeight);

});
	
