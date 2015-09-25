class RepresentativesController < ApplicationController

	def reps
		@reps = CLIENT.legislators_locate(params[:address])
	end

end
