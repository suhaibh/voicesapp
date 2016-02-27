class RepresentativesController < ApplicationController
	
	def reps
		@address = "#{params[:city]} #{params[:state]}" 		# Formats params information in a way that can be used by Sunlight Foundation API
		@reps = CLIENT.legislators_locate(@address).results		# Stores Sunlight API information in instance variable
		# @rep = CLIENT.legislators_lcate(params[:address], params[:state])
		
		# get latitude and longitude using google maps api and store in instance variables, see if you can get away with local variables
		gmaps_response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:state]}+#{params[:city]}&key=AIzaSyCJjdXuDzjx5tOcYNHKuNQLAfeIya566pA")
		@lat = "%.2f" % gmaps_response.parsed_response["results"][0]["geometry"]["location"]["lat"]
		@lng = "%.2f" % gmaps_response.parsed_response["results"][0]["geometry"]["location"]["lng"]

		# here you'll pass the latitude and longitude into the open states api
		@state_reps = (HTTParty.get("http://openstates.org/api/v1/legislators/geo/?lat=#{@lat}&long=#{@lng}&apikey=fc3288f6fc76432cab18b7a00cb4f3a9")).parsed_response
	end

end
