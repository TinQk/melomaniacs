class HomeController < ApplicationController
	def index
	end

	def discover

		RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)

		@top_artists = []
	  Toplike.count.times do |i|
	    @top_artists << Artist.find(Toplike.all[i].id)
	  end

		@user_likes = current_user.likes.all.reverse
		
	end

end
