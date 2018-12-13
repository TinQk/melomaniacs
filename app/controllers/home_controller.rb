class HomeController < ApplicationController
	def index
	  @url = []
	  @top = 
	  RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
	  Toplike.all.count.times do |i|

	      @url << RSpotify::Artist.find("#{Artist.find(Toplike.all[i].id).spotify_id}")

	  end
	  puts @url
	end
end
