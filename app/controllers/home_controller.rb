class HomeController < ApplicationController
	def index
	end

	def discover
	  @reco = []
	  @top_artists = []
	  @duplicates = []
	  @user_likes = current_user.likes.all.reverse
	  RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)

	  Toplike.count.times do |i|
	    @top_artists << Artist.find(Toplike.all[i].id)
	  end

	  @user_likes.each do |dupli|
	  	@duplicates << dupli.artist.name
	  end

      @user_likes.each_with_index do |like, x|
        i = 1
      	artists = RSpotify::Artist.find(like.artist.spotify_id).related_artists
      	artist = artists[0].name
        while @duplicates.include?(artist) == true do
          artist = artists[i].name
          i += 1
        end
        if artist != nil && @reco.include?(artist) == false
          @reco << artist
        end
        break if x == 15
      end
     
	end
end



        