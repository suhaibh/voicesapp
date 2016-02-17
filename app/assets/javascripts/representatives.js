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
	
	// make a call to google maps api to get longitutde and latitude based on city and state then look up local reps through sunlight
	$location = $('.city-state')
	$.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='+$location.data("city")+$location.data("state")+'&key=AIzaSyCJjdXuDzjx5tOcYNHKuNQLAfeIya566pA', function(data){
		$lat = data.results[0]['geometry']['location']['lat'].toFixed(2);
		$lng = data.results[0]['geometry']['location']['lng'].toFixed(2);
		$.getJSON('http://openstates.org/api/v1/legislators/geo/?lat='+$lat+'&long='+$lng+'&apikey=fc3288f6fc76432cab18b7a00cb4f3a9', function(data){
		$stateLegislator = data;
		// displayStateReps($stateLegislator); don't uncomment this until the function is done
		})
		
	})

	// create method that displays state legislators information and call at the end of json method, argument sould be $stateLegilator[i]
	displayStateReps = function(legislatorInfo){
		// create new div for individual rep and append it to the state reps div
		$stateRepsDiv = $('<div>', {class: "col-xs-12 col-lg-4"}).appendTo($('.state-reps'));
		$('.state-reps').append($stateRepsDiv);
		$("<div>"+ legislatorInfo.last_name +"</div>").appendTo(".state-reps")
	}

});
	
