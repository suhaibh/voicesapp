module RepresentativesHelper
	def city_state
		params[:city] + ", " + params[:state]
	end

	def full_title(rep)
		"#{rep.title}. #{rep.first_name} #{rep.last_name} (#{rep.party})"
	end

	def portrait(rep)
		"https://theunitedstates.io/images/congress/225x275/#{rep.bioguide_id}.jpg"
	end

	def rep_facebook(rep)
		if rep.facebook_id
			link_to("https://www.facebook.com/#{rep.facebook_id}", target: "_blank") do
				content_tag(:i, "", class: "fa fa-facebook-official fa-lg rep-facebook contact-link")
			end
		end
	end

	def rep_twitter(rep)
		if rep.twitter_id
			link_to("https://www.twitter.com/#{rep.twitter_id}", target: "_blank", class: "contact-link") do
				content_tag(:i, "", class: "fa fa-twitter fa-lg rep-twitter")
			end
		end
	end

	def rep_email(rep)
		mail_to("#{rep.oc_email}") do 
			content_tag(:i, "", class: "fa fa-envelope fa-lg contact-link")
		end
	end

end
