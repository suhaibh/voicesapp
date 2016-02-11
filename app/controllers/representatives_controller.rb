class RepresentativesController < ApplicationController

	def reps
		@address = "#{params[:city]} #{params[:state]}"
		@reps = CLIENT.legislators_locate(@address).results
		# @rep = CLIENT.legislators_locate(params[:address], params[:state])
	end

end
