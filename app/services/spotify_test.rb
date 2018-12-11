class SpotifyTest
	def initialize
		
	end

	def loop
	  y = 0
	  i = []
	  RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
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
	  RSpotify::authenticate("2fc8c7db0a584ecc97c8789e10b1ba14", "3e31ba14f979474ab69880fafd410829")
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