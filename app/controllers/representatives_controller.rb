class RepresentativesController < ApplicationController

	def reps
		@address = "#{params[:city]} #{params[:state]}" 		# Formats params information in a way that can be used by Sunlight Foundation API
		@reps = CLIENT.legislators_locate(@address).results		# Stores Sunlight API information in instance variable
		# @rep = CLIENT.legislators_lcate(params[:address], params[:state])
	end

end
