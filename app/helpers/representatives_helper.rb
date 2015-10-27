module RepresentativesHelper
	def city_state
		params[:address]
	end

	def full_title(rep)
		"#{rep.title}. #{rep.first_name} #{rep.last_name} (#{rep.party})"
	end

	def portrait(rep)
		"https://theunitedstates.io/images/congress/225x275/#{rep.bioguide_id}.jpg"
	end
end
