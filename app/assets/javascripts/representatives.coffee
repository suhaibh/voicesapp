# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.representatives').fadeIn(1000)
	$('.city-state').fadeIn(1000)
	$('.representatives:first').addClass("col-xs-offset-0")