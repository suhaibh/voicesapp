class RepresentativesController < ApplicationController

	def reps
		@reps = Congress.legislators_locate(params[:address])
	end

end
