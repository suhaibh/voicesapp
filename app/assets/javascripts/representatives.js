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
	
	// make a call to google maps api to get longitutde and latitude based on city and state then look up local reps through sunlight
	$location = $('.city-state')
	$.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='+$location.data("city")+$location.data("state")+'&key=AIzaSyCJjdXuDzjx5tOcYNHKuNQLAfeIya566pA', function(data){
		$lat = data.results[0]['geometry']['location']['lat'].toFixed(2);
		$lng = data.results[0]['geometry']['location']['lng'].toFixed(2);
		$.getJSON('http://openstates.org/api/v1/legislators/geo/?lat='+$lat+'&long='+$lng+'&apikey=fc3288f6fc76432cab18b7a00cb4f3a9', function(data){
		$stateLegislator = data;
		displayStateReps($stateLegislator);
		})
		
	})

	// create method that displays state legislators information and call at the end of json method
	displayStateReps = function(legislatorInfo){
		$("<p>"+ legislatorInfo[0].last_name +"</p>").appendTo(".state-reps")
	}

});
	
