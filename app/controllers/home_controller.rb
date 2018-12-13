class HomeController < ApplicationController
	def index
	end

	def discover
	  @top_artists = []
	  RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
	  Toplike.count.times do |i|
	    @top_artists << Artist.find(Toplike.all[i].id)
	  end
	end
end
