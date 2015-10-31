class RepresentativesController < ApplicationController

	def reps
		# sets @reps to the results array
		@reps = CLIENT.legislators_locate(params[:address]).results
		@rep = CLIENT.legislators_locate(params[:address])
	end

end
