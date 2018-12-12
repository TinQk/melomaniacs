class SpotifyTest
	def initialize
	end

	def loop
	  y = 0
	  i = []
	  RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
	  @artists = Artist.all[189000..204000]
	  @artists.each do |artist|
	    artist.popularity = RSpotify::Artist.find(artist.spotify_id).popularity
	    artist.save
	    y += 1
	    puts y
	    if (y%100) == 0
	  	  puts "waiting..."
	  	  sleep(2.0)
	    end
	  end
	end

	def albums
	  z = 0
	  RSpotify::authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
	  @artists = Artist.all[120000..120500]
	  @artists.each do |artist|
	    RSpotify::Artist.find(artist.spotify_id).albums.each do |album|
	  	  puts album.name
	  	  z += 1
	  	  puts z
	    end
	    puts artist.id
	  end
	end

end
